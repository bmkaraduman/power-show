namespace SavingsAnalysis.Core.DataExtrator.Tests
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Text;
    using NUnit.Framework;
    using SavingsAnalysis.Common;

    [TestFixture]
    public class DataExtratorTests
    {
        [Test]
        public void CsvWriterReaderAccuracyTestShouldHaveAccurateData()
        {
            File.Delete("Somefile.csv");

            var originalDataList = new List<TestData>();
            var data1 = new TestData
                { Region = "Ealing,\n London", Sales = 10000, DateOpened = new DateTime(2012, 04, 23) };
            originalDataList.Add(data1);
            var data2 = new TestData { Region = "\"\"Glasgow in Scotland\"\"", Sales = 50000, DateOpened = new DateTime(2012, 4, 1, 15, 31, 0) };
            originalDataList.Add(data2);
            var data3 = new TestData { Region = "USA 'Gods own country'", Sales = 40000, DateOpened = new DateTime(2011, 12, 29, 9, 30, 0) };
            originalDataList.Add(data3);

            var exportData = new CsvWriter();
            exportData.AddRow();
            exportData["Region"] = data1.Region;
            exportData["Sales"] = Convert.ToString(data1.Sales);
            exportData["Date Opened"] = Convert.ToString(data1.DateOpened);

            exportData.AddRow();
            exportData["Region"] = data2.Region;
            exportData["Sales"] = Convert.ToString(data2.Sales);
            exportData["Date Opened"] = Convert.ToString(data2.DateOpened);

            exportData.AddRow();
            exportData["Region"] = data3.Region;
            exportData["Sales"] = Convert.ToString(data3.Sales);
            exportData["Date Opened"] = Convert.ToString(data3.DateOpened);

            exportData.ExportToFile("Somefile.csv");

            bool readingHeader = true;
            using (var reader = new CsvFileReader("Somefile.csv"))
            {
                var row = new CsvRow();

                var newDataList = new List<TestData>();
                while (reader.ReadRow(row))
                {
                    var headersList = new List<string>();
                    if (readingHeader)
                    {
                        headersList.AddRange(row);

                        headersList.ToArray();
                        readingHeader = false;
                    }
                    else
                    {
                        var outData = new TestData
                                            {
                                                Region = row[0],
                                                Sales = Convert.ToInt32(row[1]),
                                                DateOpened = Convert.ToDateTime(row[2])
                                            };

                        newDataList.Add(outData);
                    }
                }

                var resultData = from newData in newDataList
                                 join originalData in originalDataList on newData.Region equals originalData.Region
                                 select new { NewData = newData, OriginalData = originalData };

                foreach (var data in resultData)
                {
                    Assert.IsTrue(
                        data.NewData.Sales == data.OriginalData.Sales
                        && data.NewData.Region == data.OriginalData.Region
                        && data.NewData.DateOpened == data.OriginalData.DateOpened);
                }
            }
        }

        [Test]
        public void CsvReaderTest_WithValuesNotSetForFewColumns()
        {
           using (var reader = new CsvFileReader(new MemoryStream(Encoding.UTF8.GetBytes("1,2,3,4\n1,2,,4"))))
           {
              var row = new CsvRow();
              Assert.AreEqual(reader.ReadRow(row), true);
               Assert.AreEqual(4, row.Count);
              row = new CsvRow();
              Assert.AreEqual(reader.ReadRow(row), true);
              Assert.AreEqual(4, row.Count);
           }
        }

        private class TestData
        {
            public string Region { get; set; }

            public int Sales { get; set; }

            public DateTime DateOpened { get; set; }
        }
    }
}
