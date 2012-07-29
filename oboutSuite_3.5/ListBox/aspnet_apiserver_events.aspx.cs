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

    protected void ListBox1_SelectedIndexChanged(object sender, ListBoxItemEventArgs  e)
    {
        EventLogger.Text = "<br /><br /><b>The selection has been changed to:</b> " + e.Item.Text;
    }
}
