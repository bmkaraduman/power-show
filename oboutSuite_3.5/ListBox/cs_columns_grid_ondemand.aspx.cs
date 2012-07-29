using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using Obout.ListBox;

public partial class ListBox_cs_columns_grid_ondemand : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(400);
        ListBox1.Height = Unit.Pixel(150);
        ListBox1.EnableLoadOnDemand = true;
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "SupplierID";

        ListBox1.LoadingItems += ListBox1_LoadingItems;

        ListBox1.HeaderTemplate = new HeaderTemplate();
        ListBox1.ItemTemplate = new ItemTemplate();
        ListBox1.FooterTemplate = new FooterTemplate();

        ListBox1Container.Controls.Add(ListBox1);
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

     public class HeaderTemplate : ITemplate
    {

        public void InstantiateIn(Control container)
        {

            Literal header = new Literal();
            header.Text = "<div class=\"header c1\">ID</div>";
            container.Controls.Add(header);

            Literal header2 = new Literal();
            header2.Text = "<div class=\"header c2\">COMPANY NAME</div>";
            container.Controls.Add(header2);

            Literal header3 = new Literal();
            header3.Text = "<div class=\"header c3\">CITY</div>";
            container.Controls.Add(header3);
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
            ListBoxFooterTemlateContainer container = templatePlaceHolder.NamingContainer as ListBoxFooterTemlateContainer;

            Literal footer = new Literal();
            footer.Text = "Displaying " + (container.ItemsCount > 0 ? "1" : "0") + " - " + container.ItemsLoadedCount.ToString() + " out of " + container.ItemsCount.ToString();
            Literal countryText1 = new Literal();

            templatePlaceHolder.Controls.Add(footer);
        }
    }
    public class ItemTemplate : ITemplate
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
            ListBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ListBoxItemTemlateContainer;
            ListBoxItem item = (ListBoxItem)container.Parent;

            templatePlaceHolder.Controls.Clear();

            Literal supplierIDText = new Literal();
            supplierIDText.Text = "<div class=\"item c1\">" + DataBinder.Eval(item.DataItem, "SupplierID").ToString() + "</div>";

            Literal companyNameText = new Literal();
            companyNameText.Text = "<div class=\"item c2\">" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + "</div>";

            Literal cityText = new Literal();
            cityText.Text = " <div class=\"item c3\">" + DataBinder.Eval(item.DataItem, "City").ToString() + "</div>";

            templatePlaceHolder.Controls.Add(supplierIDText);
            templatePlaceHolder.Controls.Add(companyNameText);
            templatePlaceHolder.Controls.Add(cityText);

        }

    }
 }

