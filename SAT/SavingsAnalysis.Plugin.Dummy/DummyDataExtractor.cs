using System.Collections.Generic;
using System.Data;
using SavingsAnalysis.Client.Common;
using SavingsAnalysis.Plugin.Shopping;

namespace SavingsAnalysis.Plugin.Dummy
{
   public class DummyDataExtractor : BaseDataExtractor
    {
        private IQueryExecutor queryExecutor;

        public override string Name
        {
            get
            {
                return "Dummy";
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
            SqlQueryResultSerializer resultSerializer = new SqlQueryResultSerializer(queryExecutor,context.SccmConnection,outputDirectory);
            foreach (var query in SCCMQueries.Queries())
            {
               resultSerializer.SerializeQueryResult(query.SelectionQuery,query.Name,null,(msg)=> NotifyProgress(
                  new ExtractionEventArgs()
                     {
                        Status = ExtractionStatus.Succeeded,
                        Message = msg
                     }));
            }

           if (SCCMQueries.Queries().Count > 0)
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
