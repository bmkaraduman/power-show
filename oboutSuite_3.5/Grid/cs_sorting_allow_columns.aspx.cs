using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_sorting_allow_columns : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.AllowSorting = true;
        grid1.CallbackMode = true;
        grid1.Serialize = true;


        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "ShipCountry";
        oCol1.HeaderText = "COUNTRY";
        oCol1.Width = "150";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipCity";
        oCol2.HeaderText = "CITY";
        oCol2.Width = "150";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipName";
        oCol3.HeaderText = "NAME";
        oCol3.Width = "200";

        Column oCol4 = new Column();
        oCol4.DataField = "OrderID";
        oCol4.HeaderText = "ORDER ID";
        oCol4.Width = "150";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);


        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        grid1.Columns[0].AllowSorting = chkAllowSortingShipCountry.Checked;
        grid1.Columns[1].AllowSorting = chkAllowSortingShipCity.Checked;
        grid1.Columns[2].AllowSorting = chkAllowSortingShipName.Checked;
        grid1.Columns[3].AllowSorting = cbkAllowSortingOrderID.Checked;     
    }
}