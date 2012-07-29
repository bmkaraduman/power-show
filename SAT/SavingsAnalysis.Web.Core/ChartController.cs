namespace SavingsAnalysis.Web.Core
{
    using System.Collections.Generic;
    using SavingsAnalysis.AnalysisEngine.Core;
    using SavingsAnalysis.Web.Core.Charts;

    public class ChartController
    {
        public static void GeneratePieChartImage(AnalysisDictionary objchartdatasource, string path, List<string> keys, string chartimagepath)
        {
            var objChart = new PieChart(objchartdatasource, keys, chartimagepath);
            objChart.GeneratePieChartImage();
        }
    }
}
