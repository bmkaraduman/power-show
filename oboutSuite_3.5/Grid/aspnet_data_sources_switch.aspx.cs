using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_data_sources_switch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoadOrders(object sender, EventArgs e)
    {
        Grid1.ClearPreviousDataSource();
        Grid1.DataSourceID = "SqlDataSource1";
    }

    protected void LoadCustomers(object sender, EventArgs e)
    {
        Grid1.ClearPreviousDataSource();
        Grid1.DataSourceID = "SqlDataSource2";
    }
}