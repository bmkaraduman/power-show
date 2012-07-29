using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_master_detail_unlimited : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    private ComboBox ComboBox2;
    private ComboBox ComboBox3;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "CustomersCombo";
        ComboBox1.Width = Unit.Pixel(275);
        ComboBox1.Height = Unit.Pixel(150);
        ComboBox1.EmptyText = "Select a product ...";
        ComboBox1.AutoClose = false;
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1.HeaderTemplate = new HeaderTemplate("CUSTOMERS");


        ComboBox2 = new ComboBox();
        ComboBox2.ID = "OrdersCombo";
        ComboBox2.Width = Unit.Pixel(200);
        ComboBox2.Height = Unit.Pixel(150);
        ComboBox2.EnableLoadOnDemand = true;
        ComboBox2.EmptyText = "Select a product ...";
        ComboBox2.AutoClose = false;
        ComboBox2.DataSourceID = "sds2";
        ComboBox2.DataTextField = "OrderID";
        ComboBox2.DataValueField = "OrderID";

        ComboBox2.HeaderTemplate = new HeaderTemplate("ORDERS");
        ComboBox2.ItemTemplate = new ItemTemplate();

        ComboBox2.LoadingItems += OrdersCombo_LoadingItems;

        ComboBox1.Details.Add(ComboBox2);


        ComboBox3 = new ComboBox();
        ComboBox3.ID = "OrdersCombo";
        ComboBox3.Width = Unit.Pixel(200);
        ComboBox3.Height = Unit.Pixel(150);
        ComboBox3.EnableLoadOnDemand = true;
        ComboBox3.EmptyText = "Select a product ...";
        ComboBox3.DataSourceID = "sds3";
        ComboBox3.DataTextField = "ProductName";
        ComboBox3.DataValueField = "ProductID";

        ComboBox3.HeaderTemplate = new HeaderTemplate("PRODUCTS");

        ComboBox3.LoadingItems += ProductsCombo_LoadingItems;

        ComboBox2.Details.Add(ComboBox3);


        ComboBox1Container.Controls.Add(ComboBox1);
    }
    
    protected void OrdersCombo_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        if (!string.IsNullOrEmpty(e.Text))
        {
            sds2.SelectParameters[0].DefaultValue = e.Text;
        }
    }

    protected void ProductsCombo_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        if (!string.IsNullOrEmpty(e.Text))
        {
            sds3.SelectParameters[0].DefaultValue = e.Text;

        }
    }
    public class HeaderTemplate : ITemplate
    {
        private string _headerText = "";
        public HeaderTemplate(string headerText)
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
        ComboBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ComboBoxItemTemlateContainer;
        ComboBoxItem item = (ComboBoxItem)container.Parent;

        Literal itemText = new Literal();
        itemText.Text = "#" + DataBinder.Eval(item.DataItem, "OrderID").ToString();

        templatePlaceHolder.Controls.Clear();
        templatePlaceHolder.Controls.Add(itemText);

    }
   
 }


