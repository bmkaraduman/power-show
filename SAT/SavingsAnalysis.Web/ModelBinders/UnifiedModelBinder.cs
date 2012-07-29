using System.Web.Mvc;

namespace SavingsAnalysis.Web.Models
{
    public class InputParametersModelBinder : DefaultModelBinder
    {
        public override object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            InputParameters model = new InputParameters();
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
            model.Shopping = base.BindModel(controllerContext, new ModelBindingContext()
            {
                ModelMetadata = ModelMetadataProviders.Current.GetMetadataForType(
                    () => new ShoppingInputParameter(),
                    typeof(ShoppingInputParameter)
                ),
                ModelState = bindingContext.ModelState,
                ValueProvider = bindingContext.ValueProvider
            }) as ShoppingInputParameter;

            return model;
        }
    }
}