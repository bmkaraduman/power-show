namespace SavingsAnalysis.AnalysisEngine.Core
{
    using System;
    using System.ComponentModel.Composition;

    /// <summary>
    /// A mechanism to perform analyis on a given (zip) file, and update an analysis dictionary
    /// </summary>
    [InheritedExport]
    public interface IAnalysisEngine
    {
        AnalysisDictionary Analyse(string connectionString, AnalysisDictionary inputParameters);
    }
}