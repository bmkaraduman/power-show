// -----------------------------------------------------------------------
// <copyright file="QAAssist.cs" company="1E">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace SavingsAnalysis.Client.Host
{
    using System.Configuration;

    using SavingsAnalysis.Client.Common;

    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public class QATest
    {
        public static bool UploadFile(string server, string filePath)
        {
            string uploadurl = ConfigurationManager.AppSettings["fileUploadUrl"].Replace(
                "[SERVERNAME]", server);

            FileUploader.UploadFile(uploadurl, filePath);

            return false;
        }
    }
}
