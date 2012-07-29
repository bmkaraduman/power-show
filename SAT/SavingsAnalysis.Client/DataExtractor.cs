namespace SavingsAnalysis.Client
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Reflection;

    using log4net;

    using SavingsAnalysis.Client.Common;
    using SavingsAnalysis.Common;

    public class DataExtractor
    {
        #region Static Fields

        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        #endregion

        #region Fields

        private readonly IDataExtractorFactory extractorFactory;

        private readonly IQueryExecutor queryExecutor;

        private int extractionSuccessCount;

        #endregion

        #region Constructors and Destructors

        public DataExtractor(IDataExtractorFactory dataExtractorFactory, IQueryExecutor executor)
        {
            this.extractorFactory = dataExtractorFactory;
            this.queryExecutor = executor;
        }

        #endregion

        #region Public Methods and Operators

        public string BuildPackage(CommonExtractionContext context)
        {
            // Loop through all the plugins and extract their data
            string extractedData = Path.Combine(context.BaseWorkDirectory, "SavingsAnalysisData");
            List<IDataExtractor> extractors = this.extractorFactory.GetDataExtractors();

            if (Directory.Exists(extractedData))
            {
                Directory.Delete(extractedData, true);
            }

            Directory.CreateDirectory(extractedData);

            foreach (IDataExtractor extractor in extractors)
            {
                try
                {
                    extractor.Progess += this.OnNotifyProgress;
                    extractor.QueryExecutor = this.queryExecutor;
                    extractor.ExtractData(extractedData, context, null);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());

                    Log.Fatal(ex);

                    // throw;
                }
            }

            string zipPath = string.Empty;

            if (this.Succeded())
            {
                zipPath = Path.Combine(context.BaseWorkDirectory, string.Format("{0}.zip", context.CompanyName));
                ZipPackage.PackageFiles(extractedData, zipPath, string.Empty);
            }

            Directory.Delete(extractedData, true);
            return zipPath;
        }

        public bool Succeded()
        {
            return this.extractionSuccessCount > 0;
        }

        #endregion

        #region Methods

        private void OnNotifyProgress(object sender, ExtractionEventArgs eventArgs)
        {
            if (eventArgs.Status == ExtractionStatus.Succeeded)
            {
                this.extractionSuccessCount += 1;
            }

            var extractor = (IDataExtractor)sender;

            string message = string.Format("{0} [{1}]: {2}", extractor.Name, eventArgs.Status, eventArgs.Message);

            Log.Debug(message);
        }

        #endregion
    }
}