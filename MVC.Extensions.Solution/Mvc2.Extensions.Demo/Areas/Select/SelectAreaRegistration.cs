using System.Web.Mvc;

namespace Mvc2.Extensions.Demo.Areas.Select
{
    public class SelectAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Select";
            }
        }

        public override void RegisterArea( AreaRegistrationContext context )
        {
            context.MapRoute(
                "Select_default",
                "Select/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
