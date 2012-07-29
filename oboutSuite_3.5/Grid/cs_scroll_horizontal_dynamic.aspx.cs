using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_cs_scroll_horizontal_dynamic : System.Web.UI.Page
{
    Grid grid1 = new Grid();

   protected void Page_Load(object sender, EventArgs e)
    {

        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = true;
        grid1.AllowAddingRecords = false;
        grid1.ScrollingSettings.ScrollWidth = 625;
        grid1.AllowPageSizeSelection = false;

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
    }
   protected void LoadSuppliers(object sender, EventArgs e)
   {
       grid1.ClearPreviousDataSource();
       grid1.DataSourceID = "SqlDataSource1";
   }

   protected void LoadProducts(object sender, EventArgs e)
   {
       grid1.ClearPreviousDataSource();
       grid1.DataSourceID = "SqlDataSource2";
   }

   protected void LoadOrders(object sender, EventArgs e)
   {
       grid1.ClearPreviousDataSource();
       grid1.DataSourceID = "SqlDataSource3";
   }

   protected void LoadCustomers(object sender, EventArgs e)
   {
       grid1.ClearPreviousDataSource();
       grid1.DataSourceID = "SqlDataSource4";
   }
}