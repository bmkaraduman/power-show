using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_selection_multi : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(150);
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "CountryName";
        ComboBox1.DataValueField = "CountryID";
        ComboBox1.SelectedIndex = 2;

        ComboBox1Container.Controls.Add(ComboBox1);    
    }
}
