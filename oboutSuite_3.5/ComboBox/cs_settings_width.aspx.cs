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
    private ComboBox ComboBox4;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.EmptyText = "Select a country ...";
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "CountryName";
        ComboBox1.DataValueField = "CountryID";

        ComboBox1Container.Controls.Add(ComboBox1);

        ComboBox2 = new ComboBox();
        ComboBox2.ID = "ComboBox2";
        ComboBox2.Width = Unit.Pixel(250);
        ComboBox2.EmptyText = "Select a country ...";
        ComboBox2.DataSourceID = "sds1";
        ComboBox2.DataTextField = "CountryName";
        ComboBox2.DataValueField = "CountryID";

        ComboBox2Container.Controls.Add(ComboBox2);

        ComboBox3 = new ComboBox();
        ComboBox3.ID = "ComboBox3";
        ComboBox3.Width = Unit.Percentage(25);
        ComboBox3.EmptyText = "Select a country ...";
        ComboBox3.DataSourceID = "sds1";
        ComboBox3.DataTextField = "CountryName";
        ComboBox3.DataValueField = "CountryID";

        ComboBox3Container.Controls.Add(ComboBox3);

        ComboBox4 = new ComboBox();
        ComboBox4.ID = "ComboBox4";
        ComboBox4.Width = Unit.Percentage(50);
        ComboBox4.EmptyText = "Select a country ...";
        ComboBox4.DataSourceID = "sds1";
        ComboBox4.DataTextField = "CountryName";
        ComboBox4.DataValueField = "CountryID";

        ComboBox4Container.Controls.Add(ComboBox4);
    }
}
