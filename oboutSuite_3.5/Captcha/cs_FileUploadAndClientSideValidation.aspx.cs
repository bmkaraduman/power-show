using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Captcha_cs_FileUploadAndClientSideValidation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            if (fileUpload1.PostedFiles.Count > 0)
            {
                // form the result HTML
                HtmlGenericControl span = new HtmlGenericControl("span");
                result.Controls.Add(span);
                span.Style[HtmlTextWriterStyle.FontWeight] = "bold";
                span.Controls.Add(new LiteralControl(FirstName.Text + " " + LastName.Text));
                result.Controls.Add(new LiteralControl(":<br /><br />"));
                HtmlImage imageElement = new HtmlImage();
                string url = Page.Request.Path;
                url += ((url.IndexOf("?") > 0) ? "&" : "?") + "getimage=true&rnd="+(new Random().Next().ToString());
                imageElement.Src = url;
                // set image's size
                System.Drawing.Bitmap image = new System.Drawing.Bitmap(fileUpload1.PostedFiles[0].InputStream);
                int maxHeight = int.Parse(imageheight.Value) - 35; // max height of the image
                int mWidth = image.Width;
                int mHeight = image.Height;

                if (mHeight > maxHeight)
                {
                    mWidth = (int)((double)mWidth * ((double)maxHeight / (double)mHeight));
                    mHeight = maxHeight;
                }
                if (mHeight == 0) mHeight = 5;
                if (mWidth == 0) mWidth = 5;

                imageElement.Height = mHeight;
                imageElement.Width = mWidth;
                result.Controls.Add(imageElement);

                // save uploaded image to the Session variable
                byte[] imageBytes = new byte[fileUpload1.PostedFiles[0].ContentLength];
                fileUpload1.PostedFiles[0].InputStream.Seek(0L, System.IO.SeekOrigin.Begin);
                fileUpload1.PostedFiles[0].InputStream.Read(imageBytes, 0, fileUpload1.PostedFiles[0].ContentLength);
                Session["image"] = imageBytes;
            }
            else
            {
                result.Controls.Clear();
            }
        }
        else
        {
            // if used as Image's SRC
            if(!String.IsNullOrEmpty(Page.Request.QueryString["getimage"]))
            {
                if (Session["image"] != null)
                {
                    Page.Response.ContentType = "image/gif";
                    Page.Response.BinaryWrite((byte[])Session["image"]);
                    Page.Response.End();
                }
            }
        }
    }
}