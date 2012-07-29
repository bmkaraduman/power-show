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

        details += "<b>SelectedIndex</b>: " + ComboBox1.SelectedIndex.ToString();
        details += "<br />";
        details += "<b>SelectedValue</b>: " + ComboBox1.SelectedValue;
        details += "<br />";
        details += "<b>SelectedText</b>: " + ComboBox1.SelectedText;

        

        foreach (ComboBoxItem item in ComboBox1.Items)
        {
            if (item.Selected)
            {
                details += "<br /><b>Selected item found through looping:</b> ";
                details += item.Text; 
            }
        }

        Details.Text = details;
    }
}
