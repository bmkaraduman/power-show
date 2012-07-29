using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_data_sources_button : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.HeaderText = "ORDER ID";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "SHIP NAME";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "SHIP CITY";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Visible = false;

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

    public void Populate_Grid(object sender, EventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();
        OleDbCommand myComm = new OleDbCommand("SELECT * FROM Orders WHERE CustomerID=@CustomerID ORDER BY OrderID DESC", myConn);
        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = CustomerId.SelectedValue;

        myComm.ExecuteNonQuery();
        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Orders");
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.ClearPreviousDataSource();
        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }
}