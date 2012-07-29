namespace SavingsAnalysis.AnalysisEngine.Core
{
   using System.Collections.Generic;
  
   public class AnalysisDictionary : Dictionary<string, AnalysisAttribute>
   {
       public string Name { get; set; }
    }
}