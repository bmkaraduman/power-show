using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using SavingsAnalysis.Plugin.Shopping.Properties;

namespace SavingsAnalysis.Plugin.Shopping
{
   public struct QuerySettings
   {
      public string Name;
      public string SelectionQuery;
      public string ValidationQuery;
   }

   public class CollectorQueries
   {
      public CollectorQueries()
      {
         var xmlDoc = new XmlDocument();
         xmlDoc.LoadXml(Resources.SavingsAnalysis_Plugin_Shopping);
         XmlNodeList nodes = xmlDoc.SelectNodes("configuration/sqlQueries/add");

         Queries = new List<QuerySettings>();
         foreach (XmlNode node in nodes)
         {
            string name = node.Attributes["name"].Value;
            string selection = node.FirstChild.InnerText;// selection node
            string attribute = node.LastChild.InnerText; // validation node
            string validation = attribute ?? string.Empty;
            if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(selection))
            {
               Queries.Add(new QuerySettings()
               {
                  Name = name,
                  SelectionQuery = selection,
                  ValidationQuery = validation
               });
            }
         }
      }

      public List<QuerySettings> Queries { get; protected set; }
   }
}
