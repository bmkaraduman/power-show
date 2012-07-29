using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Collections;

public partial class SuperForm_aspnet_master_detail_separate_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataSource2.SelectParameters[0].DefaultValue = Request.QueryString["OrderID"];
        }
    }

    protected void SuperForm1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "grid", "location.href='aspnet_master_detail_separate.aspx';", true);
        }
    }

    protected void SuperForm1_ItemUpdated(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "grid", "location.href='aspnet_master_detail_separate.aspx';", true);
    }
}
