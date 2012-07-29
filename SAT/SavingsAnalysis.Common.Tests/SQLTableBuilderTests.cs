namespace SavingsAnalysis.Common.Tests
{
    using System.Data;

    using NUnit.Framework;

    [TestFixture]
    public class SQLTableBuilderTests
    {
        [Test]
        public void TestCreateSqlStatementFromDataTableSimple()
        {
            const string Target = "CREATE TABLE [TempTable] (\n[RowID] INT,\n[Col1] VARCHAR(255),\n[Col2] INT\n)";

            // create the datatable and add some columns
            var dataTable = new DataTable();
            dataTable.Columns.Add(
                new DataColumn()
                    {
                        DataType = System.Type.GetType("System.Int32"), ColumnName = "RowID", AutoIncrement = true 
                    });
            dataTable.Columns.Add(
                new DataColumn() { DataType = System.Type.GetType("System.String"), ColumnName = "Col1" });
            dataTable.Columns.Add(
                new DataColumn() { DataType = System.Type.GetType("System.Int32"), ColumnName = "Col2" });
            string result = SqlTableBuilder.CreateSqlStatementFromDataTable("TempTable", dataTable);

            Assert.AreEqual(result, Target);
        }

        [Test]
        public void TestCreateSqlStatementFromDataTableWithPrimaryKey()
        {
            const string Target =
                "CREATE TABLE [TempTable] (\n[RowID] INT,\n[Col1] VARCHAR(255),\n[Col2] INT\nCONSTRAINT [PK_TempTable] PRIMARY KEY CLUSTERED ([RowID]))\n";

            // create the datatable and add some columns
            var dataTable = new DataTable();
            var rowIdColumn = new DataColumn()
                { DataType = System.Type.GetType("System.Int32"), ColumnName = "RowID", AutoIncrement = true };
            dataTable.Columns.Add(rowIdColumn);
            dataTable.Columns.Add(
                new DataColumn() { DataType = System.Type.GetType("System.String"), ColumnName = "Col1" });
            dataTable.Columns.Add(
                new DataColumn() { DataType = System.Type.GetType("System.Int32"), ColumnName = "Col2" });

            DataColumn[] keys = new DataColumn[1];
            keys[0] = rowIdColumn;
            dataTable.PrimaryKey = keys;
            string result = SqlTableBuilder.CreateSqlStatementFromDataTable("TempTable", dataTable);

            Assert.AreEqual(result, Target);
        }
    }
}
