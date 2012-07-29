using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;
using System.Collections;

public partial class Grid_aspnet_rows_reorder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Grid1_UpdateCommand(object sender, GridRecordEventArgs e)
    {
        string[] rowPosition = e.Record["RowPosition"].ToString().Split('_');
        
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"));
        myConn.Open();

        string selectQuery = "";
        if (rowPosition[1] == "-1")
        {
            selectQuery = "SELECT TOP 1 OrderID, RowPosition FROM Orders_2 WHERE RowPosition <= @RowPosition AND OrderID <> @OrderID ORDER BY RowPosition DESC";
        }
        else
        {
            selectQuery = "SELECT TOP 1 OrderID, RowPosition FROM Orders_2 WHERE RowPosition >= @RowPosition AND OrderID <> @OrderID ORDER BY RowPosition ASC";
        }

        OleDbCommand myComm = new OleDbCommand(selectQuery, myConn);
        myComm.Parameters.Add("@RowPosition", OleDbType.Integer).Value = rowPosition[0];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        OleDbDataReader reader = myComm.ExecuteReader();

        if(reader.Read())
        {
            int toggeledOrderId = reader.GetInt32(0);
            int toggeledRowPosition = reader.GetInt32(1);

            int orderId = int.Parse(e.Record["OrderID"].ToString());
            int oldRowPosition = int.Parse(rowPosition[0]);

            OleDbCommand myComm2 = new OleDbCommand("UPDATE Orders_2 SET RowPosition=@RowPosition WHERE OrderID = @OrderID", myConn);            
            myComm2.Parameters.Add("@RowPosition", OleDbType.Integer).Value = toggeledRowPosition;
            myComm2.Parameters.Add("@OrderID", OleDbType.Integer).Value = orderId;
            myComm2.ExecuteNonQuery();

            OleDbCommand myComm3 = new OleDbCommand("UPDATE Orders_2 SET RowPosition=@RowPosition WHERE OrderID = @OrderID", myConn);            
            myComm3.Parameters.Add("@RowPosition", OleDbType.Integer).Value = oldRowPosition;
            myComm3.Parameters.Add("@OrderID", OleDbType.Integer).Value = toggeledOrderId;
            myComm3.ExecuteNonQuery();

            Hashtable record = new Hashtable();
            record.Add("OrderID", orderId);
            record.Add("RowPosition", toggeledRowPosition);
            record.Add("ShipName", e.Record["ShipName"].ToString());
            record.Add("ShipCity", e.Record["ShipCity"].ToString());
            record.Add("ShipPostalCode", e.Record["ShipPostalCode"].ToString());
            record.Add("ShipCountry", e.Record["ShipCountry"].ToString());
            Grid1.SelectedRecords.Add(record);
        }

        
        myConn.Close();
    }
}