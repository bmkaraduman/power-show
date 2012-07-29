// ReSharper disable CheckNamespace
namespace SavingsAnalysis.Web
// ReSharper restore CheckNamespace
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Collections.Specialized;
    using System.Configuration;
    using System.IO;
    using System.Web;

    public class EnvironmentSettings
    {
        private static EnvironmentSettings appSetting;

        public string BaseDir { get; set; }

        public string DatabaseConnectionString { get; set; }

        public string ReportTemplateFilePath
        {
            get
            {
                return Path.Combine(BaseDir, @"App_Data");
            }
        }

        public string OutputFolderPath
        {
            get
            {
                return Path.Combine(BaseWorkDirectory, "Output");
            }
        }

        public string VirtualOutputURL
        {
            get
            {
                return UrlCombine("~", "SavingsAnalysis/Output");
            }
        }

        public string OutputChartImagePath
        {
            get
            {
                return UrlCombine(BaseWorkDirectory, "ChartTempImages");
            }
        }

        public string VirtualSavingsAnalysisClientFileURL
        {
            get
            {
                return UrlCombine("~", "SatTool/AnalysisclientTool.zip");
            }
        }

        public string DataUploadPath
        {
            get
            {
                return Path.Combine(BaseWorkDirectory, "Uploads");
            }
        }

        public string TempPath
        {
            get
            {
                return Path.Combine(BaseWorkDirectory, "Temp");
            }
        }

        public string AnalysisEnginePath
        {
            get
            {
                return Path.Combine(BaseDir, "Analysis");
            }
        }

        private string BaseWorkDirectory
        {
            get
            {
                return Path.Combine(BaseDir, "SavingsAnalysis");
            }
        }

        public static string UrlCombine(string path1, string path2)
        {
            var result = path1.EndsWith("/") ? path1 : path1 + "/";
            result += path2.StartsWith("/") ? path2.Substring(1) : path2;
            return result;
        }

        public static EnvironmentSettings GetInstance()
        {
            if (appSetting == null)
            {
                appSetting = new EnvironmentSettings();

                // ReSharper disable ConditionIsAlwaysTrueOrFalse
                if (HttpContext.Current != null) // ReSharper restore ConditionIsAlwaysTrueOrFalse
                {
                    appSetting.BaseDir = HttpContext.Current.Server.MapPath("~");
                    appSetting.DatabaseConnectionString =
                        ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                }
            }

            return appSetting;
        }

        public string SelectedFileName
        {
            get
            {
                return "FileName";
            }
        }

        public static IDictionary GetConfigSectionValues(string sectionName)
        {
            IDictionary configMessage = null;

            if (ConfigurationManager.GetSection(sectionName) != null)
            {
                configMessage = (IDictionary)ConfigurationManager.GetSection(sectionName);
            }
            else
            {
                new ApplicationException("Section " + sectionName + " not defined in config");
            }

            return configMessage;
        }
    }
}
