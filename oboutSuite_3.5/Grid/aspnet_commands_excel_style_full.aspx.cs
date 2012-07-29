using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_aspnet_commands_excel_style_full : System.Web.UI.Page
{
    protected void SaveChanges(object sender, EventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        // extract the rows to insert/update from the hidden field
        string excelData = Grid1ExcelData.Value;

        // extract the ids of the rows to delete from the hidden field
        string excelDeletedIds = Grid1ExcelDeletedIds.Value;

        string[] rowSeparator = new string[] { "|*row*|" };
        string[] cellSeparator = new string[] { "|*cell*|" };

        string[] dataRows = excelData.Split(rowSeparator, StringSplitOptions.None);

        for (int i = 0; i < dataRows.Length; i++)
        {
            string[] dataCells = dataRows[i].Split(cellSeparator, StringSplitOptions.None);

            string orderId = dataCells[0];
            string shipName = dataCells[1];
            string shipCity = dataCells[2];
            string shipAddress = dataCells[3];
            string shipCountry = dataCells[4];
            string orderDate = dataCells[5];
            bool sent = dataCells[6] == "yes";

            string insertUpdateQuery = "";
            if (!string.IsNullOrEmpty(orderId))
            {
                insertUpdateQuery = "UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipAddress = @ShipAddress, ShipCountry = @ShipCountry, OrderDate = @OrderDate, Sent = @Sent WHERE OrderID = @OrderID";
            }
            else
            {
                insertUpdateQuery = "INSERT INTO Orders (ShipName, ShipCity, ShipAddress, ShipCountry, OrderDate, Sent) VALUES(@ShipName, @ShipCity, @ShipAddress, @ShipCountry, @OrderDate, @Sent)";
            }

            OleDbCommand myComm = new OleDbCommand(insertUpdateQuery, myConn);

            myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = shipName;
            myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = shipCity;
            myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = shipAddress;
            myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = shipCountry;
            myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = orderDate;
            myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = sent;

            if (!string.IsNullOrEmpty(orderId))
            {
                myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = orderId;
            }

            myComm.ExecuteNonQuery();
        }

        if (!string.IsNullOrEmpty(excelDeletedIds))
        {
            // delete the rows that were deleted
            OleDbCommand deleteComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID IN (" + excelDeletedIds + ")", myConn);
            deleteComm.ExecuteNonQuery();
        }

        myConn.Close();

        Grid1.DataBind();
    }
}
