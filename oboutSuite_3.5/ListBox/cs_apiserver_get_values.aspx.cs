using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;
using System.Data;
using System.Data.OleDb;

public partial class ListBox_cs_apiserver_get_values : System.Web.UI.Page
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
        ListBox1.AutoPostBack = true;

        ListBox1.HeaderTemplate = new HeaderTemplate();
        ListBox1.ItemTemplate = new ItemTemplate();
        ListBox1.FooterTemplate = new FooterTemplate();

        ListBox1.SelectedIndexChanged += ListBox1_SelectedIndexChanged;

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

            Literal cont11 = new Literal();
            cont11.Text = "<div class=\"item c1\">";

            Literal Container1 = new Literal();
            Container1.ID = "Container1";

            Literal cont12 = new Literal();
            cont12.Text = "</div>";

            Literal cont21 = new Literal();
            cont21.Text = "<div class=\"item c2\">";

            Literal Container2 = new Literal();
            Container2.ID = "Container2";

            Literal cont22 = new Literal();
            cont22.Text = "</div>";

            Literal cont31 = new Literal();
            cont31.Text = "<div class=\"item c3\">";

            Literal Container3 = new Literal();
            Container3.ID = "Container3";

            Literal cont32 = new Literal();
            cont32.Text = "</div>";

            templatePlaceHolder.Controls.Add(cont11);
            templatePlaceHolder.Controls.Add(Container1);
            templatePlaceHolder.Controls.Add(cont12);
            templatePlaceHolder.Controls.Add(cont21);
            templatePlaceHolder.Controls.Add(Container2);
            templatePlaceHolder.Controls.Add(cont22);
            templatePlaceHolder.Controls.Add(cont31);
            templatePlaceHolder.Controls.Add(Container3);
            templatePlaceHolder.Controls.Add(cont32);

        }

        public void DataBindTemplate(object sender, EventArgs e)
        {
            PlaceHolder templatePlaceHolder = sender as PlaceHolder;
            ListBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ListBoxItemTemlateContainer;
            ListBoxItem item = (ListBoxItem)container.Parent;

            Literal Container1 = item.FindControl("Container1") as Literal;
            Container1.Text = DataBinder.Eval(item.DataItem, "SupplierID").ToString();

            Literal Container2 = item.FindControl("Container2") as Literal;
            Container2.Text = DataBinder.Eval(item.DataItem, "CompanyName").ToString();

            Literal Container3 = item.FindControl("Container3") as Literal;
            Container3.Text = DataBinder.Eval(item.DataItem, "City").ToString();
        }

    }
    protected void ListBox1_SelectedIndexChanged(object sender, ListBoxItemEventArgs e)
    {
        Literal container1 = e.Item.FindControl("Container1") as Literal;
        Literal container2 = e.Item.FindControl("Container2") as Literal;
        Literal container3 = e.Item.FindControl("Container3") as Literal;

        string details = "<br /><br />";

        details += "<b>Supplier ID</b>: " + container1.Text;
        details += "<br />";
        details += "<b>Company Name</b>: " + container2.Text;
        details += "<br />";
        details += "<b>City</b>: " + container3.Text;

        Details.Text = details;
    }

}
