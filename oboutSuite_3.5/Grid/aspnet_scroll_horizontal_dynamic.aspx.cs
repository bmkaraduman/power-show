using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;


public partial class Grid_aspnet_scroll_horizontal_dynamic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoadSuppliers(object sender, EventArgs e)
    {
        Grid1.ClearPreviousDataSource();
        Grid1.DataSourceID = "SqlDataSource1";
    }

    protected void LoadProducts(object sender, EventArgs e)
    {
        Grid1.ClearPreviousDataSource();
        Grid1.DataSourceID = "SqlDataSource2";
    }

    protected void LoadOrders(object sender, EventArgs e)
    {
        Grid1.ClearPreviousDataSource();
        Grid1.DataSourceID = "SqlDataSource3";
    }

    protected void LoadCustomers(object sender, EventArgs e)
    {
        Grid1.ClearPreviousDataSource();
        Grid1.DataSourceID = "SqlDataSource4";
    }
}