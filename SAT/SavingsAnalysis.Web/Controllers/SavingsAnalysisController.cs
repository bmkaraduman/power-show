namespace SavingsAnalysis.Web.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.IO;
    using System.Net;
    using System.Reflection;
    using System.Web;
    using System.Web.Mvc;

    using log4net;

    using global::SavingsAnalysis.AnalysisEngine.Core;

    using global::SavingsAnalysis.AnalysisEngine.Shopping;

    using global::SavingsAnalysis.Common;

    using global::SavingsAnalysis.Web.BaseClasses;

    using global::SavingsAnalysis.Web.Core;

    using global::SavingsAnalysis.Web.Models;

    using global::SavingsAnalysis.Web.MvcExtensions;

    using global::SavingsAnalysis.Web.ViewModels;

    public class SavingsAnalysisController : BaseController
    {
        private delegate void CleanupDb(string fileName, string dbConnectionString);

        public List<FileManager> ListOfFiles { get; set; }

        private AnalysisManager AnalysisManager = new AnalysisManager();

        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        
        #region Public Methods and Operators

        #region Submit and download
        [AcceptVerbs(HttpVerbs.Post)]
        [HttpPost]
        [JsonActionFilter]
        public ViewResult Download(OutputParametersViewModel analysisResults)
        {
            var httpCookie = this.HttpContext.Request.Cookies[ApplicationSettings.SelectedFileName];

            if (httpCookie != null)
            {
                var shoppingProgramListModel = new ShoppingProgramListModel(analysisResults.CommonResults.FileName);
                analysisResults.ShoppingProgramListResults = new ShoppingProgramListViewModel
                {
                    ProgramList = shoppingProgramListModel.Build(analysisResults.ShoppingResults)
                }; 
                
                var filname = httpCookie.Value;

                var packageFile = this.DownloadFile(analysisResults);

                var cleanup = new CleanupDb(AnalysisManager.CleanupAnalysisManager);

                IAsyncResult ar = cleanup.BeginInvoke(filname, ApplicationSettings.DatabaseConnectionString, null, null);

                this.DownloadFile(ApplicationSettings.OutputFolderPath, packageFile);
                Log.InfoFormat("{0} downloaded to {1}", packageFile, ApplicationSettings.OutputFolderPath);
            }

            return this.View();
        }

        public string DownloadFile(OutputParametersViewModel analysisResults)
        {
            var analysisDictionary = new AnalysisDictionary();

            this.GetValuesFromProperty(analysisResults.CommonResults, analysisDictionary);
            this.GetValuesFromProperty(analysisResults.NightWatchmanResults, analysisDictionary);

            // Generate Shopping included and excluded files
            var excludedFilename = Path.Combine(ApplicationSettings.OutputFolderPath, "Shopping Excluded Programs.txt");
            var includedFilename = Path.Combine(ApplicationSettings.OutputFolderPath, "Shopping Included Programs.txt");
            Exclusions.ExclusionFilter = (string)EnvironmentSettings.GetConfigSectionValues("Shopping")["ShoppingDefaultExclusions"];
            Exclusions.GenerateIncludedAndExcludedFiles(includedFilename, excludedFilename);

            // Create zip file
            var filesToZip = new List<ZipFileEntry>
                {
                    new ZipFileEntry(NightWatchmanController.GenerateReport(analysisResults, ReportType.Word)),
                    new ZipFileEntry(NightWatchmanController.GenerateReport(analysisResults, ReportType.Pdf)),
                    new ZipFileEntry(ShoppingController.GenerateReport(analysisResults, ReportType.Word)),
                    new ZipFileEntry(ShoppingController.GenerateReport(analysisResults, ReportType.Pdf)),
                    new ZipFileEntry(excludedFilename),
                    new ZipFileEntry(includedFilename)
                };

            var zipFileName = string.Format("{0}_Results_{1}.zip", analysisResults.CommonResults.CompanyName, DateTime.UtcNow.ToString("yyyy_MM_dd_hh_m_ss"));

            const string ZipPassword = "";

            ZipPackage.PackageFiles(
                filesToZip, Path.Combine(ApplicationSettings.OutputFolderPath, zipFileName), ZipPassword);

            return zipFileName;
        }

        #endregion

        public ActionResult Error()
        {
            return this.View();
        }

        // GET: /SavingsAnalysis/FileUpload
        public ActionResult FileUpload()
        {
            return this.View();
        }

        // POST: /SavingsAnalysis/FileUpload
        [HttpPost]
        public ActionResult FileUpload(HttpPostedFileBase file)
        {
            // Verify that the user selected a file
            if (file != null && file.ContentLength > 0)
            {
                string fileName = Path.GetFileNameWithoutExtension(file.FileName) + "_"
                                  + DateTime.UtcNow.ToString("yyyy_MM_dd_hh_m_ss");

                string fileExtension = Path.GetExtension(file.FileName);

                fileName = fileName + fileExtension;

                string path = Path.Combine(ApplicationSettings.DataUploadPath, fileName);

                file.SaveAs(path);
                return new HttpStatusCodeResult((int)HttpStatusCode.OK);
            }

            return new HttpStatusCodeResult((int)HttpStatusCode.BadRequest);
        }

        [JsonActionFilter]
        public ActionResult Index()
        {
            this.ViewBag.Title = "List of uploaded files";

            this.ListOfFiles = FileController.GetUploadedFiles(ApplicationSettings.DataUploadPath);

            TempData.Clear();

            return this.View(this.ListOfFiles);
        }

        #region ReporParameters

        [JsonActionFilter]
        public ActionResult ReportParameter(string fileName)
        {
            var model = new ShoppingInputParameterModel(fileName);
            var shoppingInput = model.Build();

            var initalValues = new InputParametersViewModel
                {
                    Common = new CommonInputParameterViewModel { FileName = fileName },
                    NightWatchman = new NightWatchmanInputParameterViewModel(),
                    Shopping = shoppingInput
                };

            int pos = fileName.IndexOf('_');
            if (pos > 0)
            {
                initalValues.Common.CompanyName = fileName.Substring(0, pos);
            }

            this.ViewBag.SelectedFile = fileName;
            
            return this.View(initalValues);
        }

        [HttpPost]
        [JsonActionFilter]
        public ActionResult ReportParameter(InputParametersViewModel analysisParameters)
        {
            if (!ModelState.IsValid)
            {
                return this.View(analysisParameters);
            }

            TempData.Clear();
            
            TempData.Add("input", analysisParameters);
            
            return this.RedirectToAction("AnalysisResults");
        }

        [JsonActionFilter]
        public ActionResult InitiateAnalysis(string filename)
        {
            this.SetupAnalysisEngine(filename);

            var ck = new HttpCookie(ApplicationSettings.SelectedFileName) { Value = filename };

            HttpContext.Response.Cookies.Add(ck);

            return this.RedirectToAction("ReportParameter", new { filename });
        }

        [JsonActionFilter]
        public ActionResult RemoveFile(string filename)
        {
            try
            {
                string fullFilename = Path.Combine(ApplicationSettings.DataUploadPath, filename);
                System.IO.File.Delete(fullFilename);
            }
            catch (Exception ex)
            {
                Log.ErrorFormat("Unable to delete file {0}.  {1}", filename, ex);
            }

            return this.RedirectToAction("Index");
        }
        
        [JsonActionFilter]
        public ActionResult ExclusionFilters(string fileName, string filters)
        {
            var model = new ShoppingInputParameterModel(fileName);
            var excludedPackages = new List<string>();
            var includedPackages = new List<string>();

            model.GetInclusionsAndExclusions(filters, includedPackages, excludedPackages);

            return Json(new { IncludedPackages = includedPackages, ExcludedPackages = excludedPackages }, JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region Analysis Results

        [JsonActionFilter]
        public ActionResult AnalysisResults()
        {
            InputParametersViewModel input = null;
            if (this.TempData.ContainsKey("input"))
            {
                input = (InputParametersViewModel)this.TempData["input"];
            }

            if(input != null && input.Common != null) ViewBag.SelectedFile = input.Common.FileName;

            var shoppingAnalysis = new ShoppingAnalysisModel(input.Shopping, input.Common);
            var shoppingAnalysisResults = shoppingAnalysis.Build();

            var nightWatchmanAnalysisModel = new NightWatchmanAnalysisModel(input.NightWatchman, input.Common);
            var nightWatchmanAnalysisResults = nightWatchmanAnalysisModel.Build();

            var model = new OutputParametersViewModel
                            {
                                CommonResults = input.Common,
                                NightWatchmanResults = nightWatchmanAnalysisResults,
                                ShoppingResults = shoppingAnalysisResults
                            };

            return this.View(model);
        }

        [HttpPost]
        public ActionResult AnalysisResults(OutputParametersViewModel input)
        {
            ViewBag.SelectedFile = input.CommonResults.FileName;
            if (!ModelState.IsValid)
            {
                return this.View(input);
            }

            return this.View(input);
        }

        #endregion

        #endregion

        #region Private Methods

        private void DownloadFile(string outputVirtualPath, string outPutFileName)
        {
            string path = Path.Combine(outputVirtualPath, outPutFileName);

            var file = new FileInfo(path);

            if (file.Exists)
            {
                this.Response.Clear();
                this.Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                this.Response.AddHeader("Content-Length", file.Length.ToString(CultureInfo.InvariantCulture));
                this.Response.ContentType = "application/octet-stream";
                this.Response.WriteFile(file.FullName);
                this.Response.End();
            }
        }

        private void SetupAnalysisEngine(string fileName)
        {
            string zipFile = Path.Combine(ApplicationSettings.DataUploadPath, fileName);

            if (!Directory.Exists(ApplicationSettings.OutputFolderPath))
            {
                Directory.CreateDirectory(ApplicationSettings.OutputFolderPath);
            }

            this.AnalysisManager.SetupAnalysis(
                zipFile, ApplicationSettings.TempPath, ApplicationSettings.DatabaseConnectionString);
        }

        private void GetValuesFromProperty(object obj, AnalysisDictionary dictionaryUsedForAnalysis)
        {
            PropertyInfo[] properties = obj.GetType().GetProperties();

            foreach (PropertyInfo property in properties)
            {
                object o = property.GetValue(obj, null);

                var objAnalysisAttribute = new AnalysisAttribute { Value = Convert.ToString(o) };

                dictionaryUsedForAnalysis.Add(property.Name, objAnalysisAttribute);
            }
        }

        #endregion
    }
}