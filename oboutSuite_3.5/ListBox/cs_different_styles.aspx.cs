using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_different_styles : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    private Obout.ListBox.ListBox ListBox2;
    private Obout.ListBox.ListBox ListBox3;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(250);
        ListBox1.Height = Unit.Pixel(200);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "CustomerID";
        ListBox1.FolderStyle = "styles/black_glass";

        ListBoxContainer1.Controls.Add(ListBox1);

        ListBox2 = new Obout.ListBox.ListBox();
        ListBox2.ID = "ListBox2";
        ListBox2.Width = Unit.Pixel(250);
        ListBox2.Height = Unit.Pixel(208);
        ListBox2.DataSourceID = "sds1";
        ListBox2.DataTextField = "CompanyName";
        ListBox2.DataValueField = "CustomerID";
        ListBox2.FolderStyle = "_";

        ListBoxContainer2.Controls.Add(ListBox2);

        ListBox3 = new Obout.ListBox.ListBox();
        ListBox3.ID = "ListBox3";
        ListBox3.Width = Unit.Pixel(250);
        ListBox3.Height = Unit.Pixel(208);
        ListBox3.DataSourceID = "sds1";
        ListBox3.DataTextField = "CompanyName";
        ListBox3.DataValueField = "CustomerID";
        ListBox3.FolderStyle = "_";

        ListBoxContainer3.Controls.Add(ListBox3);
    }
}
