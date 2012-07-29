using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;
using System.Data;
using System.Data.OleDb;

public partial class ComboBox_aspnet_ondemand_initial_js : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // Handles the "LoadingItems" event of the ComboBox
    protected void ComboBox1_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        // Getting the countries
        DataTable data = GetCountries(e.Text);

        ComboBox1.Items.Clear();
        // Looping through the items and adding them to the "Items" collection of the ComboBox
        for (int i = 0; i < data.Rows.Count; i++)
        {
            ComboBox1.Items.Add(new ComboBoxItem(data.Rows[i]["CountryName"].ToString(), data.Rows[i]["CountryID"].ToString()));
        }

        e.ItemsLoadedCount = data.Rows.Count;
        e.ItemsCount = data.Rows.Count;
    }
    
    // Gets all the countries that start with the typed text, taking paging into account
    protected DataTable GetCountries(string text)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"));
        myConn.Open();

        string whereClause = " WHERE CountryName LIKE @CountryName";
        string sortExpression = " ORDER BY CountryName";

        string commandText = "SELECT TOP 25 CountryID, CountryName FROM Country";
        commandText += whereClause;
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
}
