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

    protected void Postback(object sender, EventArgs e)
    {
        string details = "<br /><br />";
        bool hasSelectedItems = false;

        foreach (ComboBoxItem item in ComboBox1.Items)
        {
            if (item.Selected)
            {
                if (!hasSelectedItems)
                {
                    details += "<br /><b>Selected items:</b>";
                    hasSelectedItems = true;
                }

                details += "<br />" + item.Text; 
            }
        }

        Details.Text = details;
    }
}
