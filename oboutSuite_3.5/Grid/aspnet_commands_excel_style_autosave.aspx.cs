using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;

public partial class Grid_aspnet_commands_excel_style_autosave : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateGrid();
    }

    protected void PopulateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb");

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);

        myConn.Open();
        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Orders");

        grid1.DataSource = ds;
        grid1.DataBind();

        myConn.Close();
    }

    [WebMethod]
    public static void UpdateOrder(Order order)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;");

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET OrderDate=@OrderDate, ShipName=@ShipName, ShipCity=@ShipCity, ShipPostalCode=@ShipPostalCode, ShipRegion=@ShipRegion, Sent=@Sent WHERE OrderID=@OrderID", myConn);
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = order.OrderDate;
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = order.ShipName;
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = order.ShipCity;
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = order.ShipPostalCode;
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = order.ShipRegion;
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = order.Sent;
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = order.OrderID;

        myConn.Open();
        myComm.ExecuteNonQuery();
        myConn.Close();
    }
}
