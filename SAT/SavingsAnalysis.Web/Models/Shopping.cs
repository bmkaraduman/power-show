using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace SavingsAnalysis.Web.Models
{
    public class ShoppingInputParameter
    {
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


        public ShoppingInputParameter() 
        {
            CurrencySymbol = "£";
            CostPerRequest = 32;
            Period = 31;
            ManHourSavings = 39;
            Threshold = 123;
        }
    }

    public class ShoppingAnalysisModel
    {
        public ShoppingInputParameter Input { get; set; }

        public ShoppingAnalysisResults ShoppingResults { get; set; }
    }


    public class ShoppingAnalysisResults
    {
        [Display(Name = "Total Requests")]
        public int TotalRequest { get; set; }
    }
}