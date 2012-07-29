using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Interface;
using Obout.Grid;
using System.Data;


public partial class Grid_aspnet_commands_client_side_changes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
        Grid1.DataSource = ds.Tables[0];
        Grid1.DataBind();
    }
}