namespace SavingsAnalysis.Web.ViewModels
{
    public class OutputParametersViewModel
    {
        public CommonInputParameterViewModel CommonResults { get; set; }

        public NightWatchmanAnalysisResultsViewModel NightWatchmanResults { get; set; }

        public ShoppingAnalysisViewModel ShoppingResults { get; set; }

        public ShoppingProgramListViewModel ShoppingProgramListResults { get; set; }
    }
}