using System;
using System.Collections.Generic;

namespace SavingsAnalysis.Client.Common
{
    using System.Data;
    using System.Data.SqlClient;

    public class SqlQueryExecutor : IQueryExecutor
    {

        private readonly int commandExecutionTimeout;
        private readonly string connectionString;
        public SqlQueryExecutor(string connectionString, int executionTimeout = 900)
        {
           commandExecutionTimeout = executionTimeout;
           this.connectionString = connectionString;
        }

        public DataTable ExecuteQuery(string query, string dataTableName, SqlParameter[] parameters)
        {
           using (var connection = new SqlConnection(connectionString))
           {
              connection.Open();
              using (var command = connection.CreateCommand())
              {
                 command.CommandText = query;
                 command.CommandTimeout = commandExecutionTimeout;
                 command.CommandType = CommandType.Text;
                 if (parameters != null)
                 {
                    command.Parameters.AddRange(parameters);
                 }

                 using (var reader = command.ExecuteReader())
                 {
                    var dataSet = new DataSet();
                    var table = new DataTable(dataTableName);

                    dataSet.Tables.Add(table);
                    dataSet.Load(reader, LoadOption.OverwriteChanges, table);

                    return table;
                 }
              }
           }
        }

        public IEnumerable<DataTable> ExecuteQueryEnumerator(string query, string dataTableName, SqlParameter[] parameters)
        {
           using (var connection = new SqlConnection(connectionString))
           {
              connection.Open();
              using (var command = connection.CreateCommand())
              {
                 command.CommandText = query;
                 command.CommandTimeout = commandExecutionTimeout;
                 command.CommandType = CommandType.Text;
                 if (parameters != null)
                 {
                    command.Parameters.AddRange(parameters);
                 }

                 using (var reader = command.ExecuteReader())
                 {
                    DataTable table = new DataTable(dataTableName);
                    DataTable schemaTable = reader.GetSchemaTable();
                    //For each field in the table...
                    if (schemaTable != null)
                    {
                       foreach (DataRow drow in schemaTable.Rows)
                       {
                          string columnName = System.Convert.ToString(drow["ColumnName"]);
                          var dataType = (Type)(drow["DataType"]);
                          DataColumn column = new DataColumn(columnName, dataType);
                          if (dataType == typeof(string)) column.MaxLength = (int)drow["ColumnSize"];
                          column.AllowDBNull = (bool)drow["AllowDBNull"];
                          table.Columns.Add(column);
                       }
                    }
                    while (reader.Read())
                    {
                       var row = table.NewRow();
                       var items = new object[reader.FieldCount];
                       if (reader.GetValues(items) > 0)
                       {
                          for (int i = 0; i < items.Length; i++)
                          {
                             row[i] = items[i];
                          }
                          table.Rows.Add(row);
                          if (table.Rows.Count == 10000)
                          {
                             yield return table;
                             table = new DataTable(dataTableName);
                             //For each field in the table...
                             if (schemaTable != null)
                             {
                                foreach (DataRow drow in schemaTable.Rows)
                                {
                                   string columnName = System.Convert.ToString(drow["ColumnName"]);
                                   var dataType = (Type)(drow["DataType"]);
                                   DataColumn column = new DataColumn(columnName, dataType);
                                   if (dataType == typeof(string)) column.MaxLength = (int)drow["ColumnSize"];
                                   column.AllowDBNull = (bool)drow["AllowDBNull"];
                                   table.Columns.Add(column);
                                }
                             }
                          }
                       }
                    }
                    yield return table;
                 }
              }
           }
        }
        
    }
}
