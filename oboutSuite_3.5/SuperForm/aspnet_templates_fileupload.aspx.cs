using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;

public partial class SuperForm_aspnet_templates_fileupload : System.Web.UI.Page
{
    private string fileName = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        fileName = "";
        
        if (Page.IsPostBack)
        {
            HttpFileCollection files = Page.Request.Files;

            if (files.Count > 0)
            {
                fileName = DateTime.Now.Ticks.ToString() + "_" + files[0].FileName;

                files[0].SaveAs(Server.MapPath("~/Grid/resources/images/products/" + fileName));
            }
        }
    }

    protected void SuperForm1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues["Image"] = fileName;
    }

    protected void SuperForm1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["Image"] = fileName;
    }
}
