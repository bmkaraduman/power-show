using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_settings_height : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    private Obout.ListBox.ListBox ListBox2;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(150);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CountryName";
        ListBox1.DataValueField = "CountryID";

        ListBox1Container.Controls.Add(ListBox1);

        ListBox2 = new Obout.ListBox.ListBox();
        ListBox2.ID = "ListBox2";
        ListBox2.Width = Unit.Pixel(150);
        ListBox2.Height = Unit.Pixel(150);
        ListBox2.DataSourceID = "sds1";
        ListBox2.DataTextField = "CountryName";
        ListBox2.DataValueField = "CountryID";

        ListBox2Container.Controls.Add(ListBox2);
    }
}
