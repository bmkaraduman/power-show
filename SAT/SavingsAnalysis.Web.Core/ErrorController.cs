namespace SavingsAnalysis.Web.Core
{
    using System;
    using System.Configuration;
    using System.Globalization;
    using System.IO;

    public class ErrorController
    {
        public static void LogError(Exception objException)
        {
            try
            {
                // TODO: Remove coupling from ConfigurationManager.AppSettings stuff
                if (ConfigurationManager.AppSettings["LogErrorRoutine"] == "true")
                {
                    CustomErrorRoutine(objException);
                }
            }
            catch (Exception)
            {
            }
        }

        private static void CustomErrorRoutine(Exception exception)
        {
            WriteErrorLog(GetLogFilePath(), exception);
        }

        private static void WriteErrorLog(string errorPath, Exception exception)
        {
            using (var streamWriter = new StreamWriter(errorPath, true))
            {
                streamWriter.WriteLine("Source		: " + exception.Source.ToString(CultureInfo.InvariantCulture).Trim());
                streamWriter.WriteLine("Method		: " + exception.TargetSite.Name.ToString(CultureInfo.InvariantCulture));
                streamWriter.WriteLine("Date		    : " + DateTime.Now.ToShortDateString());
                streamWriter.WriteLine("Time		    : " + DateTime.Now.ToShortTimeString());
                streamWriter.WriteLine("Error		: " + exception.Message.ToString(CultureInfo.InvariantCulture).Trim());
                streamWriter.WriteLine("Stack Trace	: " + exception.StackTrace.ToString(CultureInfo.InvariantCulture).Trim());
                streamWriter.WriteLine("-----------------------------------------------------------------------");
                streamWriter.Flush();
                streamWriter.Close();
            }
        }

        private static string GetLogFilePath()
        {
            try
            {
                ManageErrorLogFolder();
                var baseDir = AppDomain.CurrentDomain.BaseDirectory + "//ErrorLog";

                var retFilePath = baseDir + "//" + "ErrorLog" + DateTime.Now.ToString("MM-dd-yyyy") + ".txt";

                if (File.Exists(retFilePath))
                {
                    return retFilePath;
                }

                // create a text file
                using (var fs = new FileStream(retFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite))
                {
                    fs.Close();
                }

                return retFilePath;
            }
            catch
            {
                return string.Empty;
            }
        }

        private static void ManageErrorLogFolder()
        {
            var baseDir = AppDomain.CurrentDomain.BaseDirectory + "//ErrorLog";
            if (!Directory.Exists(baseDir))
            {
                Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "//ErrorLog");
            }
        }
    }
}