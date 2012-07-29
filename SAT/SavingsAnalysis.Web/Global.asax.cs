using SavingsAnalysis.Web.ModelBinder;

namespace SavingsAnalysis.Web
{
    using System;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Routing;

    using global::SavingsAnalysis.Web.Models;
    using global::SavingsAnalysis.Web.ViewModels;

    public class SavingsAnalysis : HttpApplication
    {
        public static readonly log4net.ILog Log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "SavingsAnalysis", action = "Index", id = UrlParameter.Optional });
            routes.MapRoute(
                "Error", // Route name
                "{controller}/{action}", // URL with parameters
                new { controller = "SavingsAnalysis", action = "Error", id = UrlParameter.Optional });
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);

            ModelBinders.Binders.Add(typeof(InputParametersViewModel), new InputParametersViewModelBinder());
            ModelBinders.Binders.Add(typeof(OutputParametersViewModel), new OutputParametersViewModelBinder());
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            var error = Server.GetLastError();
            Log.Error(error);
            Response.Redirect(@"~/SavingsAnalysis/Error");
        }
    }
}