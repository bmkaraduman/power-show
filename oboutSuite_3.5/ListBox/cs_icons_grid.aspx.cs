using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;
using System.Data;
using System.Data.OleDb;

public partial class ListBox_cs_icons_grid : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {

        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(400);
        ListBox1.Height = Unit.Pixel(250);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "ProductName";
        ListBox1.DataValueField = "ProductID";

        ListBox1.HeaderTemplate = new HeaderTemplate();
        ListBox1.ItemTemplate = new ItemTemplate(IsPostBack);
        ListBox1.FooterTemplate = new FooterTemplate();

        ListBox1Container.Controls.Add(ListBox1);
        
    }
    public class HeaderTemplate : ITemplate
    {

        public void InstantiateIn(Control container)
        {
            Literal header = new Literal();
            header.Text = "<div class=\"header c1\">&#160;</div>";
            container.Controls.Add(header);

            Literal header2 = new Literal();
            header2.Text = "<div class=\"header c2\">PRODUCT NAME</div>";
            container.Controls.Add(header2);

            Literal header3 = new Literal();
            header3.Text = "<div class=\"header c3\">PRICE</div>";
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
            ListBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ListBoxItemTemlateContainer;
            ListBoxItem item = (ListBoxItem)container.Parent;

            Literal item11 = new Literal();
            item11.Text = "<div class=\"item c1\">";

            Image img = new Image();
            img.ImageUrl = "~/Grid/resources/images/products/" + DataBinder.Eval(item.DataItem, "Image").ToString();

            Literal item12 = new Literal();
            item12.Text = "</div>";



            Literal item21 = new Literal();
            item21.Text = "<div class=\"item c2\">";

            Literal item22 = new Literal();
            item22.Text = DataBinder.Eval(item.DataItem, "ProductName").ToString();

            Literal item23 = new Literal();
            item23.Text = "</div>";



            Literal item31 = new Literal();
            item31.Text = "<div class=\"item c3\">";

            Literal item32 = new Literal();
            //item32.Text =  string.Format("{0:C2}", DataBinder.Eval(item.DataItem, "UnitPrice").ToString());
            item32.Text = Convert.ToDouble(DataBinder.Eval(item.DataItem, "UnitPrice").ToString()).ToString("$#,##0.00;($#,##0.00);Zero");

            Literal item33 = new Literal();
            item33.Text = "</div>";

            templatePlaceHolder.Controls.Add(item11);
            templatePlaceHolder.Controls.Add(img);
            templatePlaceHolder.Controls.Add(item12);
            templatePlaceHolder.Controls.Add(item21);
            templatePlaceHolder.Controls.Add(item22);
            templatePlaceHolder.Controls.Add(item23);
            templatePlaceHolder.Controls.Add(item31);
            templatePlaceHolder.Controls.Add(item32);
            templatePlaceHolder.Controls.Add(item33);
        }

    }
}
