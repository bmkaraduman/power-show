using System;
using System.Data;
using System.Data.SqlClient;
using NUnit.Framework;
using SavingsAnalysis.Common;
using SavingsAnalysis.Common.Tests;

namespace SavingsAnalysis.AnalysisEngine.Core.Tests
{
   [TestFixture]
    public class SqlAnalysisEngineTests
    {
        private const string DatabaseName = "TestDB";
        private const string Server = "localhost";

        private readonly TestDatabase testDatabase = new TestDatabase(DatabaseName, Server);

        [SetUp]
        public void SetupEnviroment()
        {
            this.testDatabase.Delete();
            this.testDatabase.Create();
        }

        [TearDown]
        public void TearDown()
        {
            this.testDatabase.Delete();
        }
        
        // create the table from Datatable in database and check if the table creation succeeds
        [Test]
        public void CreateDataTableInDatabaseTest()
        {
            const string TableName = "TempTable";

            // create the datatable and add some columns
            var dataTable = new DataTable();
            dataTable.TableName = TableName;
            dataTable.Columns.Add(
                new DataColumn() { DataType = Type.GetType("System.Int32"), ColumnName = "RowID", AutoIncrement = true });
            dataTable.Columns.Add(
                new DataColumn() { DataType = Type.GetType("System.String"), ColumnName = "Col1" });
            dataTable.Columns.Add(
                new DataColumn() { DataType = Type.GetType("System.Int32"), ColumnName = "Col2" });

            SqlTableBuilder.CreateTableSchemaFromDataTable(testDatabase.ConnectionString, dataTable);

            Assert.IsTrue(this.TableExists(TableName, testDatabase.ConnectionString));
        }

        public bool TableExists(string tableName, string connectionString)
        {
            const int Target = 1;
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = connection;
                    cmd.CommandText = "select COUNT (*) from information_schema.Tables where TABLE_NAME=@table_name";

                    var tableParameter = new SqlParameter("@table_name", SqlDbType.VarChar) { Value = tableName };
                    cmd.Parameters.Add(tableParameter);

                    var result = cmd.ExecuteScalar();
                    return int.Parse(result.ToString()) == Target;
                }
            }
        }
    }
}
