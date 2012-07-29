namespace SavingsAnalysis.Web.MvcExtensions
{
    using System.Linq;
    using System.Text;
    using System.Web.Mvc;

    public class JsonActionFilterAttribute : ActionFilterAttribute
    {
        public static readonly string[] JsonTypes = new[] { "application/json", "text/json" };

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            if (filterContext.Result is RedirectToRouteResult)
            {
                return;
            }

            var acceptTypes = filterContext.HttpContext.Request.AcceptTypes ?? new[] { "text/html" };

            var model = filterContext.Controller.ViewData.Model;

            var contentEncoding = filterContext.HttpContext.Request.ContentEncoding ?? Encoding.Unicode;

            if (JsonTypes.Any(acceptTypes.Contains))
            {
                filterContext.Result = new JsonActionResult
                    {
                        Data = model,
                        ContentEncoding = contentEncoding,
                        ContentType = filterContext.HttpContext.Request.ContentType
                    };
            }
        }
    }
}