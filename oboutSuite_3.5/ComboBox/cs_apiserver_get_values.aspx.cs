using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_apiserver_get_values : System.Web.UI.Page
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
        ComboBox1.AutoPostBack = true;
        ComboBox1.EmptyText = "Please select an item ...";

        ComboBox1.HeaderTemplate = new HeaderTemplate();
        ComboBox1.ItemTemplate = new ItemTemplate();
        ComboBox1.FooterTemplate = new FooterTemplate();

        ComboBox1.SelectedIndexChanged += ComboBox1_SelectedIndexChanged;

        
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
            ComboBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ComboBoxItemTemlateContainer;
            ComboBoxItem item = (ComboBoxItem)container.Parent;

            Literal Container1 = item.FindControl("Container1") as Literal;
            Container1.Text = DataBinder.Eval(item.DataItem, "SupplierID").ToString();

            Literal Container2 = item.FindControl("Container2") as Literal;
            Container2.Text = DataBinder.Eval(item.DataItem, "CompanyName").ToString();

            Literal Container3 = item.FindControl("Container3") as Literal;
            Container3.Text = DataBinder.Eval(item.DataItem, "City").ToString();
        }

    }
    protected void ComboBox1_SelectedIndexChanged(object sender, ComboBoxItemEventArgs e)
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
