using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;
using System.Collections;
using System.Web.Services;

public partial class Grid_aspnet_rows_draganddrop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    [WebMethod]
    public static void SaveRowsPosition(string data)
    {
        string[] items = data.Split(',');

        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|MoveOrder.mdb");
        myConn.Open();

        foreach (string item in items)
        {
            string[] itemData = item.Split('*');
            
            OleDbCommand myComm = new OleDbCommand("UPDATE Orders_2 SET RowPosition = @RowPosition WHERE OrderID = @OrderID", myConn);
            myComm.Parameters.Add("@RowPosition", OleDbType.Integer).Value = itemData[1];
            myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = itemData[0];

            myComm.ExecuteNonQuery();
        }

        myConn.Close();
    }
}