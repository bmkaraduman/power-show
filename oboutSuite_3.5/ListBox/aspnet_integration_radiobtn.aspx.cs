using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using Obout.ListBox;
using System.Text;

public partial class ListBox_aspnet_integration_checkboxes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Order(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ListBox1.SelectedText))
        {
            OrderDetails.Text = "<br /><br /><br /><b>The following control has been ordered:</b> " + ListBox1.SelectedText + "<br />";
        }
    }
}