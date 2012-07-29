using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;
using System.Data;
using System.Data.OleDb;

public partial class ListBox_cs_ondemand : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {

        ListBox1 = new Obout.ListBox.ListBox(); 
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(200);
        ListBox1.Height = Unit.Pixel(200);
        ListBox1.EnableLoadOnDemand = true;
        ListBox1.DataTextField = "CountryName";
        ListBox1.DataValueField = "CountryID";

        ListBox1.LoadingItems += ListBox1_LoadingItems;

        ListBox1Container.Controls.Add(ListBox1);
       
    }

    // Handles the "LoadingItems" event of the ListBox
    protected void ListBox1_LoadingItems(object sender, ListBoxLoadingItemsEventArgs e)
    {
        // Getting the countries
        DataTable data = GetCountries(e.Text);

        // Looping through the items and adding them to the "Items" collection of the ListBox
        for (int i = 0; i < data.Rows.Count; i++)
        {
            ListBox1.Items.Add(new ListBoxItem(data.Rows[i]["CountryName"].ToString(), data.Rows[i]["CountryID"].ToString()));
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
