using System.Data;
using System.IO;
using SavingsAnalysis.Common;

namespace SavingsAnalysis.Client.Common
{
    public class SqlQueryCsvWriter
    {
        public void WriteQueryData(DataTable dataTable, string baseDirectory, string dataTableName)
        {
            var fileName = Path.Combine(baseDirectory, dataTableName + ".csv");
            var metadataFile = Path.Combine(baseDirectory, dataTableName + ".xml");

            CreateMetaData(dataTable, metadataFile);

            var csvExporter = new DataTableToCsvAdapter();
            csvExporter.WriteDataTable(dataTable, fileName);
        }

        public void AppendQueryData(DataTable dataTable, string baseDirectory, string dataTableName)
        {
           var fileName = Path.Combine(baseDirectory, dataTableName + ".csv");

           var csvExporter = new DataTableToCsvAdapter();
           csvExporter.AppendDataTable(dataTable, fileName);
        }

        private static void CreateMetaData(DataTable dataTable, string filePath)
        {
            var serialzer = new DataTableStructureSerializer();
            var doc = serialzer.Serialize(dataTable);
            doc.Save(filePath);
        }
    }
}
