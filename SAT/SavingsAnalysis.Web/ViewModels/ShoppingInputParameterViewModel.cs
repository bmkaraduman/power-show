namespace SavingsAnalysis.Web.ViewModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Web.Mvc;

    public class ShoppingInputParameterViewModel
    {
        public ShoppingInputParameterViewModel()
        {
            this.CostPerRequest = Convert.ToDouble(EnvironmentSettings.GetConfigSectionValues("Shopping")["CostPerRequest"]);
            this.ExcludedPackages = new List<string>();
            this.IncludedPackages = new List<string>();
            this.ManHourSavings = Convert.ToInt32(EnvironmentSettings.GetConfigSectionValues("Shopping")["ManHourSavings"]);
            this.MaxNoOfProgramsToReportOn = Convert.ToInt32(EnvironmentSettings.GetConfigSectionValues("Shopping")["MaxNoOfProgramsToReportOn"]);
            this.Period = Convert.ToInt32(EnvironmentSettings.GetConfigSectionValues("Shopping")["Period"]);
            this.ShopEndDate = DateTime.UtcNow;
            this.ShopStartDate = DateTime.UtcNow.AddDays(-this.Period);
            this.Threshold = 1;
            this.TotalDistributionCount = 0;
        }

        [Required(ErrorMessage = "Cost Per Request missing")]
        [Display(Name = "Cost Per Request")]
        public double CostPerRequest { get; set; }

        [Required(ErrorMessage = "Period value missing")]
        [Display(Name = "Period")]
        public int Period { get; set; }

        [Required(ErrorMessage = "Man hour value missing")]
        [Display(Name = "Man hours savings")]
        public int ManHourSavings { get; set; }

        [Required(ErrorMessage = "Threshold value missing")]
        [Display(Name = "Threshold")]
        public int Threshold { get; set; }

        [Required(ErrorMessage = "Start date missing")]
        [Display(Name = "Start Date")]
        [DataType(DataType.Date)]
        public DateTime ShopStartDate { get; set; }

        [Required(ErrorMessage = "ShopEndDate value missing")]
        [Display(Name = "End Date")]
        [DataType(DataType.Date)]
        public DateTime ShopEndDate { get; set; }

        [Required(ErrorMessage = "HelpDeskCost value missing")]
        [Display(Name = "HelpDeskCost")]
        public double HelpDeskCost { get; set; }

        [Required(ErrorMessage = "Maximim Number Of Programs To Report On value missing")]
        [Display(Name = "Maximum Programs")]
        public int MaxNoOfProgramsToReportOn { get; set; }

        [Display(Name = "Include Cost Per Savings")]
        public bool IsIncludeCostPerSavings { get; set; }

        [Display(Name = "Include Man Hours")]
        public bool IsIncludeManHours { get; set; }

        [Display(Name = "Number Of Active Machines")]
        public int NumberOfActiveMachines { get; set; }

        [Display(Name = "Exclusions")]
        public string ExclusionFilter { get; set; }

        public string IncludedPackage { get; set; }

        public string ExcludedPackage { get; set; }

        public List<string> ExcludedPackages { get; set; }

        public List<string> IncludedPackages { get; set; }

        public int TotalDistributionCount { get; set; }

        [DisplayName("Exclusion Packages")]
        public List<SelectListItem> ExcludedPackageList
        {
            get
            {
                return this.ExcludedPackages.Select(x => new SelectListItem { Text = x, Value = x }).ToList();
            }
        }

        [DisplayName("Included Packages")]
        public List<SelectListItem> IncludedPackageList
        {
            get
            {
                return this.IncludedPackages.Select(x => new SelectListItem { Text = x, Value = x }).ToList();
            }
        }
    }
}