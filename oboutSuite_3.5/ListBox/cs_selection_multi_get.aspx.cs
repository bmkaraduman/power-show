using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_selection_multi_get : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(300);
        ListBox1.Height = Unit.Pixel(200);
        ListBox1.SelectionMode = ListSelectionMode.Multiple;
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "CustomerID";

        ListBox1Container.Controls.Add(ListBox1);
    }

    protected void Postback(object sender, EventArgs e)
    {
        string details = "<br /><br />";
        bool hasSelectedItems = false;

        foreach (ListBoxItem item in ListBox1.Items)
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
