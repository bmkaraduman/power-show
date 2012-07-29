using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_populate_collections : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {  
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(250);
        ComboBox1.Height = Unit.Pixel(200);
        ComboBox1.DataTextField = "ShipName";
        ComboBox1.DataValueField = "OrderID";

        ComboBox1Container.Controls.Add(ComboBox1);

        if (!Page.IsPostBack)
        {
            ComboBox1.DataSource = OrdersGenericData.GetGenericOrders();
            ComboBox1.DataBind();
        }
    }

}
