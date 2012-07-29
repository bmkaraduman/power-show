using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class SuperForm_aspnet_master_detail_listbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void ComboBox1_SelectedIndexChanged(object sender, ListBoxItemEventArgs e)
    {
        SqlDataSource2.SelectParameters[0].DefaultValue = e.Item.Value;
        SuperForm1.DefaultMode = DetailsViewMode.Edit;
        SuperForm1.DataBind();
    }

    protected void SuperForm1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            SqlDataSource2.SelectParameters[0].DefaultValue = "0";
            SuperForm1.DataBind();
        }
    }

    protected void SuperForm1_ItemUpdated(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters[0].DefaultValue = "0";
        SuperForm1.DataBind();
    }
}
