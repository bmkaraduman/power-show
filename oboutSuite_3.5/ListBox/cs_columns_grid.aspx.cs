using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;
using System.Data;
using System.Data.OleDb;

public partial class ListBox_cs_columns_grid : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {

        ListBox1 = new Obout.ListBox.ListBox(); 
        ListBox1.ID = "ListBox3";
        ListBox1.Width = Unit.Pixel(400);
        ListBox1.Height = Unit.Pixel(150);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "SupplierID";

        ListBox1.HeaderTemplate = new HeaderTemplate();
        ListBox1.ItemTemplate = new ItemTemplate();
        ListBox1.FooterTemplate = new FooterTemplate();

        ListBox1Container.Controls.Add(ListBox1);
        
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
            footer.Text = "Displaying " + container.ItemsCount.ToString();
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
