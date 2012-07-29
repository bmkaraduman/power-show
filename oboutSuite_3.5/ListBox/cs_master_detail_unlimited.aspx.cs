using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_master_detail_unlimited : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    private Obout.ListBox.ListBox ListBox2;
    private Obout.ListBox.ListBox ListBox3;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "CustomersList";
        ListBox1.Width = Unit.Pixel(275);
        ListBox1.Height = Unit.Pixel(150);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "CustomerID";

        ListBox1.HeaderTemplate = new HeaderTemplate1("CUSTOMERS");


        ListBox2 = new Obout.ListBox.ListBox();
        ListBox2.ID = "OrdersList";
        ListBox2.Width = Unit.Pixel(200);
        ListBox2.Height = Unit.Pixel(150);
        ListBox2.EnableLoadOnDemand = true;
        ListBox2.DataSourceID = "sds2";
        ListBox2.DataTextField = "OrderID";
        ListBox2.DataValueField = "OrderID";

        ListBox2.HeaderTemplate = new HeaderTemplate1("ORDERS");
        ListBox2.ItemTemplate = new ItemTemplate();

        ListBox2.LoadingItems += OrdersList_LoadingItems;

        ListBox1.Details.Add(ListBox2);

        ListBox3 = new Obout.ListBox.ListBox();
        ListBox3.ID = "ProductsList";
        ListBox3.Width = Unit.Pixel(200);
        ListBox3.Height = Unit.Pixel(150);
        ListBox3.EnableLoadOnDemand = true;
        ListBox3.DataSourceID = "sds3";
        ListBox3.DataTextField = "ProductName";
        ListBox3.DataValueField = "ProductID";

        ListBox3.HeaderTemplate = new HeaderTemplate1("PRODUCTS");

        ListBox3.LoadingItems += ProductsList_LoadingItems;

        ListBox2.Details.Add(ListBox3);

        ListBox1Container.Controls.Add(ListBox1);
    }

    protected void OrdersList_LoadingItems(object sender, ListBoxLoadingItemsEventArgs e)
    {
        if (!string.IsNullOrEmpty(e.Text))
        {
            sds2.SelectParameters[0].DefaultValue = e.Text;
        }
    }

    protected void ProductsList_LoadingItems(object sender, ListBoxLoadingItemsEventArgs e)
    {
        if (!string.IsNullOrEmpty(e.Text))
        {
            sds3.SelectParameters[0].DefaultValue = e.Text;
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

            Literal itemText = new Literal();
            itemText.Text = "#" + DataBinder.Eval(item.DataItem, "OrderID").ToString();

            templatePlaceHolder.Controls.Clear();
            templatePlaceHolder.Controls.Add(itemText);

        }
    }


    public class HeaderTemplate1 : ITemplate
    {
        private string _headerText = "";
        public HeaderTemplate1(string headerText)
        {
            _headerText = headerText;
        }

        public void InstantiateIn(Control container)
        {
            Literal header1 = new Literal();
            header1.Text = "<div class=\"header\">" + _headerText + "</div>";
            container.Controls.Add(header1);
        }
    }
}
