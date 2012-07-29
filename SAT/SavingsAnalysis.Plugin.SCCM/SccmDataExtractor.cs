namespace SavingsAnalysis.Plugin.SCCM
{
    using System.Collections.Generic;

    using SavingsAnalysis.Client.Common;

    public class SccmDataExtractor : BaseDataExtractor
    {
        #region Fields

        private IQueryExecutor queryExecutor;

        #endregion

        #region Public Properties

        public override string Name
        {
            get
            {
                return "SCCM";
            }
        }

        public override IQueryExecutor QueryExecutor
        {
            set
            {
                this.queryExecutor = value;
            }
        }

        #endregion

        #region Public Methods and Operators

        public override void ExtractData(
            string outputDirectory, CommonExtractionContext context, Dictionary<string, object> pluginSettings)
        {
            var collectorQueries = new CollectorQueries();
            var collectionStatistics = new Dictionary<string, long>();
            var resultSerializer = new SqlQueryResultSerializer(
                this.queryExecutor, context.SccmConnection, outputDirectory);
            foreach (QuerySettings query in collectorQueries.Queries)
            {
                long numberOfRows = resultSerializer.SerializeQueryResult(
                    query.SelectionQuery, query.Name, null, (msg) => this.Notify(ExtractionStatus.Info, msg));
                collectionStatistics.Add(query.Name, numberOfRows);
            }

            if (collectorQueries.Queries.Count > 0)
            {
                this.Notify(ExtractionStatus.Succeeded, "All query results collected successfully.");
                foreach (var stats in collectionStatistics)
                {
                    this.Notify(ExtractionStatus.Info, string.Format("{0} {1} rows collected", stats.Key, stats.Value));
                }
            }
        }

        #endregion

        #region Methods

        private void Notify(ExtractionStatus status, string message)
        {
            this.NotifyProgress(new ExtractionEventArgs { Status = status, Message = message });
        }

        #endregion
    }
}