namespace SavingsAnalysis.Common
{
    using System;
    using System.Data;
    using System.Data.SqlClient;

    /// <summary>
    /// A more concise version of the SqlHelper class (from Microsoft Application Block) while 
    /// still being .NET 2.0 compatible. Uses funky flow-style syntax.
    /// </summary>
    /// <remarks>
    /// The idea was to separate out the calling style (i.e. different combinations of connection, 
    /// parameters, timeouts, etc) from the what-to-do-with-the-query logic. 
    /// 
    /// var rowCount = SqlExecuter.FromText.ForRowsAffected.Execute(connection, "select * from blah");
    /// var myTable = SqlExecuter.FromStoredProc.ForDataTable.Execute(connectionString, "spMyProcedure", new [] { new SqlParameter("@someParam", "SomeValue1") });
    /// 
    /// TODO: Xml reader stuff as required
    /// </remarks>
    public class SqlExec
    {
        /// <summary>
        /// Execute a SQL command
        /// </summary>
        public static readonly SqlExec FromText = new SqlExec(CommandType.Text);

        /// <summary>
        /// Execute a stored procedure
        /// </summary>
        public static readonly SqlExec FromStoredProc = new SqlExec(CommandType.StoredProcedure);

        /// <summary>
        /// Executes a SqlCommand and returns a DataTable
        /// </summary>
        public readonly Executer<DataTable> ForDataTable;

        /// <summary>
        /// Executes a SqlCommand and returns the rows-affected count (using ExecuteNonQuery)
        /// </summary>
        public readonly Executer<int> ForRowsAffected; 

        /// <summary>
        /// Executes a SqlCommand and returns the first item from the first row
        /// </summary>
        public readonly Executer<object> ForScalar;

        /// <summary>
        /// Executes a SqlCommand and returns a DataSet
        /// </summary>
        public readonly Executer<DataSet> ForDataSet;

        /// <summary>
        /// Executes a SqlCommand and returns a data reader, which, when disposed of, will close the 
        /// associated connection
        /// </summary>
        /// <remarks>
        /// Although it feels a bit weird not to Dispose() the connection itself, the CommandBehavior
        /// makes sure the connection is closed cleanly. In practise, the only difference between
        /// closing the connection this way and calling Dispose() is that the Disposing event is raised.
        /// Otherwise the behaviour is identical. I checked.
        /// </remarks>
        public readonly Executer<SqlDataReader> ForDataReader;

        /// <summary>
        /// Executes a SqlCommand and returns a data reader. The associated connection will remain open.
        /// Use this only if you are providing the connection for the executer. Do not use when
        /// specifying a connection string.
        /// </summary>
        public readonly Executer<SqlDataReader> ForDataReaderUntracked;

        static SqlExec()
        {
            DefaultCommandTimeout = TimeSpan.FromSeconds(new SqlCommand().CommandTimeout);
        }

        private SqlExec(CommandType commandType)
        {
            // Initialize our executers - basic...
            ForRowsAffected = new Executer<int>(commandType, false, cmd => cmd.ExecuteNonQuery());
            ForScalar = new Executer<object>(commandType, false, cmd => cmd.ExecuteScalar());
            ForDataReader = new Executer<SqlDataReader>(commandType, true, cmd => cmd.ExecuteReader(CommandBehavior.CloseConnection));
            ForDataReaderUntracked = new Executer<SqlDataReader>(commandType, true, cmd => cmd.ExecuteReader());

            // ... and complex. Alas StyleCop forces ugly syntax :(
            ForDataTable = new Executer<DataTable>(
                commandType,
                false,
                cmd =>
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        var table = new DataTable();
                        table.Load(reader);
                        return table;
                    }
                });

