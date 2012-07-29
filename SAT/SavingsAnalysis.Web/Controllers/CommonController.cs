using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SavingsAnalysis.Web.Models;

namespace SavingsAnalysis.Web.Controllers
{
    public class CommonController : Controller
    {
        //
        // GET: /Common/

        public ActionResult InputParameter(CommonInputParameter input)
        {
            return PartialView(input);
        }

        public ActionResult Analysis(CommonInputParameter analysis)
        {
            return PartialView(analysis);
        }
    }
}
