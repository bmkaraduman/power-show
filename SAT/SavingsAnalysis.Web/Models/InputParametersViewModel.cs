namespace SavingsAnalysis.Web.Models
{
    using global::SavingsAnalysis.Web.ViewModels;

    public class InputParametersViewModel
    {
        public CommonInputParameterViewModel Common { get; set; }

        public NightWatchmanInputParameterViewModel NightWatchman { get; set; }

        public ShoppingInputParameterViewModel Shopping { get; set; }
    }
}