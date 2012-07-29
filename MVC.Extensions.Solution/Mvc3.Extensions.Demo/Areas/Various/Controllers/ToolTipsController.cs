using System.Web.Mvc;
using Mvc3.Extensions.Demo.Areas.Various.Models;

namespace Mvc3.Extensions.Demo.Areas.Various.Controllers
{
    public partial class ToolTipsController : Controller
    {
        [HttpGet]
        public virtual ActionResult Register( )
        {
            return View( );
        }

        [HttpPost]
        public virtual ActionResult Register( RegisterModel registerModel )
        {
            return View( );
        }
    }
}
