namespace SavingsAnalysis.AnalysisEngine.Core
{
    using System;
    using System.ComponentModel.Composition;
    using System.IO;

    using SavingsAnalysis.Common;

    [Export]
    public class AnalysisManager
    {
        #region Fields

        private Repository repository;

        #endregion

        #region Public Methods and Operators

        public void CleanupAnalysisManager(string sourceFile, string connectionString)
        {
            Repository.DropDatabase(connectionString, sourceFile);
        }

        public void SetupAnalysis(string sourceFile, string tempDirectory, string connectionString)
        {
            if (string.IsNullOrEmpty(sourceFile))
            {
                throw new ArgumentNullException("sourceFile");
            }

            if (string.IsNullOrEmpty(connectionString))
            {
                throw new ArgumentNullException("connectionString");
            }

            if (string.IsNullOrEmpty(tempDirectory))
            {
                throw new ArgumentNullException("tempDirectory");
            }

            if (Directory.Exists(tempDirectory) == false)
            {
                throw new ArgumentException(string.Format("{0} does not exits", tempDirectory));
            }

            if (!File.Exists(sourceFile))
            {
                throw new FileNotFoundException("The file specified for analysis does not exist", sourceFile);
            }

            Directory.CreateDirectory(tempDirectory);

            string zipFileName = Path.GetFileNameWithoutExtension(sourceFile);
            this.repository = new Repository(zipFileName, connectionString);

#if DEBUG
            if (this.repository.DatabaseExists() == false)
            {
#endif
                this.repository.CreateDatabase();

                string unzipLocation = this.UnZipSourceFiles(tempDirectory, sourceFile);
                this.repository.PopulateDataFrom(unzipLocation);
#if DEBUG
            }
#endif
        }

        #endregion

        #region Methods

        private string UnZipSourceFiles(string targetDirectory, string sourceFile)
        {
            // Build a temporary location to put the files
            string workingPath = Path.Combine(targetDirectory, Path.GetFileNameWithoutExtension(sourceFile));
            if (Directory.Exists(workingPath))
            {
                Directory.Delete(workingPath, true);
            }

            Directory.CreateDirectory(workingPath);

            ZipPackage.ExtractFiles(sourceFile, workingPath, string.Empty);

            return workingPath;
        }

        #endregion
    }
}