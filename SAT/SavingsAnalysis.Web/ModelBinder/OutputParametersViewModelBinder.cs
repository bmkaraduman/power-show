namespace SavingsAnalysis.Web.ModelBinder
{
    using System.Web.Mvc;

    using global::SavingsAnalysis.Web.Models;
    using global::SavingsAnalysis.Web.ViewModels;

    public class OutputParametersViewModelBinder : DefaultModelBinder
    {
        public override object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var model = new OutputParametersViewModel
                {
                    CommonResults = 
                        base.BindModel(
                            controllerContext,
                            new ModelBindingContext()
                                {
                                    ModelMetadata =
                                        ModelMetadataProviders.Current.GetMetadataForType(
                                            () => new CommonInputParameterViewModel(), typeof(CommonInputParameterViewModel)),
                                    ModelState = bindingContext.ModelState,
                                    ValueProvider = bindingContext.ValueProvider
                                }) as CommonInputParameterViewModel,
                    NightWatchmanResults =
                        base.BindModel(
                            controllerContext,
                            new ModelBindingContext()
                                {
                                    ModelMetadata =
                                        ModelMetadataProviders.Current.GetMetadataForType(
                                            () => new NightWatchmanAnalysisResultsViewModel(),
                                            typeof(NightWatchmanAnalysisResultsViewModel)),
                                    ModelState = bindingContext.ModelState,
                                    ValueProvider = bindingContext.ValueProvider
                                }) as NightWatchmanAnalysisResultsViewModel,
                    ShoppingResults =
                        base.BindModel(
                            controllerContext,
                            new ModelBindingContext()
                                {
                                    ModelMetadata =
                                        ModelMetadataProviders.Current.GetMetadataForType(
                                            () => new ShoppingAnalysisViewModel(), typeof(ShoppingAnalysisViewModel)),
                                    ModelState = bindingContext.ModelState,
                                    ValueProvider = bindingContext.ValueProvider
                                }) as ShoppingAnalysisViewModel
                };


            return model;
        }
    }
}