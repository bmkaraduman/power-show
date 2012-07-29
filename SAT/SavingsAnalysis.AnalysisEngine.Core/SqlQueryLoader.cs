namespace SavingsAnalysis.AnalysisEngine.Core
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Xml.Linq;

    public class SqlQueryLoader
    {
        public SqlQueryLoader(string xmlFilePath)
        {
            var xmlDocument = XDocument.Load(xmlFilePath);
            Queries = xmlDocument.Descendants("query").ToDictionary(
                key => key.Attribute("data").Value, value => value.Attribute("value").Value);
        }

        public Dictionary<string, string> Queries { get; protected set; }
    }
}
