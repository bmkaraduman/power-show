namespace SavingsAnalysis.Web.ViewModels
{
    using System.ComponentModel.DataAnnotations;

    public class NightWatchmanInputParameterViewModel
    {
        public NightWatchmanInputParameterViewModel()
        {
            this.StartTime = "07:00";
            this.EndTime = "19:00";
        }

        [Required(ErrorMessage = "Start time is not filled")]
        [Display(Name = "Hours (HH:MM) when company's working day begins")]
        public string StartTime { get; set; }

        [Required(ErrorMessage = "End time is not filled")]
        [Display(Name = "Hours (HH:MM) when company's working day ends")]
        public string EndTime { get; set; }
   }
}