using System.Web.Mvc;

namespace Mvc3.Extensions.Demo.Areas.Various
{
    public class VariousAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Various";
            }
        }

        public override void RegisterArea( AreaRegistrationContext context )
        {
            context.MapRoute(
                "Various_default" ,
                "Various/{controller}/{action}/{id}" ,
                new { action = "Index" , id = UrlParameter.Optional }
            );
        }
    }
}
