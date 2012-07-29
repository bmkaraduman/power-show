namespace SavingsAnalysis.Web.Models
{
    using global::SavingsAnalysis.Web.BaseClasses;

    public class SavingsAnalysisModal : BaseModel
    {
        public string Startofworkingday { get; set; }

        public string Endofworkingday { get; set; }

        public string CompanyName { get; set; }

        public string CurrencySymbol { get; set; }

        public string CostPerRequest { get; set; }

        public string Period { get; set; }

        public string StartDate { get; set; }

        public string EndDate { get; set; }

        public string TotalSoftwareDistributions { get; set; }

        public string IsIncludeCostPerSavings { get; set; }

        public string IncludeCostPerSavings { get; set; }

        public string IsIncludeManHours { get; set; }

        public string ManHourSavings { get; set; }

        public string Threshold { get; set; }
    }
}