namespace SavingsAnalysis.Web.Core
{
    using System.Collections.Generic;
    using System.IO;

    public class FileController
    {
        public static List<FileManager> GetUploadedFiles(string uploadDirectory)
        {
            var files = new List<FileManager>();

            if (!Directory.Exists(uploadDirectory))
            {
                Directory.CreateDirectory(uploadDirectory);    
            }

            var dir = new DirectoryInfo(uploadDirectory);

            foreach (var file in dir.GetFiles("*.zip"))
            {
                var objFileManager = new FileManager { FileName = file.Name, FileCreatedDate = file.CreationTime };
                files.Add(objFileManager);
                files.Sort();
            }

            return files;
        }
    }
}