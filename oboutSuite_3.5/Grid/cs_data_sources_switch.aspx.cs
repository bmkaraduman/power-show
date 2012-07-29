using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_columns_reordering : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = true;
        grid1.AllowAddingRecords = false;

        
        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
    }

    protected void LoadOrders(object sender, EventArgs e)
    {
        grid1.ClearPreviousDataSource();
        grid1.DataSourceID = "SqlDataSource1";
    }

    protected void LoadCustomers(object sender, EventArgs e)
    {
        grid1.ClearPreviousDataSource();
        grid1.DataSourceID = "SqlDataSource2";
    }
}