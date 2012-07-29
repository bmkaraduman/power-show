namespace SavingsAnalysis.Web.ViewModels
{
    using System.ComponentModel.DataAnnotations;

    public class ShoppingAnalysisViewModel : ShoppingInputParameterViewModel
    {
        [Display(Name = "Total Requests")]
        public int TotalNumberOfRequests { get; set; }

        [Display(Name = "Total Number Of One Off Requests")]
        public int TotalNumberOfOneOffRequests { get; set; }
    }
}