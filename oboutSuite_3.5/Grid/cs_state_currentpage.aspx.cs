using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_state_currentpage : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.AutoGenerateColumns = false;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowFiltering = false;
        grid1.AllowPageSizeSelection = false;

        grid1.Rebind += RebindGrid;
        grid1.InsertCommand += InsertRecord;
        grid1.DeleteCommand += DeleteRecord;
        grid1.UpdateCommand += UpdateRecord;

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";
        oCol1.ReadOnly = true;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "200";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "150";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipCountry";
        oCol4.HeaderText = "COUNTRY";
        oCol4.Width = "150";

        Column oCol5 = new Column();
        oCol5.HeaderText = "EDIT";
        oCol5.AllowEdit = true;
        oCol5.AllowDelete = true;
        oCol5.Width = "125";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        
        if (!Page.IsPostBack)
        {
            if (Session["CurrentPageIndex"] != null)
            {
                grid1.CurrentPageIndex = Int32.Parse(Session["CurrentPageIndex"].ToString());
            }

            CreateGrid();
        }
        
    }
    protected override void  OnLoadComplete(EventArgs e)
    {
        base.OnPreRender(e);

        Session["CurrentPageIndex"] = grid1.CurrentPageIndex;
    }

    protected void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        /*OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Orders");*/
        OleDbDataReader myReader = myComm.ExecuteReader();


        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    protected void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    protected void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    protected void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipCountry)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    protected void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }
}