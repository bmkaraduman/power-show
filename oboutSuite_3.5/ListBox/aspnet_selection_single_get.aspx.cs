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

    protected void Postback(object sender, EventArgs e)
    {
        string details = "<br /><br />";

        details += "<b>SelectedIndex</b>: " + ListBox1.SelectedIndex.ToString();
        details += "<br />";
        details += "<b>SelectedValue</b>: " + ListBox1.SelectedValue;
        details += "<br />";
        details += "<b>SelectedText</b>: " + ListBox1.SelectedText;

        

        foreach (ListBoxItem item in ListBox1.Items)
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
