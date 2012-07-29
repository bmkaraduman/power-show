namespace SavingsAnalysis.Web.Core
{
    using System.IO;

    using SavingsAnalysis.AnalysisEngine.Core;
    using SavingsAnalysis.Web.Core.OpenXml;

    public class WordController
    {
        public static string GenerateWordReport(AnalysisDictionary reportValues,  string outputPath, string templatePath)
        {
            if (File.Exists(outputPath))
            {
                File.Delete(outputPath);
            }

            var manager = new WordManager { MergeColsValues = reportValues, FileName = templatePath };
            var content = manager.Bind();

            File.Copy(templatePath, outputPath);
            File.WriteAllBytes(outputPath, content);

            return outputPath;
        }

        public static void UpdatePieChartImage(string docfile, string chartImagefile)
        {
            // Var to the UpdateWordImage class
            var u = new WordImageUpdateMananger();

            // Open the document
            u.OpenTheDocuemnt(docfile);

            u.UpdateImage("ChartImagePlaceholder", chartImagefile);  // Update the image in the current image placeholder
            // Close the Word document
            u.CloseTheDocument();
        }
    }
}
