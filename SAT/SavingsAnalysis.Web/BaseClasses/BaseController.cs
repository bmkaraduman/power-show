namespace SavingsAnalysis.Web.BaseClasses
{
    using System;
    using System.IO;
    using System.Web.Mvc;

    using Microsoft.Reporting.WebForms;

    public class BaseController : Controller
    {
        public BaseController()
        {
            ViewBag.Version = typeof(AnalysisEngine.Core.IAnalysisEngine).Assembly.GetName().Version;
        }

        public enum ReportType
        {
            Word = 0,
            Pdf
        }

        public static EnvironmentSettings ApplicationSettings
        {
            get
            {
                return EnvironmentSettings.GetInstance();
            }
        }

        protected static string DetermineFilename(string fileName, ReportType reportType)
        {
            switch (reportType)
            {
                case ReportType.Word:
                    fileName = fileName + ".doc";
                    break;

                case ReportType.Pdf:
                    fileName = fileName + ".pdf";
                    break;
            }

            return Path.Combine(ApplicationSettings.OutputFolderPath, fileName);
        }

        protected static void SaveReport(string filename, ReportType reportType, ReportViewer reportViewer)
        {
            var format = string.Empty;
            switch (reportType)
            {
                case ReportType.Word:
                    format = "Word";
                    break;

                case ReportType.Pdf:
                    format = "PDF";
                    break;
            } 

            var bytes = RenderReport(filename, format, reportViewer);
            WriteReport(filename, bytes);
        }

        private static void WriteReport(string filename, byte[] bytes)
        {
            try
            {
                FileStream stream = System.IO.File.OpenWrite(filename);
                stream.Write(bytes, 0, bytes.Length);
                stream.Close();
            }
            catch (Exception ex)
            {
                var msg = string.Format("Unable to create file '{0}'", filename);
                throw new Exception(msg, ex);
            }
        }

        private static byte[] RenderReport(string filename, string format, ReportViewer reportViewer)
        {
            byte[] bytes;

            try
            {
                Warning[] warnings;
                string[] streamids;
                string mimeType;
                string encoding;
                string extension;
                bytes = reportViewer.LocalReport.Render(
                    format, null, out mimeType, out encoding, out extension, out streamids, out warnings);
            }
            catch (Exception ex)
            {
                var msg = string.Format("Unable to render report '{0}'", filename);
                throw new Exception(msg, ex);
            }

            return bytes;
        }
    }
}