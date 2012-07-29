using System;
using System.Collections.Generic;
using System.Text;

namespace SavingsAnalysis.Client.Common
{
    public abstract class BaseDataExtractor : IDataExtractor
    {
        public abstract string Name { get; }

        public abstract void ExtractData(string outputDirectory, CommonExtractionContext context,
                                         Dictionary<string, object> pluginSettings);

        public event EventHandler<ExtractionEventArgs> Progess;

        protected void NotifyProgress(ExtractionEventArgs eventArgs)
        {
            if(Progess != null)
            {
                Progess(this, eventArgs);
            }
        }


        public abstract IQueryExecutor QueryExecutor {set ; }
    }
}
