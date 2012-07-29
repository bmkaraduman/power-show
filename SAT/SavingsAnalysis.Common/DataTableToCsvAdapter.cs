namespace SavingsAnalysis.Common
{
    using System;
    using System.Data;

    public class DataTableToCsvAdapter
    {
        public void WriteDataTable(DataTable table, string filename)
        {
            var exportData = GetExportData(table);
            exportData.ExportToFile(filename);
        }

        public void AppendDataTable(DataTable table, string filename)
        {
           var exportData = GetExportData(table);
           exportData.AppendToFile(filename);
        }

        private static CsvWriter GetExportData(DataTable table)
        {
            var exportData = new CsvWriter();

            Type dateTimeType = typeof(DateTime);
            foreach (DataRow row in table.Rows)
            {
                exportData.AddRow();
                for (var i = 0; i < table.Columns.Count; ++i)
                {
                    var columnName = table.Columns[i].ColumnName;
                    string value;
                    if (table.Columns[i].DataType == dateTimeType)
                    {
                        value = row[columnName] is DBNull
                                    ? string.Empty
                                    : ((DateTime)row[columnName]).ToString("yyyy-MM-dd HH:mm:ss.fff");
                    }
                    else
                    {
                        value = row[columnName] is DBNull ? string.Empty : row[columnName].ToString();
                    }

                    exportData[columnName] = value;
                }
            }

            return exportData;
        }
    }
}
