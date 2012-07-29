using System;
using System.Collections.Generic;

namespace SavingsAnalysis.Client.Common
{
    public interface IDataExtractor
    {
        string Name { get; }
        /// <summary>
        /// Implementation is respnsible for extracting data and creating data files in outputDirectory
        /// </summary>
        /// <param name="outputDirectory">Full path into which plugin should write its data</param>
        /// <param name="context">Common Setting for all the plugins </param>
        /// <param name="pluginSettings">Plugin specific settings </param>
        void ExtractData(string outputDirectory, CommonExtractionContext context, Dictionary<string, object> pluginSettings);
        event EventHandler<ExtractionEventArgs> Progess;
        IQueryExecutor QueryExecutor { set; }
    }

    public enum ExtractionStatus
    {
        Succeeded,
        Info,
        Failed
    }

    public class ExtractionEventArgs : EventArgs
    {
        public ExtractionStatus Status;
        public string Message;
        public Object EventData;

        public string StatusDescription()
        {
            string state = "Succeded";
            switch (Status)
            {
                default:
                    state = "Failed";
                    break;
                case ExtractionStatus.Succeeded:
                    break;
            }

            return state;
        }
    }
}