using System.Web.Mvc;
using Mvc3.Extensions.Demo.Areas.Label.Models;

namespace Mvc3.Extensions.Demo.Areas.Label.Controllers
{
    public partial class PersonController : Controller
    {
        [HttpGet]
        public virtual ActionResult Index( )
        {
            return RedirectToAction( "Edit" );
        }

        [HttpGet]
        public virtual ActionResult Edit( )
        {
            return View( );
        }

        [HttpPost]
        public virtual ActionResult Edit( PersonViewModel person )
        {
            if ( ModelState.IsValid )
            {
                TempData[ "messge" ] = "Person saved";
            }

            return View( );
        }
    }
}
