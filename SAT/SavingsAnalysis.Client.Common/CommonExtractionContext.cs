namespace SavingsAnalysis.Client.Common
{
    using System;

    public class CommonExtractionContext
    {
        public string SccmConnection { get; set; }

        public string CompanyName { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndtDate { get; set; }

        public string BaseWorkDirectory { get; set; }

        public string PluginsDirectory { get; set; }
    }
}