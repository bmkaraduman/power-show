using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_settings_width : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    private ComboBox ComboBox2;
    private ComboBox ComboBox3;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(200);
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1Container.Controls.Add(ComboBox1);

        ComboBox2 = new ComboBox();
        ComboBox2.ID = "ComboBox2";
        ComboBox2.Width = Unit.Pixel(200);
        ComboBox2.DataSourceID = "sds1";
        ComboBox2.DataTextField = "CompanyName";
        ComboBox2.DataValueField = "CustomerID";
        ComboBox2.CssSettings.ItemsContainer = "ob_iCboIC center";

        ComboBox2Container.Controls.Add(ComboBox2);

        ComboBox3 = new ComboBox();
        ComboBox3.ID = "ComboBox3";
        ComboBox3.Width = Unit.Pixel(200);
        ComboBox3.DataSourceID = "sds1";
        ComboBox3.DataTextField = "CompanyName";
        ComboBox3.DataValueField = "CustomerID";
        ComboBox3.CssSettings.ItemsContainer = "ob_iCboIC right";

        ComboBox3Container.Controls.Add(ComboBox3);  
    }
}
