using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_customization_align : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    private Obout.ListBox.ListBox ListBox2;
    private Obout.ListBox.ListBox ListBox3;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(200);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "CustomerID";

        ListBox1Container.Controls.Add(ListBox1);

        ListBox2 = new Obout.ListBox.ListBox();
        ListBox2.ID = "ListBox2";
        ListBox2.Width = Unit.Pixel(200);
        ListBox2.DataSourceID = "sds1";
        ListBox2.DataTextField = "CompanyName";
        ListBox2.DataValueField = "CustomerID";
        ListBox2.CssSettings.ItemsContainer = "ob_iLboIC center";

        ListBox2Container.Controls.Add(ListBox2);

        ListBox3 = new Obout.ListBox.ListBox();
        ListBox3.ID = "ListBox3";
        ListBox3.Width = Unit.Pixel(200);
        ListBox3.DataSourceID = "sds1";
        ListBox3.DataTextField = "CompanyName";
        ListBox3.DataValueField = "CustomerID";
        ListBox3.CssSettings.ItemsContainer = "ob_iLboIC right";

        ListBox3Container.Controls.Add(ListBox3);
    }
}
