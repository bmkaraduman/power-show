using System;
using System.Collections.Generic;
using Obout.ListBox;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListBox_cs_apiserver_tooltips : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(250);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "CustomerID";
        ListBox1.ItemDataBound += ListBox1_ItemDataBound;

        ListBox1Container.Controls.Add(ListBox1);
    }
    protected void ListBox1_ItemDataBound(object sender, ListBoxItemEventArgs e)
    {
        e.Item.ToolTip = e.Item.Text;
    }
}
