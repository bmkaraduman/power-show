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

public partial class Grid_aspnet_cascading_comboboxes : System.Web.UI.Page
{
    protected void Page_load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }   

    protected void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 *  FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    [WebMethod]
    public static List<string> GetCities(string country)
    {
        List<string> cities = new List<string>();

        if (!string.IsNullOrEmpty(country))
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;");

            OleDbCommand myComm = new OleDbCommand("SELECT DISTINCT ShipCity FROM Orders WHERE ShipCountry = @ShipCountry ORDER BY ShipCity ASC", myConn);
            myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = country;

            myConn.Open();
            OleDbDataReader myReader = myComm.ExecuteReader();
            while (myReader.Read())
            {
                cities.Add(myReader.GetString(0));
            }

            myConn.Close();
        }

        return cities;
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCountry = @ShipCountry, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];   
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    protected void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCountry, ShipCity, ShipPostalCode) VALUES(@ShipName, @ShipCountry, @ShipCity, @ShipPostalCode)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
      
        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    protected void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }


}