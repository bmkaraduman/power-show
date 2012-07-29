using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_columns_resizing_dynamic : System.Web.UI.Page
{
    Grid grid1 = new Grid();
    Grid grid2 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowPageSizeSelection= false;
        grid1.AllowAddingRecords = false;
       
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "SHIP NAME";
      
        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "SHIP CITY";
        oCol3.Width = "125";
        
        Column oCol4 = new Column();
        oCol4.DataField = "ShipCountry";
        oCol4.HeaderText = "SHIP COUNTRY";
        oCol4.Width = "125";

        Column oCol5 = new Column();
        oCol5.DataField = "OrderDate"; 
        oCol5.HeaderText = "ORDER DATE";
        oCol5.Width = "135";
        oCol5.DataFormatString = "{0:MM/dd/yyyy}";
      
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        grid2.ID = "Grid2";
        grid2.DataSourceID = "SqlDataSource1";
        grid2.AutoGenerateColumns = false;
        grid2.AllowPageSizeSelection= false;
        grid2.AllowAddingRecords = false;

        grid2.ScrollingSettings.ScrollWidth = 560;

        // creating the columns
        Column oCol21 = new Column();
        oCol21.DataField = "OrderID";
        oCol21.Visible = false;

        Column oCol22 = new Column();
        oCol22.DataField = "ShipName";
        oCol22.HeaderText = "SHIP NAME";
      
        Column oCol23 = new Column();
        oCol23.DataField = "ShipCity";
        oCol23.HeaderText = "SHIP CITY";
        oCol23.Width = "125";
        
        Column oCol24 = new Column();
        oCol24.DataField = "ShipCountry";
        oCol24.HeaderText = "SHIP COUNTRY";
        oCol24.Width = "125";

        Column oCol25 = new Column();
        oCol25.DataField = "OrderDate"; 
        oCol25.HeaderText = "ORDER DATE";
        oCol25.Width = "135";
        oCol25.DataFormatString = "{0:MM/dd/yyyy}";

        Column oCol26 = new Column();
        oCol26.DataField = "ShippedDate";
        oCol26.HeaderText = "SHIPPED DATE";
        oCol26.Width = "135";
        oCol26.DataFormatString = "{0:MM/dd/yyyy}";
      
        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol21);
        grid2.Columns.Add(oCol22);
        grid2.Columns.Add(oCol23);
        grid2.Columns.Add(oCol24);
        grid2.Columns.Add(oCol25);
        grid2.Columns.Add(oCol26);

        // add the grid to the controls collection of the PlaceHolder
        phGrid2.Controls.Add(grid2);

    }

}