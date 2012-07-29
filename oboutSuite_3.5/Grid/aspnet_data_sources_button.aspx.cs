using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using Obout.Interface;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_data_sources_button : System.Web.UI.Page
{
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

        Grid1.ClearPreviousDataSource();
        Grid1.DataSource = myReader;
        Grid1.DataBind();

        myConn.Close();	
	}
   
}