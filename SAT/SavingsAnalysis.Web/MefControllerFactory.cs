using System;
using System.ComponentModel.Composition.Hosting;
using System.Linq;
using System.Web.Mvc;
using System.Web.Routing;

namespace SavingsAnalysis.Web
{
   public class MefControllerFactory : DefaultControllerFactory
   {
      private CompositionContainer container;
      public MefControllerFactory(CompositionContainer container)
      {
            this.container = container;
      }
      
      public override IController CreateController(RequestContext requestContext, string controllerName)
      {
         IController controller = null;
         if (controllerName != null)
         {
            string controllerClassName = controllerName + "Controller";

            var contractFullName = (from p in container.Catalog.Parts
             from e in p.ExportDefinitions
             where e.ContractName.EndsWith(controllerClassName)
             select e.ContractName).FirstOrDefault();

            if (contractFullName != null)
            {
               var export = container.GetExportedValue<object>(contractFullName);
               if (export != null)
               {
                  controller = (IController) export;
               }
            }
         }
         if (controller == null)
         {
            return base.CreateController(requestContext, controllerName);
         }
         return controller;
      }

      public override void ReleaseController(IController controller)
      {
         IDisposable disposable = controller as IDisposable;
         if (disposable != null)
         {
            disposable.Dispose();
         } 
      }
   }
}