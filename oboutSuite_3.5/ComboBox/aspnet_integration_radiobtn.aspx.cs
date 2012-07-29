using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using Obout.ComboBox;
using System.Text;

public partial class ComboBox_aspnet_integration_checkboxes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Order(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ComboBox1.SelectedText))
        {
            OrderDetails.Text = "<br /><br /><br /><b>The following control has been ordered:</b> " + ComboBox1.SelectedText + "<br />";
        }
    }
}