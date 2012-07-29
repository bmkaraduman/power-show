namespace SavingsAnalysis.Plugin.NightWatchman
{
    using System.Collections.Generic;
    using System.Xml;

    public struct QuerySettings
    {
        public string Name;
        public string SelectionQuery;
        public string ValidationQuery;
    }

    public class NightWatchmanSettings
    {
        public NightWatchmanSettings(string configXmlPath)
        {
            var xmlDoc = new XmlDocument();
            xmlDoc.Load(configXmlPath);
            XmlNodeList nodes = xmlDoc.SelectNodes("configuration/sqlQueries/add");

            Queries = new List<QuerySettings>();
            foreach (XmlNode node in nodes)
            {
                string name = node.Attributes["name"].Value;
                string selection = node.FirstChild.InnerText; // selection node
                string attribute = node.LastChild.InnerText; // validation node
                string validation = attribute ?? string.Empty; 
                if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(selection))
                {
                    Queries.Add(new QuerySettings()
                                    {
                                        Name = name, SelectionQuery = selection, 
                                        ValidationQuery = validation
                                    });
                }
            }
        }

        public List<QuerySettings> Queries { get; protected set; }
    }
}
