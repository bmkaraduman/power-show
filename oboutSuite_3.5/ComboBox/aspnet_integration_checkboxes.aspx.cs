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
        StringBuilder orderedItems = new StringBuilder();

        foreach (ComboBoxItem item in ComboBox1.Items)
        {
            CheckBox checkbox = item.FindControl("CheckBox1") as CheckBox;
            if (checkbox.Checked)
            {
                if (orderedItems.Length > 0)
                {
                    orderedItems.Append(", ");
                }
                orderedItems.Append(item.Text);
            }
        }

        if (orderedItems.Length > 0)
        {
            OrderDetails.Text = "<br /><br /><br /><b>The following controls have been ordered:</b> " + orderedItems.ToString() + "<br />";
        }
        else
        {
            OrderDetails.Text = "";
        }
    }
}