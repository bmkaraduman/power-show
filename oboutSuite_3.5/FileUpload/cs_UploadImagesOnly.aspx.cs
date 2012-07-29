using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.FileUpload;

public partial class FileUpload_cs_UploadImagesOnly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            string result = "";
            foreach (PostedFileInfo info in fileUpload1.PostedFiles)
            {
                if (result.Length == 0)
                {
                    result = "<b>Uploaded files:</b><br><br>";
                    result += "<table align='center' border='0' cellspacing='2' cellpadding='2'>";
                    result += "<tr><td style='font-weight: bold; text-align:left;'>File name</td><td style='font-weight: bold; text-align:left;'>Length</td><td style='font-weight: bold; text-align:left;'>Content type</td></tr>";
                }
                result += "<tr><td style='text-align:left;'>" + info.FileName + "</td><td style='text-align:left;'>" + info.ContentLength + "</td><td style='text-align:left;'>" + info.ContentType + "</td></tr>";
            }
            if (result.Length == 0)
            {
                result = "No files uploaded";
            }
            else
            {
                result += "</table>";
            }
            label.Text = result;
        }
    }
}