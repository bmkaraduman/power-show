using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_scroll_virtual_paging : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.Serialize = false;
        grid1.DataSourceNeeded += Grid1_DataSourceNeeded;
        grid1.AllowPageSizeSelection = false;
        grid1.PageSize = 10;
        grid1.ScrollingSettings.ScrollHeight = 250;
        grid1.ScrollingSettings.EnableVirtualScrolling = true;
        grid1.ScrollingSettings.UsePagingForVirtualScrolling = true;


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

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "SHIP COUNTRY";


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

    }
    protected void Grid1_DataSourceNeeded(object sender, GridDataSourceNeededEventArgs e)
    {
        // Preparing the SQL query for populating the Grid
        string sortExpression = "";

        if (string.IsNullOrEmpty(e.SortExpression))
        {
            sortExpression = " ORDER BY OrderID DESC";
        }
        else
        {
            sortExpression = " ORDER BY " + e.SortExpression;
        }

        string query = "SELECT TOP " + e.MaximumRows.ToString() + " OrderID, ShipName, ShipCity, ShipPostalCode, ShipCountry FROM Orders";
        if (e.StartRowIndex != 0)
        {
            query += " WHERE OrderID NOT IN (SELECT TOP " + e.StartRowIndex.ToString() + " OrderID FROM Orders" + sortExpression + ")";
        }
        query += sortExpression;

        // Extracting the rows
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        OleDbCommand myComm = new OleDbCommand(query, myConn);
        myConn.Open();
        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Orders");

        // Retrieving the total count of rows
        OleDbConnection myConn2 = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath("../App_Data/Northwind.mdb"));
        OleDbCommand myComm2 = new OleDbCommand("SELECT COUNT(*) FROM Orders WHERE OrderID IN (SELECT TOP 800 OrderID FROM Orders)", myConn2);
        myConn2.Open();
        int count = (int)(myComm2.ExecuteScalar());

        myConn2.Close();

        // Passing the total count to the "TotalRowCount" property of the GridDataSourceNeededEventArgs object
        e.TotalRowCount = count;

        // Populating the grid
        grid1.DataSource = ds.Tables[0];
        grid1.DataBind();
    }
}