using System.ComponentModel.DataAnnotations;

namespace SavingsAnalysis.Web.Models
{
    public class InputParameters
    {
        public CommonInputParameter Common { get; set; }
        public NightWatchmanInputParameter NightWatchman { get; set; }
        public ShoppingInputParameter Shopping { get; set; }
    }

    public class OutputParameters
    {
        public CommonInputParameter Common { get; set; }
        public NightWatchmanInputParameter NightWatchman { get; set; }
        public NightWatchmanAnalysisResults NightWatchmanResult { get; set; }
        public ShoppingInputParameter Shopping { get; set; }
        public ShoppingAnalysisResults ShoppingResults { get; set; }
    }

    public class ParametersModel
    {
        [Required(ErrorMessage = "File name is missing")]
        [Display(Name = "File Name")]
        public string FileName { get; set; }

        [Required(ErrorMessage = "Company name is missing")]
        [Display(Name = "Company name")]
        public string CompanyName { get; set; }

        [Required(ErrorMessage = "Start time is not filled")]
        [Display(Name = "Hours (HH:MM) when company's working day begins")]
        public string StartTime { get; set; }

        [Required(ErrorMessage = "End time is not filled")]
        [Display(Name = "Hours (HH:MM) when company's working day begins")]
        public string EndTime { get; set; }

        [Required(ErrorMessage = "Require value £ or $")]
        [Display(Name = "Currency Symbol ($,£)")]
        public string CurrencySymbol { get; set; }

        [Required(ErrorMessage = "Cost Per Request missing")]
        [Display(Name = "Cost Per Request")]
        public int CostPerRequest { get; set; }

        [Required(ErrorMessage = "Period value missing")]
        [Display(Name = "Period")]
        public int Period { get; set; }

        [Required(ErrorMessage = "Man hour value missing")]
        [Display(Name = "Man hours savings")]
        public int ManHourSavings { get; set; }

        [Required(ErrorMessage = "Threshold value missing")]
        [Display(Name = "Threshold")]
        public int Threshold { get; set; }

        [Display(Name = "Number Of Desktops")]
        public int NumberOfDesktops { get; set; }

        [Display(Name = "Number Of Laptops")]
        public int NumberOfLaptops { get; set; }

        [Display(Name = "Total Requests")]
        public int TotalRequest { get; set; }

        public ParametersModel()
        {
            CompanyName = "My Company";
            StartTime = "07:00";
            EndTime = "19:00";
            CurrencySymbol = "£";
            CostPerRequest = 32;
            Period = 31;
            ManHourSavings = 39;
            Threshold = 123;
        }
    }
}