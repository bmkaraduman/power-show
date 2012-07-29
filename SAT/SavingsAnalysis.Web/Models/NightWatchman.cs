using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace SavingsAnalysis.Web.Models
{
    public class NightWatchmanInputParameter
    {
        [Required(ErrorMessage = "Start time is not filled")]
        [Display(Name = "Hours (HH:MM) when company's working day begins")]
        public string StartTime { get; set; }

        [Required(ErrorMessage = "End time is not filled")]
        [Display(Name = "Hours (HH:MM) when company's working day begins")]
        public string EndTime { get; set; }

        public NightWatchmanInputParameter()
        {
            StartTime = "07:00";
            EndTime = "19:00";
        }
    }

    public class NightWatchmanAnalysisResults
    {
        [Display(Name = "Number Of Desktops")]
        public int NumberOfDesktops { get; set; }
        [Display(Name = "Number Of Laptops")]
        public int NumberOfLaptops { get; set; }
    }
}