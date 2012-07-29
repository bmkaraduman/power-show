namespace SavingsAnalysis.AnalysisEngine.Core
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.IO;

    using SavingsAnalysis.Common;

    internal class SqlBulkInsertAdapter : IDisposable
    {
        #region Fields

        private readonly int batchSize;

        private readonly string connectionString;

        private DataTable dataTable;

        #endregion

        #region Constructors and Destructors

        internal SqlBulkInsertAdapter(string schemaFileName, string connectionString, int batchSize = 1000)
        {
            this.connectionString = connectionString;
            this.batchSize = batchSize;
            this.dataTable = this.GenerateDataTableFromXmlFile(schemaFileName);

            // use the db connections to create table schema in the database
            SqlTableBuilder.CreateTableSchemaFromDataTable(connectionString, this.dataTable);
        }

        ~SqlBulkInsertAdapter()
        {
            // Finalizer calls Dispose(false)
            this.Dispose(false);
        }

        #endregion

        #region Public Methods and Operators

        public void Dispose()
        {
            this.Dispose(true);
            GC.SuppressFinalize(this);
        }

        #endregion

        #region Methods

        internal void BulkInsert(string dataFile)
        {
            using (var csv = new CsvFileReader(dataFile))
            {
                var row = new CsvRow();
                var fieldList = new List<string>();
                bool firstRow = true;
                while (csv.ReadRow(row))
                {
                    if (firstRow)
                    {
                        fieldList.AddRange(row);
                        firstRow = false;
                    }
                    else
                    {
                        DataRow dataRow = this.dataTable.NewRow();
                        for (int i = 0; i < fieldList.Count; i++)
                        {
                            dataRow[fieldList[i]] = row[i].Length > 0 ? (object)row[i] : DBNull.Value;
                        }

                        this.dataTable.Rows.Add(dataRow);
                    }

                    if (this.dataTable.Rows.Count >= this.batchSize)
                    {
                        this.dataTable.AcceptChanges();
                        this.BulkInsertIntoDatabase();
                        this.dataTable.Rows.Clear();
                    }
                }

                if (this.dataTable.Rows.Count > 0)
                {
                    this.dataTable.AcceptChanges();
                    this.BulkInsertIntoDatabase();
                    this.dataTable.Rows.Clear();
                }
            }
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                // free managed resources
                if (this.dataTable != null)
                {
                    this.dataTable.Dispose();
                    this.dataTable = null;
                }
            }
        }

        private void BulkInsertIntoDatabase()
        {
            using (var connection = new SqlConnection(this.connectionString))
            {
                connection.Open();
                using (var bulkCopy = new SqlBulkCopy(connection))
                {
                    bulkCopy.BatchSize = this.batchSize;
                    bulkCopy.DestinationTableName = string.Format("[dbo].[{0}]", this.dataTable.TableName);
                    bulkCopy.WriteToServer(this.dataTable);
                }

                connection.Close();
            }
        }

        private DataTable GenerateDataTableFromXmlFile(string sourceFile)
        {
            var deserializer = new DataTableStructureSerializer();
            string xml = File.ReadAllText(sourceFile);
            DataTable table = deserializer.Deserialize(xml);

            // Use the filename to determine the table name
            table.TableName = Path.GetFileNameWithoutExtension(sourceFile);
            return table;
        }

        #endregion
    }
}