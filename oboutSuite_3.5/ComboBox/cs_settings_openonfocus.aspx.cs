using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_settings_openonfocus : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(250);
        ComboBox1.Height = Unit.Pixel(200);
        ComboBox1.EmptyText = "Select a customer ...";
        ComboBox1.OpenOnFocus = true;
        ComboBox1.DataSourceID = "sds1"; 
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1Container.Controls.Add(ComboBox1);
       
    }

    protected void OboutCheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        ComboBox1.OpenOnFocus = OboutCheckBox1.Checked;
    }
}
