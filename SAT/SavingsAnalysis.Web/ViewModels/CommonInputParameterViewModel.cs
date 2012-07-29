namespace SavingsAnalysis.Web.ViewModels
{
    using System.ComponentModel.DataAnnotations;
    using System.Configuration;

    public class CommonInputParameterViewModel
    {
        public CommonInputParameterViewModel()
            : this("My Company")
        {
        }

        public CommonInputParameterViewModel(string companyName)
        {
            this.CompanyName = companyName;
            this.CurrencySymbol = (string)EnvironmentSettings.GetConfigSectionValues("Common")["CurrencySymbol"];
        }

        [Required(ErrorMessage = "Require value")]
        [Display(Name = "Currency Symbol")]
        public string CurrencySymbol { get; set; }
        
        [Required(ErrorMessage = "File name is missing")]
        [Display(Name = "File name")]
        public string FileName { get; set; }

        [Required(ErrorMessage = "Company name is missing")]
        [Display(Name = "Company name")]
        public string CompanyName { get; set; }
    }
}