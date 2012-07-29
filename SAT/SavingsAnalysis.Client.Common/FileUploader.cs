// -----------------------------------------------------------------------
// <copyright file="FileUploader.cs" company="1E">
// 
// </copyright>
// -----------------------------------------------------------------------

namespace SavingsAnalysis.Client.Common
{
    using System.Net;
    using System.Reflection;

    using log4net;

    /// <summary>
    /// Uploads a given file to the given url
    /// </summary>
    public class FileUploader
    {
        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        public static void UploadFile(string url, string filePath)
        {                
            string message = string.Format("About to start upload of {0} to {1}", filePath, url);
            Log.Info(message);

            using (var client = new WebClient())
            {
                Log.Info("Uploading file ...");

                byte[] response = client.UploadFile(url, "POST", filePath);
                
                var r = System.Text.Encoding.ASCII.GetString(response);

                message = string.Format("Upload completed. Response from server: {0}", r);

                Log.Info(message);
            }
        }
    }
}
