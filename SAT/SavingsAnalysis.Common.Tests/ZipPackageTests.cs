namespace SavingsAnalysis.Common.Tests
{
    using System.Collections.Generic;
    using System.IO;
    using System.Text;
    using NUnit.Framework;

    [TestFixture]
    public class ZipPackageTests
    {
        [Test]
        public void ZipPackage_CheckSingleFile_Packaging_Extraction()
        {
            const string TestContent = "This is a Test Content for the file.";
            string tempDirPath = Path.GetTempPath();
            string filePath = Path.Combine(tempDirPath, "ZipPackage_CheckSingleFile_Packaging_Extraction.txt");
            string zipPath = Path.Combine(tempDirPath, "ZipPackage_CheckSingleFile_Packaging_Extraction.zip");
            File.WriteAllText(filePath, TestContent, Encoding.Unicode);
            ZipPackage.PackageFiles(new List<ZipFileEntry> { new ZipFileEntry(filePath) }, zipPath, string.Empty);

            File.Delete(filePath);
            ZipPackage.ExtractFiles(zipPath, tempDirPath, string.Empty);
            string extractedContent = File.ReadAllText(filePath);
            Assert.AreEqual(TestContent, extractedContent);
        }

        [Test]
        public void ZipPackage_CheckMultiFile_Packaging_Extraction()
        {
            ZipPackage_CheckMultiFile_Packaging_Extraction(string.Empty);
        }

        [Test]
        public void ZipPackage_CheckMultiFile_Packaging_Extraction_With_Password()
        {
            ZipPackage_CheckMultiFile_Packaging_Extraction("TestP@33w0rd");
        }
        
        [Test]
        public void ZipPackage_Directory_Packaging_Extraction()
        {
            ZipPackage_Directory_Packaging_Extraction(string.Empty);
        }

        [Test]
        public void ZipPackage_Directory_Packaging_Extraction_With_Password()
        {
            ZipPackage_Directory_Packaging_Extraction("TestP@33w0rd");
        }

        private void ZipPackage_CheckMultiFile_Packaging_Extraction(string password)
        {
            const string TestContent = "This is a Test Content for the file {0}.";
            string tempDirPath = Path.GetTempPath();
            string filePathFormat = Path.Combine(tempDirPath, "ZipPackage_CheckMultiFile_Packaging_Extraction_{0}.txt");
            string zipPath = Path.Combine(tempDirPath, "ZipPackage_CheckSingleFile_Packaging_Extraction.zip");
            var filesToZip = new List<ZipFileEntry>();
            for (int i = 0; i < 3; ++i)
            {
                string filePath = string.Format(filePathFormat, i);
                File.WriteAllText(filePath, string.Format(TestContent, filePath), Encoding.Unicode);
                filesToZip.Add(new ZipFileEntry(filePath));
            }

            ZipPackage.PackageFiles(filesToZip, zipPath, password);

            filesToZip.ForEach(x => File.Delete(x.AbsoluteFilePath));
            try
            {
                ZipPackage.ExtractFiles(zipPath, tempDirPath, password);
                for (int i = 0; i < 3; ++i)
                {
                    string filePath = string.Format(filePathFormat, i);
                    Assert.IsTrue(File.Exists(filePath), string.Format("Extracted file '{0}' does not exists", filePath));
                    string extractedContent = File.ReadAllText(filePath);
                    Assert.AreEqual(string.Format(TestContent, filePath), extractedContent, string.Format("Extracted file '{0}' does not have correct content", filePath));
                }
            }
            finally
            {
                filesToZip.ForEach(x =>
                    {
                        if (File.Exists(x.AbsoluteFilePath))
                        {
                            File.Delete(x.AbsoluteFilePath);
                        }
                    });
                if (File.Exists(zipPath))
                {
                    File.Delete(zipPath);
                }
            }
        }

        private void ZipPackage_Directory_Packaging_Extraction(string password)
        {
            var fileList = new string[]
                                {
                                    @"Temp Zip Directory\Level3\Level2\Level1\ZipPackage_Directory_Packaging_Extraction_File1.txt",
                                    @"Temp Zip Directory\Level3\Level2\ZipPackage_Directory_Packaging_Extraction_File2.txt",
                                    @"Temp Zip Directory\Level3\ZipPackage_Directory_Packaging_Extraction_File3.txt",
                                    @"Temp Zip Directory\Level2\Level1\ZipPackage_Directory_Packaging_Extraction_File4.txt",
                                    @"Temp Zip Directory\Level2\Level1\ZipPackage_Directory_Packaging_Extraction_File5.txt",
                                    @"Temp Zip Directory\ZipPackage_Directory_Packaging_Extraction_File6.txt",
                                    @"Temp Zip Directory\ZipPackage_Directory_Packaging_Extraction_File7.txt",
                                    @"Temp Zip Directory\ZipPackage_Directory_Packaging_Extraction_File8.txt",
                                };
            const string TestContent = "This is a Test Content for the file {0}.";
            string tempDirPath = Path.GetTempPath();
            foreach (var file in fileList)
            {
                string filePath = Path.Combine(tempDirPath, file);
                Directory.CreateDirectory(Path.GetDirectoryName(filePath));
                File.WriteAllText(filePath, string.Format(TestContent, file), Encoding.Unicode);
            }

            string dirPath = Path.Combine(tempDirPath, "Temp Zip Directory");
            string zipPath = Path.Combine(tempDirPath, "ZipPackage_Directory_Packaging_Extraction.zip");
            ZipPackage.PackageFiles(dirPath, zipPath, password);

            Directory.Delete(dirPath, true);

            try
            {
                ZipPackage.ExtractFiles(zipPath, dirPath, password);
                foreach (var file in fileList)
                {
                    string filePath = Path.Combine(tempDirPath, file);
                    Assert.IsTrue(File.Exists(filePath), string.Format("Extracted file '{0}' does not exists", filePath));
                    string extractedContent = File.ReadAllText(filePath);
                    Assert.AreEqual(string.Format(TestContent, file), extractedContent, string.Format("Extracted file '{0}' does not have correct content", filePath));
                }
            }
            finally
            {
                Directory.Delete(dirPath, true);
            }
        }
    }
}
