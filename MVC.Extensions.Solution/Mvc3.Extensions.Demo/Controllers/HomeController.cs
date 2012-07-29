using System.Web.Mvc;

namespace Mvc3.Extensions.Demo.Controllers
{
    public partial class HomeController : Controller
    {
        public virtual ActionResult Index( )
        {
            return RedirectToAction( "Index" , "Person" , new { area = "Label" } );
        }
    }
}
