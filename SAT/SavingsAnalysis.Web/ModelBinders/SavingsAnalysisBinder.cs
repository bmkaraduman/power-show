namespace SavingsAnalysis.Web.Models
{
    using System.Web.Mvc;

    public class SavingsAnalysisBinder : DefaultModelBinder
    {
        protected override void OnModelUpdated(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var obj = bindingContext.Model as SavingsAnalysisModal;
        }
    }
}