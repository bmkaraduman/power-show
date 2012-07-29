namespace SavingsAnalysis.Client.Common
{
    using System;
    using System.Data;
    using System.Data.SqlClient;

    public class SqlQueryResultSerializer
    {
        #region Fields

        private readonly string outputDirectory;

        private readonly IQueryExecutor queryExecutor;

        private string connectionString;

        #endregion

        #region Constructors and Destructors

        public SqlQueryResultSerializer(IQueryExecutor queryExecutor, string connectionString, string outputDirectory)
        {
            this.queryExecutor = queryExecutor;
            this.connectionString = connectionString;
            this.outputDirectory = outputDirectory;
        }

        #endregion

        #region Public Methods and Operators

        public long SerializeQueryResult(
            string query, string queryName, SqlParameter[] parameters, Action<string> progress)
        {
            var csvWriter = new SqlQueryCsvWriter();
            bool firstBatch = true;
            long totalRowsExtracted = 0;
            foreach (DataTable result in this.queryExecutor.ExecuteQueryEnumerator(query, queryName, parameters))
            {
                if (firstBatch)
                {
                    firstBatch = false;
                    csvWriter.WriteQueryData(result, this.outputDirectory, queryName);
                    progress(string.Format("Extracted {0} rows from {1}", result.Rows.Count, result.TableName));
                }
                else
                {
                    csvWriter.AppendQueryData(result, this.outputDirectory, queryName);
                    progress(string.Format("Extracted {0} rows from {1}", result.Rows.Count, result.TableName));
                }

                totalRowsExtracted += result.Rows.Count;
            }

            progress(string.Format("Total {0} rows extraced from {1}", totalRowsExtracted, queryName));
            return totalRowsExtracted;
        }

        #endregion
    }
}