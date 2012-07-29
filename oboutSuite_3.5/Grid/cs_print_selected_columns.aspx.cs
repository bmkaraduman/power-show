using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_print_selected_columns : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "sds1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowPageSizeSelection = false;
        grid1.AllowAddingRecords = false;
       
        // creating the columns
        Column oCol0 = new Column();
        oCol0.DataField = "ORDER ID";
        oCol0.DataField = "OrderID";
        oCol0.Width = "150";

        Column oCol1 = new Column();
        oCol1.DataField = "ShipName";
        oCol1.HeaderText = "NAME";
        oCol1.Width = "200";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipCity";
        oCol2.HeaderText = "CITY";
        oCol2.Width = "150";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipRegion";
        oCol3.HeaderText = "REGION";
        oCol3.Width = "150";
          
        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "150";
        
        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "150";

      
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol0);
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
       

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

    }

}