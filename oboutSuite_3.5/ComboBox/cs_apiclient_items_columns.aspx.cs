using System;
using System.Collections.Generic;
using Obout.ComboBox;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ComboBox_cs_apiclient_items_columns : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(400);
        ComboBox1.Height = Unit.Pixel(150);
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "SupplierID";
        ComboBox1.HeaderTemplate = new HeaderTemplate();
        ComboBox1.ItemTemplate = new ItemTemplate(IsPostBack);
        ComboBox1.FooterTemplate = new FooterTemplate();

        ComboBox1Container.Controls.Add(ComboBox1);
    }
    public class HeaderTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);

            Literal id = new Literal();
            id.Text = "<div class=\"header c1\">ID</div>";
            Literal companyname = new Literal();
            companyname.Text = "<div class=\"header c2\">COMPANY NAME</div>";
            Literal city = new Literal();
            city.Text = "<div class=\"header c3\">CITY</div>";

            templatePlaceHolder.Controls.Add(id);
            templatePlaceHolder.Controls.Add(companyname);
            templatePlaceHolder.Controls.Add(city);
        }
    }
    public class ItemTemplate : ITemplate
    {
        private bool isPostBack;

        public ItemTemplate(bool _isPostBack)
        {
            isPostBack = _isPostBack;
        }

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

            Literal containerTemplate = new Literal();
            if (!isPostBack)
                containerTemplate.Text = "<div class=\"item c1\">" + DataBinder.Eval(item.DataItem, "SupplierID").ToString() + "</div><div class=\"item c2\">" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + "</div><div class=\"item c3\">" + DataBinder.Eval(item.DataItem, "City").ToString() + "</div>";

            templatePlaceHolder.Controls.Add(containerTemplate);
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
            footer.Text = "Displaying " + container.ItemsCount.ToString() + " items.";
            Literal countryText1 = new Literal();

            templatePlaceHolder.Controls.Add(footer);
        }
    }
}
