using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;
using System.Data;
using System.Data.OleDb;

public partial class ComboBox_aspnet_mode_textbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // Handles the "LoadingItems" event of the ComboBox
    protected void ComboBox3_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        // Getting the countries
        DataTable data = GetCountries(e.Text, e.ItemsOffset, 25);

        // Looping through the items and adding them to the "Items" collection of the ComboBox
        for (int i = 0; i < data.Rows.Count; i++)
        {
            ComboBox3.Items.Add(new ComboBoxItem(data.Rows[i]["CountryName"].ToString(), data.Rows[i]["CountryID"].ToString()));
        }

        // Calculating the numbr of items loaded so far in the ComboBox
        e.ItemsLoadedCount = e.ItemsOffset + data.Rows.Count;
        
        // Getting the total number of items that start with the typed text
        e.ItemsCount = GetItemsCount(e.Text);
    }
    
    // Gets all the countries that start with the typed text, taking paging into account
    protected DataTable GetCountries(string text, int startOffset, int numberOfItems)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"));
        myConn.Open();

        string whereClause = " WHERE CountryName LIKE @CountryName";
        string sortExpression = " ORDER BY CountryName";

        string commandText = "SELECT TOP " + numberOfItems + " CountryID, CountryName FROM Country";
        commandText += whereClause;
        if(startOffset != 0)
        {
            commandText += " AND CountryID NOT IN (SELECT TOP " + startOffset + " CountryID FROM Country";
            commandText += whereClause + sortExpression + ")";
        }

        commandText += sortExpression;

        OleDbCommand myComm = new OleDbCommand(commandText, myConn);
        myComm.Parameters.Add("@CountryName", OleDbType.VarChar).Value = text + '%';

        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Country");

        myConn.Close();

        return ds.Tables[0];
    }

    // Gets the total number of items that start with the typed text
    protected int GetItemsCount(string text)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("SELECT COUNT(*) FROM Country WHERE CountryName LIKE @CountryName", myConn);
        myComm.Parameters.Add("@CountryName", OleDbType.VarChar).Value = text + '%';

        return int.Parse(myComm.ExecuteScalar().ToString());
    }
}
