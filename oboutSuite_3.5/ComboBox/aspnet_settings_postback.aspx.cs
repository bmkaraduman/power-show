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

    protected void ComboBox1_SelectedIndexChanged(object sender, ComboBoxItemEventArgs e)
    {
        Details.Text = "<br /><br /><br /><b>" + e.Item.Text + "</b> has been selected.<br />";
    }
}
