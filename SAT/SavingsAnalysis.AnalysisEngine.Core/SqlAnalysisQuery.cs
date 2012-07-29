namespace SavingsAnalysis.AnalysisEngine.Core
{
    using System;
    using System.Collections.Generic;

    /// <summary>
    /// A SQL query and a set of of statistics to extract from the results (based on getting
    /// a statistic from a named column)
    /// </summary>
    public class SqlAnalysisQuery
    {
        private readonly string queryText;
        private readonly Dictionary<string, string> statisticNamesToColumnsMap;

        public SqlAnalysisQuery(string queryText, string statisticName, string statisticColumn) :
            this(queryText, new Dictionary<string, string> { { statisticName, statisticColumn } })
        {
        }

        public SqlAnalysisQuery(string queryText, IDictionary<string, string> statisticNamesToColumnsSet)
        {
            if (string.IsNullOrWhiteSpace(queryText))
            {
                throw new ArgumentNullException("queryText");
            }

            this.queryText = queryText;
            this.statisticNamesToColumnsMap = new Dictionary<string, string>(statisticNamesToColumnsSet);
        }

        public string QueryText
        {
            get
            {
                return this.queryText;
            }
        }

        public Dictionary<string, string> StatisticNamesToColumnsMap
        {
            get
            {
                return new Dictionary<string, string>(this.statisticNamesToColumnsMap);
            }
        }
    }
}
