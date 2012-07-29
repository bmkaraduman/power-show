using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_selection_single_get : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(300);
        ListBox1.Height = Unit.Pixel(200);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "CustomerID";

        ListBox1Container.Controls.Add(ListBox1);
       
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
