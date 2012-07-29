using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_selection_single_get : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(300);
        ComboBox1.Height = Unit.Pixel(200);
        ComboBox1.DataSourceID = "sds1"; 
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1Container.Controls.Add(ComboBox1);
       
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
