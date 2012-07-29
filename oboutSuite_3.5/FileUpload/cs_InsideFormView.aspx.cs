using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.FileUpload;

public partial class FileUpload_cs_InsideFormView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            label.Text = "";
        }
    }

    protected void myItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        System.Web.UI.WebControls.FormView formView = sender as System.Web.UI.WebControls.FormView;
        Obout.Ajax.UI.FileUpload.FileUpload fileUpload = formView.FindControl("fileUpload1") as Obout.Ajax.UI.FileUpload.FileUpload;
        if (fileUpload != null)
        {
            if (fileUpload.PostedFiles.Count > 0)
            {
                string result = "";
                foreach (PostedFileInfo info in fileUpload.PostedFiles)
                {
                    // Here you can place the code to save uploaded files
                    //

                    if (result.Length == 0)
                    {
                        result = "<b>Uploaded files:</b><br><br>";
                        result += "<table border='0' cellspacing='2' cellpadding='2'>";
                        result += "<tr><td style='font-weight: bold; text-align:left;'>File name</td><td style='font-weight: bold; text-align:left;'>Length</td><td style='font-weight: bold; text-align:left;'>Content type</td></tr>";
                    }
                    result += "<tr><td style='text-align:left;'>" + info.FileName + "</td><td style='text-align:left;'>" + info.ContentLength.ToString() + "</td><td style='text-align:left;'>" + info.ContentType + "</td></tr>";
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
}