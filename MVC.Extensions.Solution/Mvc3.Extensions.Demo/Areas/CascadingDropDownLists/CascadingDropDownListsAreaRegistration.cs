using System.Web.Mvc;

namespace Mvc3.Extensions.Demo.Areas.CascadingDropDownLists
{
    public class CascadingDropDownListsAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "CascadingDropDownLists";
            }
        }

        public override void RegisterArea( AreaRegistrationContext context )
        {
            context.MapRoute(
                "CascadingDropDownLists_default" ,
                "CascadingDropDownLists/{controller}/{action}/{id}" ,
                new { action = "Index" , id = UrlParameter.Optional }
            );
        }
    }
}
