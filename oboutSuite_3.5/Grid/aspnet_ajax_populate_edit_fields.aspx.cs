using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Interface;


public partial class Grid_aspnet_ajax_populate_edit_fields : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        OboutInc.Calendar2.Calendar orderDateCalendar = grid1.Templates[0].Container.FindControl("gridCal1") as OboutInc.Calendar2.Calendar;
        OboutInc.Calendar2.Calendar requiredDateCalendar = grid1.Templates[0].Container.FindControl("gridCal2") as OboutInc.Calendar2.Calendar;
        OboutInc.Calendar2.Calendar shippedDateCalendar = grid1.Templates[0].Container.FindControl("gridCal3") as OboutInc.Calendar2.Calendar;

        OboutTextBox txtOrderDate = grid1.Templates[0].Container.FindControl("txtOrderDate") as OboutTextBox;
        OboutTextBox txtRequiredDate = grid1.Templates[0].Container.FindControl("txtRequiredDate") as OboutTextBox;
        OboutTextBox txtShippedDate = grid1.Templates[0].Container.FindControl("txtShippedDate") as OboutTextBox;

        orderDateCalendar.TextBoxId = txtOrderDate.ClientID;
        requiredDateCalendar.TextBoxId = txtRequiredDate.ClientID;
        shippedDateCalendar.TextBoxId = txtShippedDate.ClientID;
    }

    [WebMethod]
    public static OrderData GetData(int orderId)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;");

        OleDbCommand myComm = new OleDbCommand("SELECT ShipAddress, ShipRegion, ShipCountry, OrderDate, RequiredDate, ShippedDate, ShipVia, Sent FROM Orders WHERE OrderID = @OrderID", myConn);
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = orderId;

        myConn.Open();

        OleDbDataReader myReader = myComm.ExecuteReader();
        myReader.Read();

        OrderData order = new OrderData();

        order.OrderID = orderId;
        order.ShipAddress = myReader.GetString(0);
        order.ShipRegion = !myReader.IsDBNull(1) ? myReader.GetString(1) : "";
        order.ShipCountry = !myReader.IsDBNull(2) ? myReader.GetString(2) : "";
        order.OrderDate = myReader.GetDateTime(3).ToString("MM/dd/yyyy");
        order.RequiredDate = myReader.GetDateTime(4).ToString("MM/dd/yyyy");
        order.ShippedDate = myReader.GetDateTime(5).ToString("MM/dd/yyyy");
        order.ShipVia = myReader.GetInt32(6);
        order.Sent = myReader.GetBoolean(7);

        myReader.Close();
        myConn.Close();

        return order;
    }

    [WebMethod]
    public static void UpdateOrder(OrderData order)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;");
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia, Sent = @Sent  WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = order.ShipName; 
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = order.ShipAddress; 
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = order.ShipCity;
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = order.ShipRegion;
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = order.ShipPostalCode;
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = order.ShipCountry;
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = order.OrderDate;
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = order.RequiredDate;
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = order.ShippedDate;
        myComm.Parameters.Add("@ShipVia", OleDbType.Integer).Value = order.ShipVia;
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = order.Sent;
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = order.OrderID;

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    [WebMethod]
    public static void InsertRecord(OrderData order)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;");
        myConn.Open();
        
        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, OrderDate, RequiredDate, ShippedDate, ShipVia, Sent) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Sent)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = order.ShipName;
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = order.ShipAddress;
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = order.ShipCity;
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = order.ShipRegion;
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = order.ShipPostalCode;
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = order.ShipCountry; 
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = order.OrderDate;
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = order.RequiredDate;
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = order.ShippedDate;
        myComm.Parameters.Add("@ShipVia", OleDbType.Integer).Value = order.ShipVia;
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = order.Sent;

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    [WebMethod]
    public static void DeleteOrder(int orderId)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;");
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = orderId;

        myComm.ExecuteNonQuery();
        myConn.Close();

    }


}