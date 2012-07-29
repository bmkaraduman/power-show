using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.FileUpload;

public partial class FileUpload_cs_SeparatedUploads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            label.Text = "Nothing uploaded";
        }
    }
    protected void submit1_click(object sender, EventArgs e)
    {
        if (fileUpload1.PostedFiles.Count > 0)
        {
            label.Text = fileUpload1.PostedFiles.Count.ToString() + " images uploaded to 'My photos'";
        }
    }
    protected void submit2_click(object sender, EventArgs e)
    {
        if (fileUpload2.PostedFiles.Count > 0)
        {
            label.Text = fileUpload2.PostedFiles.Count.ToString() + " images uploaded to 'Photos of my children'";
        }
    }
}