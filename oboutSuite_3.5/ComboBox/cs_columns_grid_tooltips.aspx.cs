using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_columns_grid_tooltips : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(200);
        ComboBox1.MenuWidth = Unit.Pixel(400);
        ComboBox1.Height = Unit.Pixel(150);
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.EnableVirtualScrolling = true;
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "SupplierID";
        ComboBox1.EmptyText = "Select a company ...";
	    
        ComboBox1.HeaderTemplate = new HeaderTemplate();
        ComboBox1.ItemTemplate = new ItemTemplate();
        ComboBox1.FooterTemplate = new FooterTemplate();

        ComboBox1Container.Controls.Add(ComboBox1);
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
            ComboBoxFooterTemlateContainer container = templatePlaceHolder.NamingContainer as ComboBoxFooterTemlateContainer;

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
            ComboBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ComboBoxItemTemlateContainer;
            ComboBoxItem item = (ComboBoxItem)container.Parent;

            Literal title = new Literal();
            title.Text = "<div title=\"" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + " from " + DataBinder.Eval(item.DataItem, "City").ToString() + "\">";

            Literal supplierIDText = new Literal();
            supplierIDText.Text = "<div class=\"item c1\">" + DataBinder.Eval(item.DataItem, "SupplierID").ToString() + "</div>";

            Literal companyNameText = new Literal();
            companyNameText.Text = "<div class=\"item c2\">" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + "</div>";

            Literal cityText = new Literal();
            cityText.Text = " <div class=\"item c3\">" + DataBinder.Eval(item.DataItem, "City").ToString() + "</div>";

            Literal endTitle = new Literal();
            endTitle.Text = "</div>";

            templatePlaceHolder.Controls.Add(title);
            templatePlaceHolder.Controls.Add(supplierIDText);
            templatePlaceHolder.Controls.Add(companyNameText);
            templatePlaceHolder.Controls.Add(cityText);
            templatePlaceHolder.Controls.Add(endTitle);

        }

    }
}

