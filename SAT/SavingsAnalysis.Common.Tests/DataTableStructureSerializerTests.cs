namespace SavingsAnalysis.Common.Tests
{
    using System.Data;

    using NUnit.Framework;

    [TestFixture]
    public class DataTableStructureSerializerTests
    {
        [Test]
        public void Roundtrip()
        {
            var tableIn = new DataTable();
            tableIn.Columns.Add(new DataColumn { ColumnName = "ColA", DataType = typeof(string), AllowDBNull = true, MaxLength = 123 });
            tableIn.Columns.Add(new DataColumn { ColumnName = "ColB", DataType = typeof(int), AllowDBNull = false });
            tableIn.Columns.Add(new DataColumn { ColumnName = "ColC", DataType = typeof(float), AllowDBNull = true });
            tableIn.Columns.Add(new DataColumn { ColumnName = "ColD", DataType = typeof(double), AllowDBNull = false });
            tableIn.Columns.Add(new DataColumn { ColumnName = "ColE", DataType = typeof(bool), AllowDBNull = true });

            var serializer = new DataTableStructureSerializer();
            var doc = serializer.Serialize(tableIn);

            var tableOut = serializer.Deserialize(doc);

            // We expect the order of the columns to have been peserved
            for (var i = 0; i < tableIn.Columns.Count; i++)
            {
                var originalCol = tableIn.Columns[i];
                var newCol = tableOut.Columns[i];

                Assert.AreEqual(originalCol.ColumnName, newCol.ColumnName);
                Assert.AreEqual(originalCol.DataType.Name, newCol.DataType.Name);
                Assert.AreEqual(originalCol.AllowDBNull, newCol.AllowDBNull);
                Assert.AreEqual(originalCol.MaxLength, newCol.MaxLength);
            }
        }
    }
}
