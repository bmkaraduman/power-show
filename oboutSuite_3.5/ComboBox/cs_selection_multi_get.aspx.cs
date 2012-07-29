using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_selection_multi_get : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(300);
        ComboBox1.Height = Unit.Pixel(200);
        ComboBox1.SelectionMode = ListSelectionMode.Multiple;
        ComboBox1.AllowEdit = false;
        ComboBox1.DataSourceID = "sds1"; 
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1Container.Controls.Add(ComboBox1);
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
