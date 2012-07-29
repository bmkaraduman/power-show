using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using Obout.ListBox;
using System.Text;

public partial class ListBox_cs_icons_columns : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(430);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "ControlName";
        ListBox1.DataValueField = "ControlID";

        ListBox1.ItemDataBound += ListBox1_ItemDataBound;

        ListBox1Container.Controls.Add(ListBox1);
    }

    protected void ListBox1_ItemDataBound(object sender, ListBoxItemEventArgs e)
    {
        e.Item.ImageUrl = "resources/images/products/" + DataBinder.Eval(e.Item.DataItem, "ImageName");
    }
}