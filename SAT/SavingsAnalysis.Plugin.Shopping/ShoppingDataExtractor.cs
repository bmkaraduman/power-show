using System.Collections.Generic;
using System.Data;
using SavingsAnalysis.Client.Common;

namespace SavingsAnalysis.Plugin.Shopping
{
   public class ShoppingDataExtractor : BaseDataExtractor
   {
        private IQueryExecutor queryExecutor;

        public override string Name
        {
            get
            {
                return "Shopping";
            }
        }

        public override IQueryExecutor QueryExecutor
        {
            set
            {
                queryExecutor = value;
            }
        }

        public override void ExtractData(string outputDirectory, CommonExtractionContext context, Dictionary<string, object> pluginSettings)
        {
            var collectorQueries = new CollectorQueries();
            SqlQueryResultSerializer resultSerializer = new SqlQueryResultSerializer(queryExecutor, context.SccmConnection, outputDirectory);
            foreach (var query in collectorQueries.Queries)
            {
               resultSerializer.SerializeQueryResult(query.SelectionQuery, query.Name, null, (msg) => NotifyProgress(
                           new ExtractionEventArgs()
                           {
                              Status = ExtractionStatus.Succeeded,
                              Message = msg
                           }));
            }

            if (collectorQueries.Queries.Count > 0)
            {
                NotifyProgress(
                    new ExtractionEventArgs()
                        {
                            Status = ExtractionStatus.Succeeded,
                            Message = "All query results collected successfully."
                        });
            }
        }
    }
  
}

