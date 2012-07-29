namespace SavingsAnalysis.Web.Tests
{
    using System.Collections.Generic;
    using System.IO;
    using System.Net;
    using System.Web.Mvc;

    using NUnit.Framework;

    using global::SavingsAnalysis.AnalysisEngine.Core;
    using global::SavingsAnalysis.Web.Controllers;
    using global::SavingsAnalysis.Web.Core;
    using global::SavingsAnalysis.Web.Models;
    using global::SavingsAnalysis.Web.ViewModels;

    [TestFixture]
    public class SavingsAnalysisControllerTests
    {
        public const string CsvFileName = "testinc.zip";
        public const string ConnString = @"Data Source=localhost;Integrated Security=True";

        [SetUp]
        public void Setup()
        {
            EnvironmentSettings.GetInstance().BaseDir = @"..\..\..\SavingsAnalysis.Web";
            EnvironmentSettings.GetInstance().DatabaseConnectionString = ConnString;
        }

        [TearDown]
        public void TearDown()
        {
            EnvironmentSettings.GetInstance().BaseDir = string.Empty;
        }

        [Test]
        public void IndexViewTest()
        {
            const int FileCompareCount = 0;

            Assert.GreaterOrEqual(
                FileController.GetUploadedFiles(EnvironmentSettings.GetInstance().DataUploadPath).Count,
                FileCompareCount);
        }

        [Ignore]
        [Test]
        public void ReportParametersGetTest()
        {
            var result = new SavingsAnalysisController().ReportParameter(Path.Combine(EnvironmentSettings.GetInstance().DataUploadPath, CsvFileName)) as ViewResult;
            Assert.AreEqual(Path.Combine(EnvironmentSettings.GetInstance().DataUploadPath, CsvFileName), result.ViewBag.SelectedFile);
        }
         [Ignore]
        [Test]
        public void ReportParametersPostTest()
        {
            var analysisParameters = new OutputParametersViewModel()
                {
                    CommonResults = new CommonInputParameterViewModel
                            { FileName = Path.Combine(EnvironmentSettings.GetInstance().DataUploadPath, CsvFileName) },

                    NightWatchmanResults  = new NightWatchmanAnalysisResultsViewModel(),
                    ShoppingResults = new ShoppingAnalysisViewModel()
                };
            var result = new SavingsAnalysisController().AnalysisResults(analysisParameters) as ViewResult;
            Assert.AreEqual(Path.Combine(EnvironmentSettings.GetInstance().DataUploadPath, CsvFileName), result.ViewBag.SelectedFile);
        }
         [Ignore]
        [Test]
        public void AnalysisResultGetTest()
        {
            var commonResults = new CommonInputParameterViewModel
                { FileName = Path.Combine(EnvironmentSettings.GetInstance().DataUploadPath, CsvFileName) };

            var analysisParameters = new OutputParametersViewModel()
            {
                CommonResults = commonResults,

                NightWatchmanResults = new NightWatchmanAnalysisResultsViewModel(),
                ShoppingResults = new ShoppingAnalysisViewModel()
            };

            var result = new SavingsAnalysisController().AnalysisResults(analysisParameters) as ViewResult;
            Assert.AreEqual(Path.Combine(EnvironmentSettings.GetInstance().DataUploadPath, CsvFileName), result.ViewBag.SelectedFile);
        }
         [Ignore]
        [Test]
        public void AnalysisResultPostTest()
        {
            var shoppingProgramListViewModel = new ShoppingProgramListViewModel
                {
                    ProgramList = new List<ShoppingProgram>()
                };

            for (int i = 1; i < 20; i++)
            {
                shoppingProgramListViewModel.ProgramList.Add(
                    new ShoppingProgram
                        {
                            AttributeValue = string.Format("Test{0}", i),
                            PackageName = string.Format("PackageName{0}", i),
                            ProgramName = string.Format("ProgramName{0}", i),
                            TotalCount = i * 1111
                        });
            }

            var analysisParameters = new OutputParametersViewModel
                {
                    CommonResults =
                        new CommonInputParameterViewModel
                            {
                                CurrencySymbol = "$",
                                FileName = Path.Combine(EnvironmentSettings.GetInstance().DataUploadPath, CsvFileName)
                            }, 
                    NightWatchmanResults = new NightWatchmanAnalysisResultsViewModel(), 
                    ShoppingResults = new ShoppingAnalysisViewModel(),
                    ShoppingProgramListResults = shoppingProgramListViewModel
                };

            var result = new SavingsAnalysisController().DownloadFile(analysisParameters);
            result = Path.Combine(EnvironmentSettings.GetInstance().OutputFolderPath, result);


            try
            {
                if (File.Exists(result))
                {
                    Assert.Pass("Report createded successfully ");
                }
                else
                {
                    Assert.Fail("Report not created");
                }
            }
            catch (SuccessException)
            {
            }
        }

        [Test]
        public void UploadTest()
        {
            var client = new WebClient();
            try
            {
                client.UploadFile(
                    "http://1edvsavingstool/satstaging/SavingsAnalysis/FileUpload",
                    "POST",
                    Path.Combine("TestData", "TestUpload.zip"));

                Assert.Pass("File upload is passed");
            }
            catch (WebException)
            {
                Assert.Fail("File upload is failed : unauthorized or file exceeded size limit");
            }
            catch (SuccessException)
            {
            }
        }
    }
}
