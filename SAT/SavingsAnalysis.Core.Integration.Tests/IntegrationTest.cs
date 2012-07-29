namespace SavingsAnalysis.Core.Integration.Tests
{
    using System.Collections.Generic;
    using System.Data.SqlClient;

    using Moq;

    using NUnit.Framework;

    using SavingsAnalysis.AnalysisEngine.Core;
    using SavingsAnalysis.AnalysisEngine.NightWatchman;
    using SavingsAnalysis.AnalysisEngine.Shopping;
    using SavingsAnalysis.Client;
    using SavingsAnalysis.Client.Common;
    using SavingsAnalysis.Common;
    using SavingsAnalysis.Common.Tests;

    /// <summary>
    /// End-to-end stylie test
    /// </summary>
    [Ignore]
    [TestFixture]
    public class IntegrationTest
    {
        #region Constants

        private const string DatabaseName = "SavingsAnalysis";

        private const string SqlServerName = "localhost";

        #endregion

        #region Fields

        private readonly TestDatabase testDatabase = new TestDatabase(DatabaseName, SqlServerName);

        #endregion

        #region Public Methods and Operators

        /*
        
        //TODO: Need to rewrite the integration test
        [Test]
        public void Integrate()
        {
            const int DesktopCount = 50123;
            const int LaptopCount = 50321;
            const string companyName = "TestCompany, Ltd";
            long totalMachine = 5000;
            long machinesOnForWeekdays = 3000;
            long machinesOnForWeekend = 2000;
            long noOfDays = 15;

            DataTable machineData = BuildMachineData(DesktopCount, LaptopCount);
            DataTable machineActivityData;
            DataTable machineActivityValidationData;
            BuildMachineActivityData(
                totalMachine,
                machinesOnForWeekdays,
                machinesOnForWeekend,
                noOfDays,
                out machineActivityData,
                out machineActivityValidationData);

            var mockValues = new Dictionary<string, List<DataTable>>
                {
                    { "MachineData", new List<DataTable> { machineData } }, 
                    { "MachineActivityData", new List<DataTable> { machineActivityData } }, 
                    { "Statmsgattributes", new List<DataTable> { BuildDummyDataTable("v_statmsgattributes", 100) } }, 
                    { "Advertisement", new List<DataTable> { BuildDummyDataTable("vstatusmessages", 92) } }, 
                    { "Statusmessages", new List<DataTable> { BuildDummyDataTable("v_Advertisement", 89) } }, 
                };

            var mockValue = new Dictionary<string, DataTable>
                {
                   { "Validate_MachineActivityData", machineActivityValidationData }, 
                };

            var mockQueryExecutor = new Mock<IQueryExecutor>();
            mockQueryExecutor.Setup(
                m => m.ExecuteQueryEnumerator(It.IsAny<string>(), It.IsAny<string>(), It.IsAny<SqlParameter[]>())).
                Returns((string a, string tableName, SqlParameter[] p) => mockValues[tableName]);

            mockQueryExecutor.Setup(
                m => m.ExecuteQuery(It.IsAny<string>(), It.IsAny<string>(), It.IsAny<SqlParameter[]>())).Returns(
                    (string a, string tableName, SqlParameter[] p) => mockValue[tableName]);

            string assemblyPath;
            assemblyPath = Directory.GetCurrentDirectory();
            Console.WriteLine("Working directory: " + assemblyPath);
            var context = new CommonExtractionContext
                {
                    CompanyName = companyName,
                    BaseWorkDirectory = assemblyPath,
                    PluginsDirectory = assemblyPath
                };

            var factory = new DataExtractorFactory(context.PluginsDirectory);
            var extractor = new DataExtractor(factory, mockQueryExecutor.Object);
            string zipFile = extractor.BuildPackage(context);
            Assert.IsTrue(File.Exists(zipFile), "Failed to create Zip file");
            Assert.IsTrue(
                string.Compare(Path.GetFileNameWithoutExtension(zipFile), context.CompanyName) == 0,
                "Zip file is not correctly named");

            string unzipToDirectory = this.GetTemporaryDirectory();
            ZipPackage.ExtractFiles(zipFile, unzipToDirectory, string.Empty);

            var mockAnalysisManager = new Mock<AnalysisManager>();
            mockAnalysisManager.CallBase = true;
            //mockAnalysisManager.Setup(m => m.AnalysisEngines).Returns(
            //    new List<IAnalysisEngine> { new NightWatchmanAnalysis(), new ShoppingAnalysis() });
            AnalysisManager analysisManager = mockAnalysisManager.Object;
            var inputDictionary = new AnalysisDictionary();
            analysisManager.SetupAnalysis(zipFile, unzipToDirectory, this.testDatabase.ConnectionString);
            List<AnalysisDictionary> analysisOutput = null;

            //analysisOutput = analysisManager.Analyse(
            //     zipFile, this.testDatabase.ConnectionString, inputDictionary);

            // var analysisOutput = analysisManager.Analyse(inputDictionary);

            // Ensure we get the analysis result back
            Assert.AreEqual(analysisOutput.Count, 2);
            Assert.AreEqual(analysisOutput[0].Count, 4);
            Assert.AreEqual(analysisOutput[1].Count, 2);

            // Do the analysis and check stats
            Assert.AreEqual(DesktopCount, int.Parse(analysisOutput[0]["NumberOfDesktops"].Value));
            Assert.AreEqual(LaptopCount, int.Parse(analysisOutput[0]["NumberOfLaptops"].Value));
            Assert.AreEqual(machinesOnForWeekdays, int.Parse(analysisOutput[0]["MachinesOnForWeekdays"].Value));
            Assert.AreEqual(machinesOnForWeekend, int.Parse(analysisOutput[0]["MachinesOnForWeekend"].Value));

            Assert.AreEqual(89, int.Parse(analysisOutput[1]["NumberOfRequests"].Value));
            Assert.AreEqual(92, int.Parse(analysisOutput[1]["AnnualTotal"].Value));
        }
        
        */

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

        #endregion

        #region Methods

        #endregion
    }
}