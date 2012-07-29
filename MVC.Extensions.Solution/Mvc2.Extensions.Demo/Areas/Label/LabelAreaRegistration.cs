using System.Web.Mvc;

namespace Mvc2.Extensions.Demo.Areas.Label
{
    public class LabelAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Label";
            }
        }

        public override void RegisterArea( AreaRegistrationContext context )
        {
            context.MapRoute(
                "Label_default" ,
                "Label/{controller}/{action}/{id}" ,
                new { action = "Index" , id = UrlParameter.Optional }
            );
        }
    }
}
