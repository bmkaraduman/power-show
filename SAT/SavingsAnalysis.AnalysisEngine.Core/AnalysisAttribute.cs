namespace SavingsAnalysis.AnalysisEngine.Core
{
    public class AnalysisAttribute
    {
        public string Name { get; set; }
        
        public string Description { get; set; }
        
        public string Value { get; set; }

        public bool IsValidate { get; set; }

        public string ValidateRegEx { get; set; }

        public string ToolTip { get; set; }
    }
}
