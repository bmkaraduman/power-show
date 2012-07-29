using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_aspnet_selection_retrieve : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void ListBox3_ItemDataBound(object sender, ListBoxItemEventArgs e)
    {
        if (e.Item.Value == "AROUT" || e.Item.Value == "BLONP" || e.Item.Value == "BOLID")
        {
            e.Item.Selected = true;
        }
    }
}