            ForDataSet = new Executer<DataSet>(
                commandType,
                false,
                cmd =>
                {
                    var adapter = new SqlDataAdapter(cmd);
                    var ds = new DataSet();
                    adapter.Fill(ds);
                    return ds;
                });
        }

        /// <remarks>
        /// Func[T1, T2] is not available in .NET 2, so declare our own (specialized) version of it here
        /// </remarks>
        internal delegate T SqlCommandProcessor<out T>(SqlCommand cmd);

        /// <summary>
        /// Gets or sets a value indicating how long to wait for an execution to complete if a per-execution
        /// timeout has not been specified
        /// </summary>
        public static TimeSpan DefaultCommandTimeout { get; set; }

        /// <summary>
        /// Provides short-hand methods for generic query execution
        /// </summary>
        /// <typeparam name="T">What the query will return</typeparam>
        /// <remarks>Should really be behind an interface</remarks>
        public class Executer<T>
        {
            private readonly SqlCommandProcessor<T> processor;
            private readonly bool suppressConnectionDispose;
            private readonly CommandType commandType;

            internal Executer(CommandType commandType, bool suppressConnectionDispose, SqlCommandProcessor<T> processor)
            {
                this.commandType = commandType;
                this.processor = processor;
                this.suppressConnectionDispose = suppressConnectionDispose;
            }

            #region Overloads for connection string only

            public T Execute(string connectionString, string text, TimeSpan timeout)
            {
                return DoCommand(connectionString, text, null, timeout);
            }

            public T Execute(string connectionString, string text)
            {
                return DoCommand(connectionString, text, null, DefaultCommandTimeout);
            }

            public T Execute(string connectionString, string text, SqlParameter[] parameters, TimeSpan timeout)
            {
                return DoCommand(connectionString, text, parameters, timeout);
            }

            public T Execute(string connectionString, string text, SqlParameter[] parameters)
            {
                return DoCommand(connectionString, text, parameters, DefaultCommandTimeout);
            }

            #endregion

            #region Overloads for existing connection only

            public T Execute(SqlConnection connection, string text, TimeSpan timeout)
            {
                return DoCommand(connection, null, text, null, timeout);
            }

            public T Execute(SqlConnection connection, string text)
            {
                return DoCommand(connection, null, text, null, DefaultCommandTimeout);
            }

            public T Execute(SqlConnection connection, string text, SqlParameter[] parameters, TimeSpan timeout)
            {
                return DoCommand(connection, null, text, parameters, timeout);
            }

            public T Execute(SqlConnection connection, string text, SqlParameter[] parameters)
            {
                return DoCommand(connection, null, text, parameters, DefaultCommandTimeout);
            }

            #endregion

            #region Use a transaction (if you've got a transaction then the connection can be implied from it - no need to pass connection parameter itself)

            public T Transact(SqlTransaction trans, string text, TimeSpan timeout)
            {
                return DoCommand(trans.Connection, trans, text, null, timeout);
            }

            public T Transact(SqlTransaction trans, string text)
            {
                return DoCommand(trans.Connection, trans, text, null, DefaultCommandTimeout);
            }

            public T Transact(SqlTransaction trans, string text, SqlParameter[] parameters, TimeSpan timeout)
            {
                return DoCommand(trans.Connection, trans, text, parameters, timeout);
            }

            public T Transact(SqlTransaction trans, string text, SqlParameter[] parameters)
            {
                return DoCommand(trans.Connection, trans, text, parameters, DefaultCommandTimeout);
            }

            #endregion

            #region Internal execution methods

            private T DoCommand(string connectionString, string commandText, SqlParameter[] parameters, TimeSpan timeout)
            {
                var connection = new SqlConnection(connectionString);
                try
                {
                    connection.Open();
                    return DoCommand(connection, null, commandText, parameters, timeout);
                }
                finally
                {
                    if (!suppressConnectionDispose)
                    {
                        connection.Dispose();
                    }
                }
            }

            private T DoCommand(SqlConnection connection, SqlTransaction trans, string commandText, SqlParameter[] parameters, TimeSpan timeout)
            {
                if (connection == null)
                {
                    throw new ArgumentNullException("connection");
                }

                using (var cmd = connection.CreateCommand())
                {
                    cmd.CommandType = this.commandType;
                    cmd.CommandTimeout = Convert.ToInt32(timeout.TotalSeconds);
                    cmd.CommandText = commandText;

                    if (trans != null)
                    {
                        cmd.Transaction = trans;
                    }

                    if (parameters != null)
                    {
                        // Use an indexer rather than foreach to save creating an enumerator
                        for (var i = 0; i < parameters.Length; i++)
                        {
                            cmd.Parameters.Add(parameters[i]);
                        }
                    }

                    return processor(cmd);
                }
            }

            #endregion
        }
    }
}
