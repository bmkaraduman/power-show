namespace SavingsAnalysis.Web.MvcExtensions
{
    using System;
    using System.Runtime.Serialization.Json;
    using System.Text;
    using System.Web.Mvc;

    public class JsonActionResult : ActionResult
    {
        public JsonActionResult()
        {
        }

        public JsonActionResult(object data)
        {
            this.Data = data;
        }

        public string ContentType { get; set; }

        public Encoding ContentEncoding { get; set; }

        public object Data { get; set; }

        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException("context");
            }

            var response = context.HttpContext.Response;
            response.ContentType = !string.IsNullOrEmpty(this.ContentType) ? this.ContentType : "application/json";

            if (this.ContentEncoding != null)
            {
                response.ContentEncoding = this.ContentEncoding;
            }

            if (this.Data == null)
            {
                this.Data = string.Empty;
            }

            var serializer = new DataContractJsonSerializer (this.Data.GetType());
            serializer.WriteObject(response.OutputStream, this.Data);
        }
    }
}