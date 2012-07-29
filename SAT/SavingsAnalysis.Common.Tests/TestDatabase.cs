namespace SavingsAnalysis.Common.Tests
{
    using System.Data;
    using System.Data.SqlClient;

    public class TestDatabase
    {
        private const string ApplicationName = "SavingsAnalysisUnitTests";

        private readonly string databaseName;
        private readonly string sqlServerName;
        private readonly string connectionString;

        public TestDatabase(string databaseName, string sqlServerName)
        {
            this.databaseName = databaseName;
            this.sqlServerName = sqlServerName;
            this.connectionString = new SqlConnectionStringBuilder
                                    {
                                        ApplicationName = ApplicationName,
                                        DataSource = this.sqlServerName,
                                        InitialCatalog = this.databaseName,
                                        IntegratedSecurity = true,
                                        Pooling = false
                                    }.ToString();
        }

        public string ConnectionString
        {
            get
            {
                return connectionString;
            }
        }

        public void Create()
        {
            var sql = string.Format("CREATE DATABASE [{0}]", databaseName);
            ExecuteSqlOnMaster(sql);
        }

        public void Delete()
        {
            var sql = string.Format("IF EXISTS (SELECT 1 FROM sys.databases WHERE name = '{0}') DROP DATABASE [{0}]", databaseName);
            ExecuteSqlOnMaster(sql);
        }

        private void ExecuteSqlOnMaster(string sql)
        {
            var connectionBuilder = new SqlConnectionStringBuilder
                                        {
                                            ApplicationName = ApplicationName,
                                            DataSource = sqlServerName,
                                            InitialCatalog = "master",
                                            IntegratedSecurity = true
                                        };

            var masterConnectionString = connectionBuilder.ToString();

            using (var cnn = new SqlConnection(masterConnectionString))
            {
                cnn.Open();
                using (var cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}