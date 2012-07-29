using System.Collections.Generic;
using System.Data.SqlClient;
using System.Xml.Linq;
using SavingsAnalysis.AnalysisEngine.Core;
using SavingsAnalysis.AnalysisEngine.Dummy.Properties;

namespace SavingsAnalysis.AnalysisEngine.Dummy
{
   public class DummyAnalysis : IAnalysisEngine
   {
      public string ConnectionString { get; set; }

      public AnalysisDictionary Analyse(string connectionString, AnalysisDictionary values)
      {
         ConnectionString = connectionString;
         var analysisResult = new AnalysisDictionary { Name = "Shopping" };
         var queries = GetQueries(analysisResult);
         RunQueries(queries, analysisResult);
         return analysisResult;
      }

      private void RunQueries(IEnumerable<SqlAnalysisQuery> queries, AnalysisDictionary values)
      {
         using (var cnn = new SqlConnection(this.ConnectionString))
         {
            cnn.Open();
            var runner = new SqlAnalysisQueryRunner();
            foreach (var query in queries)
            {
               runner.Run(cnn, query, values , null);
            }
         }
      }

      private List<SqlAnalysisQuery> GetQueries(AnalysisDictionary values)
      {
         var xmlDocument = XDocument.Parse(Resources.SavingsAnalysis_AnalysisEngine_Dummy);
         var analysisQueries = new List<SqlAnalysisQuery>();
         foreach (var query in xmlDocument.Descendants("query"))
         {
            var queryAttrib = query.Element("value");
            var nameAttrib = query.Attribute("data");
            if (queryAttrib != null && nameAttrib != null && !string.IsNullOrEmpty(queryAttrib.Value) && !string.IsNullOrEmpty(nameAttrib.Value))
            {
               analysisQueries.Add(new SqlAnalysisQuery(queryAttrib.Value, nameAttrib.Value, nameAttrib.Value));
               if (values.ContainsKey(nameAttrib.Value) == false)
                  values.Add(nameAttrib.Value, new AnalysisAttribute());
            }
         }
         return analysisQueries;
      }
   }
}
