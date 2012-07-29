using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_aspnet_selection_retrieve : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void ComboBox3_ItemDataBound(object sender, ComboBoxItemEventArgs e)
    {
        if (e.Item.Value == "AROUT" || e.Item.Value == "BLONP" || e.Item.Value == "BOLID")
        {
            e.Item.Selected = true;
        }
    }
}
