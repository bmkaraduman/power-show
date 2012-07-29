using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SavingsAnalysis.AnalysisEngine.Nightwatchman.Tests
{
    using System.Data;
    using System.Data.SqlClient;
    using System.IO;

    using Moq;

    using NUnit.Framework;

    using SavingsAnalysis.AnalysisEngine.Core;
    using SavingsAnalysis.AnalysisEngine.NightWatchman;
    using SavingsAnalysis.Client;
    using SavingsAnalysis.Client.Common;
    using SavingsAnalysis.Common;
    using SavingsAnalysis.Common.Tests;
    using SavingsAnalysis.Plugin.NightWatchman;

    [TestFixture]
    public class AnalysisEngineNightWatchmanTests
    {
        private const string DatabaseName = "SavingsAnalysis";
        private const string SqlServerName = "localhost";

        private readonly TestDatabase testDatabase = new TestDatabase(DatabaseName, SqlServerName);

        [SetUp]
        public void Setup()
        {
            this.testDatabase.Delete();
            this.testDatabase.Create();
        }

        [TearDown]
        public void TearDown()
        {
            this.testDatabase.Delete();
        }

        [Test]
        public void HappyPath_NightWatchmanAnalysis_BuildMachineData()
        {
            const int DesktopCount = 50123;
            const int LaptopCount = 50321;
            const string companyName = "Nightwatchman Company, Ltd";
            long totalMachine = 5000;
            long machinesOnForWeekdays = 3000;
            long machinesOnForWeekend = 2000;
            long noOfDays = 15;

            var machineData = BuildMachineData(DesktopCount, LaptopCount);
            DataTable machineActivityData;
            DataTable machineActivityValidationData;
            BuildMachineActivityData(totalMachine, machinesOnForWeekdays, machinesOnForWeekend, noOfDays, out machineActivityData, out machineActivityValidationData);

            Dictionary<string, DataTable> mockValues = new Dictionary<string, DataTable>()
                                                         {
                                                            {"MachineData",machineData},
                                                            {"MachineActivityData",machineActivityData},
                                                            {"Validate_MachineActivityData",machineActivityValidationData}
                                                         };

            var mockQueryExecutor = new Moq.Mock<IQueryExecutor>();
            mockQueryExecutor.Setup(
               m =>
               m.ExecuteQuery(It.IsAny<string>(), It.IsAny<string>(), It.IsAny<string>(), It.IsAny<SqlParameter[]>()))
               .Returns(
                  (string a, string b, string tableName, SqlParameter[] p)
                  => mockValues[tableName]);

            string assemblyPath;
            assemblyPath = Directory.GetCurrentDirectory();
            Console.WriteLine("Working directory: " + assemblyPath);
            var context = new CommonExtractionContext()
            {
                CompanyName = companyName,
                BaseWorkDirectory = assemblyPath,
                PluginsDirectory = assemblyPath
            };

            var factory = new DataExtractorFactory(context.PluginsDirectory);
            var nwmExtractor = factory.GetExtractor<NightWatchmanDataExtractor>();
            Assert.NotNull(nwmExtractor, "DataExtractorFactory failed to load NightWatchmanDataExtractor");
           

            var extractor = new DataExtractor(factory, mockQueryExecutor.Object);
            var zipFile = extractor.BuildPackage(context);
            Assert.IsTrue(File.Exists(zipFile), "Failed to create Zip file");
            Assert.IsTrue((string.Compare(Path.GetFileNameWithoutExtension(zipFile), context.CompanyName) == 0), "Zip file is not correctly named");
            
            // Need to add more code to test zip file paths
            
        }

        //[Test]
        //public void NightwatchmanAnalysis_ValidationFail()
        //{
            
        //}

        private string GetTemporaryDirectory()
        {
            string tempDirectory = Path.Combine(Path.GetTempPath(), Path.GetRandomFileName());
            Directory.CreateDirectory(tempDirectory);
            return tempDirectory;
        }

        private static DataTable BuildMachineData(int desktopCount, int laptopCount)
        {
            // Prepare a simple table with a known structure
            var table = new DataTable();
            table.TableName = "MachineData";
            table.Columns.Add(new DataColumn { ColumnName = "MachineType", DataType = typeof(string), AllowDBNull = false, MaxLength = 16 });
            table.Columns.Add(new DataColumn { ColumnName = "NetbiosName", DataType = typeof(string), AllowDBNull = false, MaxLength = 16 });
            table.Columns.Add(new DataColumn { ColumnName = "ChassisType", DataType = typeof(int), AllowDBNull = false });

            for (var i = 0; i < desktopCount; i++)
            {
                DataRow row = table.NewRow();
                row["MachineType"] = "Desktop";
                row["NetbiosName"] = "Desktop" + i;
                row["ChassisType"] = 4;
                table.Rows.Add(row);
            }

            for (var i = 0; i < laptopCount; i++)
            {
                DataRow row = table.NewRow();
                row["MachineType"] = "Laptop";
                row["NetbiosName"] = "Laptop" + i;
                row["ChassisType"] = 9;
                table.Rows.Add(row);
            }

            return table;
        }
        private static void BuildMachineActivityData(
            long totalMachine,
            long machinesOnForWeekdays,
            long machinesOnForWeekend,
            long noOfDays,
            out DataTable selectionTable,
            out DataTable validationTable)
        {
            // Prepare a simple table with a known structure
            selectionTable = new DataTable();
            selectionTable.TableName = "MachineActivityData";
            selectionTable.Columns.Add(
                new DataColumn { ColumnName = "ResourceID", DataType = typeof(long), AllowDBNull = false });
            selectionTable.Columns.Add(
                new DataColumn { ColumnName = "ActivityTime", DataType = typeof(DateTime), AllowDBNull = false });
            selectionTable.Columns.Add(
                new DataColumn
                    { ColumnName = "ActivityType", DataType = typeof(string), AllowDBNull = true, MaxLength = 64 });

            DateTime today = DateTime.Today;
            string activityType = "Dummy Activity";
            for (long i = 1; i <= totalMachine; i++)
            {
                for (int date = 0; date < noOfDays; ++date)
                {
                    if (i > machinesOnForWeekdays && i > machinesOnForWeekend) break;
                    DateTime activityTime = today.AddDays(-date);
                    bool weekend = activityTime.DayOfWeek == DayOfWeek.Saturday
                                   || activityTime.DayOfWeek == DayOfWeek.Sunday;
                    if (i > machinesOnForWeekdays && !weekend) continue;
                    if (i > machinesOnForWeekend && weekend) continue;

                    DataRow row = selectionTable.NewRow();
                    row["ResourceID"] = i;
                    row["ActivityTime"] = activityTime;
                    row["ActivityType"] = activityType;
                    selectionTable.Rows.Add(row);
                }
            }

            validationTable = new DataTable();
            validationTable.TableName = "Validate_MachineActivityData";
            validationTable.Columns.Add(new DataColumn { ColumnName = "Maxday", DataType = typeof(DateTime) });
            validationTable.Columns.Add(new DataColumn { ColumnName = "Minday", DataType = typeof(DateTime) });
            DataRow validationRow = validationTable.NewRow();
            validationRow["Maxday"] = DateTime.Today;
            validationRow["Minday"] = DateTime.Today.AddDays(-noOfDays);
            validationTable.Rows.Add(validationRow);
        }
    }
}
    


