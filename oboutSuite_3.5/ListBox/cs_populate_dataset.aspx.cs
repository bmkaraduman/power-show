using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_populate_dataset : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
       
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(225);
        ListBox1.Height = Unit.Pixel(200);
        ListBox1.DataTextField = "ShipName";
        ListBox1.DataValueField = "OrderID";

        ListBox1Container.Controls.Add(ListBox1);

        if (!Page.IsPostBack)
        {
            ListBox1.DataSource = OrdersData.GetOrders();
            ListBox1.DataBind();
        }
    }
}
