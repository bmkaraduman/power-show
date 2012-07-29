using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_commands_client_side_changes : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    public void Page_Load(object sender, EventArgs e)
    {              
        grid1.ID = "Grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = false;
        grid1.PageSize = 25;
        grid1.AllowPaging = false;
        grid1.AllowPageSizeSelection = false;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.AllowMultiRecordSelection = false;
        grid1.AllowGrouping = true;
        grid1.GroupBy = "CategoryID";
        grid1.ShowGroupsInfo = false;
        grid1.ShowMultiPageGroupsInfo = false;
        grid1.DataSourceNeeded += Grid1_DataSourceNeeded;
        grid1.ClientSideEvents.ExposeSender = true;
        grid1.ClientSideEvents.OnClientSelect = "Grid1_ClientSelect";

        grid1.ScrollingSettings.ScrollHeight = 250;
        grid1.ScrollingSettings.EnableVirtualScrolling = true;
        grid1.GroupingSettings.AllowChanges = false;

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "ProductID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;

        Column oCol2 = new Column();
        oCol2.DataField = "CategoryID";
        oCol2.Visible = false;
        oCol2.ReadOnly = true;

        Column oCol3 = new Column();
        oCol3.DataField = "ProductName";
        oCol3.HeaderText = "PRODUCT NAME";
        oCol3.Width = "200";

        Column oCol4 = new Column();
        oCol4.DataField = "UnitPrice";
        oCol4.HeaderText = "PRICE";
        oCol4.Width = "200";
        
             
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

    }
    [WebMethod]
    public static void SaveProduct(Dictionary<string, string> data)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;");
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Products SET ProductName = @ProductName, UnitPrice=@UnitPrice WHERE ProductID = @ProductID", myConn);

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = data["ProductName"];
        myComm.Parameters.Add("@UnitPrice", OleDbType.Double).Value = data["UnitPrice"];
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = data["ProductID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    [WebMethod]
    public static void DeleteProduct(Dictionary<string, string> data)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;");
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE * FROM [Order Details] WHERE ProductID = @ProductID", myConn);
        OleDbCommand myComm2 = new OleDbCommand("DELETE * FROM Products WHERE ProductID = @ProductID", myConn);

        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = data["ProductID"];
        myComm2.Parameters.Add("@ProductID", OleDbType.Integer).Value = data["ProductID"];

        myComm.ExecuteNonQuery();
        myComm2.ExecuteNonQuery();
        myConn.Close();
    }

    [WebMethod]
    public static string InsertProduct(Dictionary<string, string> data)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;");
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Products(ProductName, UnitPrice, CategoryID) VALUES(@ProductName, @UnitPrice, @CategoryID);", myConn);

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = data["ProductName"];
        myComm.Parameters.Add("@UnitPrice", OleDbType.Double).Value = data["UnitPrice"];
        myComm.Parameters.Add("@CategoryID", OleDbType.Integer).Value = data["CategoryID"];

        myComm.ExecuteNonQuery();

        OleDbCommand myComm2 = new OleDbCommand("SELECT @@IDENTITY", myConn);
        object newId = myComm2.ExecuteScalar();

        myConn.Close();

        return newId.ToString();
    }

    protected void Grid1_DataSourceNeeded(object sender, GridDataSourceNeededEventArgs e)
    {
        // Preparing the SQL query for populating the Grid
        string sortExpression = "";

        if (string.IsNullOrEmpty(e.SortExpression))
        {
            sortExpression = " ORDER BY ProductID DESC";
        }
        else
        {
            sortExpression = " ORDER BY " + e.SortExpression;
        }

        string query = "SELECT TOP " + e.MaximumRows.ToString() + " * FROM (SELECT ProductID, CategoryID, ProductName, UnitPrice FROM Products";
        if (e.StartRowIndex != 0)
        {
            query += " WHERE ProductID NOT IN (SELECT TOP " + e.StartRowIndex.ToString() + " ProductID FROM Products" + sortExpression + ")";
        }
        query += sortExpression;
        query += ")";

        // Extracting the rows
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        OleDbCommand myComm = new OleDbCommand(query, myConn);
        myConn.Open();
        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Products");

        // Retrieving the total count of rows
        OleDbConnection myConn2 = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath("../App_Data/Northwind.mdb"));
        OleDbCommand myComm2 = new OleDbCommand("SELECT COUNT(*) FROM Products", myConn2);
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