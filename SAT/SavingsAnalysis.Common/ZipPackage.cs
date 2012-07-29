namespace SavingsAnalysis.Common
{
    using System.Collections.Generic;
    using System.IO;

    using ICSharpCode.SharpZipLib.Zip;

    public struct ZipFileEntry
    {
        public string AbsoluteFilePath;
        public string FilePathInsideZip;

        public ZipFileEntry(string filePath)
        {
            AbsoluteFilePath = filePath;
            FilePathInsideZip = Path.GetFileName(filePath);
        }

        public ZipFileEntry(string absoluteFilePath, string filePathInsideZip)
        {
            AbsoluteFilePath = absoluteFilePath;
            FilePathInsideZip = filePathInsideZip;
        }
    }

    /// <remarks>
    /// Based on code from http://wiki.sharpdevelop.net/SharpZipLib-Zip-Samples.ashx
    /// </remarks>
    public class ZipPackage
    {
        public string ZipFilePath { get; set; }

        public string Password { get; set; }
        
        public static void PackageFiles(string dirPathToZipContent, string zipFilePath, string password)
        {
            var filesToZip = new List<ZipFileEntry>();
            AddDirectoryToList(dirPathToZipContent, string.Empty, filesToZip);
            PackageFiles(filesToZip, zipFilePath, password);
        }

        public static void PackageFiles(IEnumerable<ZipFileEntry> filesToZip, string zipFilePath, string password)
        {
            var zipFile = new ZipPackage
                              {
                                  ZipFilePath = zipFilePath, 
                                  Password = password
                              };
            zipFile.PackageFiles(filesToZip);
        }

        public static void ExtractFiles(string zipFilePath, string destDirPath, string password)
        {
            var zipFile = new ZipPackage
            {
                ZipFilePath = zipFilePath, 
                Password = password
            };
            zipFile.ExtractFiles(destDirPath);
        }

        public void PackageFiles(IEnumerable<ZipFileEntry> filesToZip)
        {
            using (var zipStream = new ZipOutputStream(File.Create(ZipFilePath)))
            {
                if (!string.IsNullOrEmpty(Password))
                {
                    zipStream.Password = Password;
                }

                zipStream.SetLevel(9); // 9 -> "highest compression"

                foreach (var fileEntry in filesToZip)
                {
                    var zipEntry = new ZipEntry(fileEntry.FilePathInsideZip);
                    var fileInfo = new FileInfo(fileEntry.AbsoluteFilePath);
                    zipEntry.DateTime = fileInfo.LastWriteTime;
                    zipEntry.Size = fileInfo.Length;

                    zipStream.PutNextEntry(zipEntry);

                    // Zip the file in buffered chunks
                    var buffer = new byte[4096];
                    using (var streamReader = File.OpenRead(fileEntry.AbsoluteFilePath))
                    {
                        ICSharpCode.SharpZipLib.Core.StreamUtils.Copy(streamReader, zipStream, buffer);
                    }

                    zipStream.CloseEntry();
                }

                zipStream.Finish();
                zipStream.Close();
            }
        }

        public void ExtractFiles(string destDirPath)
        {
            using (var zipStream = new ZipInputStream(File.OpenRead(ZipFilePath)))
            {
                zipStream.Password = Password;

                ZipEntry zipEntry;
                while ((zipEntry = zipStream.GetNextEntry()) != null)
                {
                    if (!string.IsNullOrEmpty(zipEntry.Name))
                    {
                        var destinationFile = Path.Combine(destDirPath, zipEntry.Name);
                        var dirPath = Path.GetDirectoryName(destinationFile);

                        Directory.CreateDirectory(dirPath);

                        if (zipEntry.IsFile)
                        {
                           using (var streamWriter = File.Create(destinationFile))
                           {
                              int size = 2048;
                              var data = new byte[size];
                              while (true)
                              {
                                 size = zipStream.Read(data, 0, data.Length);
                                 if (size > 0)
                                 {
                                    streamWriter.Write(data, 0, size);
                                 }
                                 else
                                 {
                                    break;
                                 }
                              }
                           }
                        }
                    }
                }
            }
        }

        private static void AddDirectoryToList(
            string absoluteDirPath, string dirPathInsideZip, List<ZipFileEntry> filesToZip)
        {
            var dirs = Directory.GetDirectories(absoluteDirPath);
            foreach (var dir in dirs)
            {
                AddDirectoryToList(dir, Path.Combine(dirPathInsideZip, Path.GetFileName(dir)), filesToZip);
            }

            var files = Directory.GetFiles(absoluteDirPath);
            foreach (var file in files)
            {
                filesToZip.Add(new ZipFileEntry(file, Path.Combine(dirPathInsideZip, Path.GetFileName(file))));
            }
        }
    }
}
