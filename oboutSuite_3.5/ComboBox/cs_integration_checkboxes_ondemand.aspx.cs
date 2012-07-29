using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;
using System.Data;
using System.Data.OleDb;

public partial class ComboBox_cs_integration_checkboxes_ondemand : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(250);
        ComboBox1.Height = Unit.Pixel(200);
        ComboBox1.DataTextField = "CountryName";
        ComboBox1.DataValueField = "CountryID";
        ComboBox1.AutoClose = false;
        ComboBox1.AllowCustomText = true;
        ComboBox1.AutoValidate = true;
        ComboBox1.AllowEdit = false;
        ComboBox1.OpenOnFocus = true;
        ComboBox1.EmptyText = "Select countries ...";
        ComboBox1.EnableVirtualScrolling = true;
        ComboBox1.EnableLoadOnDemand = true;
        ComboBox1.LoadingItems += ComboBox1_LoadingItems;
        ComboBox1.ClientSideEvents.OnItemClick = "ComboBox1_ItemClick";
        ComboBox1.SelectionMode = ListSelectionMode.Multiple;

        ComboBox1.ItemTemplate = new ItemTemplate();
        ComboBox1.FooterTemplate = new FooterTemplate();

        ComboBox1Container.Controls.Add(ComboBox1);
       
    }
    public class ItemTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {

            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);
            templatePlaceHolder.DataBinding += new EventHandler(DataBindTemplate);

            Literal divContainer = new Literal();
            divContainer.Text = "<div class=\"item\">";

            CheckBox CheckBox1 = new CheckBox();
            CheckBox1.ID = "CheckBox1";

            Literal innerContainer = new Literal();

            templatePlaceHolder.Controls.Add(divContainer);
            templatePlaceHolder.Controls.Add(CheckBox1);
            templatePlaceHolder.Controls.Add(innerContainer);
        }

        public void DataBindTemplate(object sender, EventArgs e)
        {
            PlaceHolder templatePlaceHolder = sender as PlaceHolder;
            ComboBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ComboBoxItemTemlateContainer;
            ComboBoxItem item = (ComboBoxItem)container.Parent;

            Literal innerContainer = templatePlaceHolder.Controls[2] as Literal;
            innerContainer.Text += container.Text.ToString();
        }
    }
    public class FooterTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {

            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);
            templatePlaceHolder.DataBinding += new EventHandler(DataBindTemplate);
        }

        public void DataBindTemplate(object sender, EventArgs e)
        {
            PlaceHolder templatePlaceHolder = sender as PlaceHolder;
            ComboBoxFooterTemlateContainer container = templatePlaceHolder.NamingContainer as ComboBoxFooterTemlateContainer;

            Literal footer = new Literal();
            footer.Text = "Displaying " + (container.ItemsCount > 0 ? "1" : "0") + " - " + container.ItemsLoadedCount.ToString() + " out of " + container.ItemsCount.ToString();
            Literal countryText1 = new Literal();

            templatePlaceHolder.Controls.Add(footer);
        }
    }
    protected void Order(object sender, EventArgs e)
    {
        if (ComboBox1.SelectedText != "" && ComboBox1.SelectedText != ComboBox1.EmptyText)
        {
            OrderDetails.Text = "<br /><br /><br /><b>The following countries have been selected:</b> " + ComboBox1.SelectedText + "<br />";
        }
        else
        {
            OrderDetails.Text = "";
        }
    }

    // Handles the "LoadingItems" event of the ComboBox
    protected void ComboBox1_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        // Getting the countries
        DataTable data = GetCountries(e.Text, e.ItemsOffset, 25);

        // Looping through the items and adding them to the "Items" collection of the ComboBox
        for (int i = 0; i < data.Rows.Count; i++)
        {
            ComboBox1.Items.Add(new ComboBoxItem(data.Rows[i]["CountryName"].ToString(), data.Rows[i]["CountryID"].ToString()));
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
        if (startOffset != 0)
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
