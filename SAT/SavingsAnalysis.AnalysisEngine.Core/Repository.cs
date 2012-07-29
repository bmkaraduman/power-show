namespace SavingsAnalysis.AnalysisEngine.Core
{
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using System.IO;

    public class Repository
    {
        #region Fields

        private readonly string repositoryName;

        #endregion

        #region Constructors and Destructors

        internal Repository(string name, string connectionString)
        {
            this.repositoryName = name;
            this.ConnectionString = connectionString;
        }

        #endregion

        #region Public Properties

        public string ConnectionString { get; private set; }

        #endregion

        #region Public Methods and Operators

        public static string BuildConnectionString(string connectionStingTemplate, string databaseName)
        {
            var sqlString = new SqlConnectionStringBuilder(connectionStingTemplate);
            sqlString.InitialCatalog = databaseName;
            return sqlString.ConnectionString;
        }

        public static void DropDatabase(string connectionString, string fileName)
        {
            string createDbString =
                string.Format(
                    "IF EXISTS (SELECT 1 FROM sys.databases WHERE name = '{0}') DROP DATABASE [{0}]", fileName);
            ExecuteQueryOnMaster(connectionString, createDbString);
        }

        public static int ExecuteQueryOnMaster(string connectionString, string sqlQuery)
        {
            var masterConnectionString = new SqlConnectionStringBuilder(connectionString) { InitialCatalog = "master" };

            using (var connection = new SqlConnection(masterConnectionString.ConnectionString))
            {
                connection.Open();
                var command = new SqlCommand(sqlQuery, connection);
                return command.ExecuteScalar() == null ? 0 : 1;
            }
        }

        public void CreateDatabase()
        {
            // create the instance specific database first;
            // but we need to connect to the master
            string createDbString =
                string.Format(
                    "IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = '{0}') create database [{0}]", 
                    this.repositoryName);
            ExecuteQueryOnMaster(this.ConnectionString, createDbString);
            this.ConnectionString = BuildConnectionString(this.ConnectionString, this.repositoryName);
        }

        public bool DatabaseExists()
        {
            string checkDbExists = string.Format("SELECT 1 FROM sys.databases WHERE name = '{0}'", this.repositoryName);

            int ret = ExecuteQueryOnMaster(this.ConnectionString, checkDbExists);

            this.ConnectionString = BuildConnectionString(this.ConnectionString, this.repositoryName);
            return ret == 1;
        }

        #endregion

        #region Methods

        internal void PopulateDataFrom(string directory)
        {
            var directoryInfo = new DirectoryInfo(directory);
            IEnumerable<FileInfo> schemaFiles = directoryInfo.EnumerateFiles("*.xml");
            var schemaToCsvDictionary = new Dictionary<string, string>();
            foreach (FileInfo schema in schemaFiles)
            {
                if (schema.DirectoryName != null)
                {
                    schemaToCsvDictionary.Add(
                        schema.FullName,
                        string.Format(@"{0}\{1}.csv", schema.DirectoryName, Path.GetFileNameWithoutExtension(schema.FullName)));
                }
            }

            foreach (var entry in schemaToCsvDictionary)
            {
                using (var bulkInserter = new SqlBulkInsertAdapter(entry.Key, this.ConnectionString))
                {
                    bulkInserter.BulkInsert(entry.Value);
                }
            }
        }

        #endregion
    }
}