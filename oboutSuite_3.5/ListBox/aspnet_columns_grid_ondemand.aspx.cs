using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using Obout.ListBox;

public partial class ListBox_aspnet_columns_grid_ondemand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // Handles the "LoadingItems" event of the ListBox
    protected void ListBox1_LoadingItems(object sender, ListBoxLoadingItemsEventArgs e)
    {
        // Getting the items
        DataTable data = GetItems(e.Text, e.ItemsOffset, 10);

        ListBox1.DataSource = data;
        ListBox1.DataBind();

        // Calculating the numbr of items loaded so far in the ListBox
        e.ItemsLoadedCount = e.ItemsOffset + data.Rows.Count;

        // Getting the total number of items that start with the typed text
        e.ItemsCount = GetItemsCount(e.Text);
    }

    // Gets all the countries that start with the typed text, taking paging into account
    protected DataTable GetItems(string text, int startOffset, int numberOfItems)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        string whereClause = " WHERE CompanyName LIKE @CompanyName";
        string sortExpression = " ORDER BY CompanyName";

        string commandText = "SELECT TOP " + numberOfItems + " * FROM Suppliers";
        commandText += whereClause;
        if (startOffset != 0)
        {
            commandText += " AND SupplierID NOT IN (SELECT TOP " + startOffset + " SupplierID FROM Suppliers";
            commandText += whereClause + sortExpression + ")";
        }

        commandText += sortExpression;

        OleDbCommand myComm = new OleDbCommand(commandText, myConn);
        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = text + '%';

        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Suppliers");

        myConn.Close();

        return ds.Tables[0];
    }

    // Gets the total number of items that start with the typed text
    protected int GetItemsCount(string text)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("SELECT COUNT(*) FROM Suppliers WHERE CompanyName LIKE @CompanyName", myConn);
        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = text + '%';

        return int.Parse(myComm.ExecuteScalar().ToString());
    }
}
