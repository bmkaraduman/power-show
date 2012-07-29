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

    protected void ListBox1_Enable(object sender, EventArgs e)
    {
        ListBox1.Enabled = true;
    }

    protected void ListBox1_Disable(object sender, EventArgs e)
    {
        ListBox1.Enabled = false;
    }
}
