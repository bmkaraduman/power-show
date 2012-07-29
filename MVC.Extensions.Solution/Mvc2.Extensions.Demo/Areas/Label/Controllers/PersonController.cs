
using System.Web.Mvc;
using Mvc2.Extensions.Demo.Areas.Label.Models;


namespace Mvc2.Extensions.Demo.Areas.Label.Controllers
{
    public class PersonController : Controller
    {
        [HttpGet]
        public ActionResult Index( )
        {
            return RedirectToAction( "Edit" );
        }

        [HttpGet]
        public ActionResult Edit( )
        {
            return View( );
        }

        [HttpPost]
        public ActionResult Edit( Person person )
        {
            if ( ModelState.IsValid )
            {
                TempData[ "messge" ] = "Person saved";
            }

            return View( );
        }

    }
}
