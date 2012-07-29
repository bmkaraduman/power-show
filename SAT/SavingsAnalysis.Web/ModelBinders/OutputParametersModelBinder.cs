using System.Web.Mvc;
using SavingsAnalysis.Web.Models;

namespace SavingsAnalysis.Web.Models
{
    public class OutputParametersModelBinder : DefaultModelBinder
    {
        public override object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            OutputParameters model = new OutputParameters();
            model.Common = base.BindModel(controllerContext, new ModelBindingContext()
            {
                ModelMetadata = ModelMetadataProviders.Current.GetMetadataForType(
                    () => new CommonInputParameter(),
                    typeof(CommonInputParameter)
                ),
                ModelState = bindingContext.ModelState,
                ValueProvider = bindingContext.ValueProvider
            }) as CommonInputParameter;
            model.NightWatchman = base.BindModel(controllerContext, new ModelBindingContext()
            {
                ModelMetadata = ModelMetadataProviders.Current.GetMetadataForType(
                    () => new NightWatchmanInputParameter(),
                    typeof(NightWatchmanInputParameter)
                ),
                ModelState = bindingContext.ModelState,
                ValueProvider = bindingContext.ValueProvider
            }) as NightWatchmanInputParameter;

            model.NightWatchmanResult = base.BindModel(controllerContext, new ModelBindingContext()
            {
                ModelMetadata = ModelMetadataProviders.Current.GetMetadataForType(
                    () => new NightWatchmanAnalysisResults(),
                    typeof(NightWatchmanAnalysisResults)
                ),
                ModelState = bindingContext.ModelState,
                ValueProvider = bindingContext.ValueProvider
            }) as NightWatchmanAnalysisResults;
            model.Shopping = base.BindModel(controllerContext, new ModelBindingContext()
            {
                ModelMetadata = ModelMetadataProviders.Current.GetMetadataForType(
                    () => new ShoppingInputParameter(),
                    typeof(ShoppingInputParameter)
                ),
                ModelState = bindingContext.ModelState,
                ValueProvider = bindingContext.ValueProvider
            }) as ShoppingInputParameter;
            model.ShoppingResults = base.BindModel(controllerContext, new ModelBindingContext()
            {
                ModelMetadata = ModelMetadataProviders.Current.GetMetadataForType(
                    () => new ShoppingAnalysisResults(),
                    typeof(ShoppingAnalysisResults)
                ),
                ModelState = bindingContext.ModelState,
                ValueProvider = bindingContext.ValueProvider
            }) as ShoppingAnalysisResults;

            return model;
        }
    }
}