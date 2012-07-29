namespace SavingsAnalysis.Web.ModelBinder
{
    using System.Web.Mvc;

    using global::SavingsAnalysis.Web.Models;
    using global::SavingsAnalysis.Web.ViewModels;

    public class InputParametersViewModelBinder : DefaultModelBinder
    {
        public override object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var model = new InputParametersViewModel
                {
                    Common =
                        base.BindModel(
                            controllerContext,
                            new ModelBindingContext
                            {
                                ModelMetadata =
                                    ModelMetadataProviders.Current.GetMetadataForType(
                                        () => new CommonInputParameterViewModel(), typeof(CommonInputParameterViewModel)),
                                ModelState = bindingContext.ModelState,
                                ValueProvider = bindingContext.ValueProvider
                            }) as CommonInputParameterViewModel,
                    NightWatchman =
                        base.BindModel(
                            controllerContext,
                            new ModelBindingContext
                            {
                                ModelMetadata =
                                    ModelMetadataProviders.Current.GetMetadataForType(
                                        () => new NightWatchmanInputParameterViewModel(), typeof(NightWatchmanInputParameterViewModel)),
                                ModelState = bindingContext.ModelState,
                                ValueProvider = bindingContext.ValueProvider
                            }) as NightWatchmanInputParameterViewModel,
                    Shopping =
                        base.BindModel(
                            controllerContext,
                            new ModelBindingContext
                            {
                                ModelMetadata =
                                    ModelMetadataProviders.Current.GetMetadataForType(
                                        () => new ShoppingInputParameterViewModel(), typeof(ShoppingInputParameterViewModel)),
                                ModelState = bindingContext.ModelState,
                                ValueProvider = bindingContext.ValueProvider
                            }) as ShoppingInputParameterViewModel
                };


            model.Shopping.ExclusionFilter = model.Shopping.ExclusionFilter.Replace(@"\r\n", ",");
            return model;
        }
    }
}