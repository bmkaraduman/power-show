using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_settings_width : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    private Obout.ListBox.ListBox ListBox2;
    private Obout.ListBox.ListBox ListBox3;
    private Obout.ListBox.ListBox ListBox4;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CountryName";
        ListBox1.DataValueField = "CountryID";

        ListBox1Container.Controls.Add(ListBox1);

        ListBox2 = new Obout.ListBox.ListBox();
        ListBox2.ID = "ListBox2";
        ListBox2.Width = Unit.Pixel(250);
        ListBox2.Height = Unit.Pixel(150);
        ListBox2.DataSourceID = "sds1";
        ListBox2.DataTextField = "CountryName";
        ListBox2.DataValueField = "CountryID";

        ListBox2Container.Controls.Add(ListBox2);

        ListBox3 = new Obout.ListBox.ListBox();
        ListBox3.ID = "ListBox3";
        ListBox3.Width = Unit.Percentage(25);
        ListBox3.Height = Unit.Pixel(150);
        ListBox3.DataSourceID = "sds1";
        ListBox3.DataTextField = "CountryName";
        ListBox3.DataValueField = "CountryID";

        ListBox3Container.Controls.Add(ListBox3);

        ListBox4 = new Obout.ListBox.ListBox();
        ListBox4.ID = "ListBox4";
        ListBox4.Width = Unit.Percentage(50);
        ListBox4.Height = Unit.Pixel(150);
        ListBox4.DataSourceID = "sds1";
        ListBox4.DataTextField = "CountryName";
        ListBox4.DataValueField = "CountryID";

        ListBox4Container.Controls.Add(ListBox4);
       
    }
}
