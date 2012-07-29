namespace SavingsAnalysis.Common
{
    using System.Data;
    using System.Data.SqlClient;

    public class SqlTableBuilder
    {
        public static void CreateTableSchemaFromDataTable(string connectionString, DataTable dataTable)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                var createSql = CreateSqlStatementFromDataTable(dataTable.TableName, dataTable);
                var dropPrefix =
                    string.Format(
                        "IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'{0}'))DROP TABLE {0} ", 
                        dataTable.TableName);

                // drop the table if it exists before
                createSql = createSql.Insert(0, dropPrefix);
                using (var cmd = new SqlCommand(createSql, connection))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static string CreateSqlStatementFromDataTable(string tableName, DataTable dt)
        {
            var sql = "CREATE TABLE [" + tableName + "] (\n";

            // Columns
            foreach (DataColumn column in dt.Columns)
            {
                sql += "[" + column.ColumnName + "] " + SqlGetType(column) + ",\n";
            }

            sql = sql.TrimEnd(new[] { ',', '\n' }) + "\n";

            // primary keys
            if (dt.PrimaryKey.Length > 0)
            {
                sql += "CONSTRAINT [PK_" + tableName + "] PRIMARY KEY CLUSTERED (";
                foreach (DataColumn column in dt.PrimaryKey)
                {
                    sql += "[" + column.ColumnName + "],";
                }

                sql = sql.TrimEnd(new[] { ',' }) + "))\n";
            }

            if ((dt.PrimaryKey.Length == 0) && (!sql.EndsWith(")")))
            {
                sql += ")";
            }

            return sql;
        }

        private static string SqlGetType(DataColumn column)
        {
            return SqlTypeConverter.BuildSqlType(column.DataType, column.MaxLength, 10, 2);
        }
    }
}
