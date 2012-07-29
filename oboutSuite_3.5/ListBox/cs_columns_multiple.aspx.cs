using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;
using System.Data;
using System.Data.OleDb;

public partial class ListBox_cs_columns_multiple : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    private Obout.ListBox.ListBox ListBox2;
    private Obout.ListBox.ListBox ListBox3;

    protected void Page_Load(object sender, EventArgs e)
    {

        ListBox1 = new Obout.ListBox.ListBox(); 
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(345);
        ListBox1.Height = Unit.Pixel(265);
        ListBox1.FolderStyle = "styles/premiere_blue";
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CountryName";
        ListBox1.DataValueField = "CountryID";

        ListBox1Container.Controls.Add(ListBox1);

        ListBox2 = new Obout.ListBox.ListBox();
        ListBox2.ID = "ListBox2";
        ListBox2.Width = Unit.Pixel(475);
        ListBox2.FolderStyle = "styles/premiere_blue";
        ListBox2.DataSourceID = "sds1";
        ListBox2.DataTextField = "CountryName";
        ListBox2.DataValueField = "CountryID";

        ListBox2Container.Controls.Add(ListBox2);

        ListBox3 = new Obout.ListBox.ListBox();
        ListBox3.ID = "ListBox3";
        ListBox3.Width = Unit.Pixel(650);
        ListBox3.FolderStyle = "styles/premiere_blue";
        ListBox3.DataSourceID = "sds1";
        ListBox3.DataTextField = "CountryName";
        ListBox3.DataValueField = "CountryID";

        ListBox3Container.Controls.Add(ListBox3);
    }

}
