using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Collections;

public partial class SuperForm_aspnet_fields_autogenerate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Grid1_Select(object sender, GridRecordEventArgs e)
    {
        Hashtable selectedRecord = e.RecordsCollection[0] as Hashtable;
        SqlDataSource2.SelectParameters[0].DefaultValue = selectedRecord["OrderID"].ToString();
        SuperForm1.DefaultMode = DetailsViewMode.Edit;
        SuperForm1.DataBind();
    }

    protected void SuperForm1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            SqlDataSource2.SelectParameters[0].DefaultValue = "0";
            SuperForm1.DefaultMode = DetailsViewMode.Edit;
            SuperForm1.DataBind();
        }
    }

    protected void SuperForm1_ItemUpdated(object sender, EventArgs e)
    {
        Grid1.DataBind();
        SqlDataSource2.SelectParameters[0].DefaultValue = "0";
        SuperForm1.DefaultMode = DetailsViewMode.Edit;
        SuperForm1.DataBind();
    }
}
