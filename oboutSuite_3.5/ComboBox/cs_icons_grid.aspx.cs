using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_icons_grid : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(200);
        ComboBox1.Height = Unit.Pixel(230);
        ComboBox1.MenuWidth = Unit.Pixel(400);
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "ProductName";
        ComboBox1.DataValueField = "ProductID";

        ComboBox1.HeaderTemplate = new HeaderTemplate();
        ComboBox1.ItemTemplate = new ItemTemplate(IsPostBack);
        ComboBox1.FooterTemplate = new FooterTemplate();

        ComboBox1Container.Controls.Add(ComboBox1);
       
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
            ComboBoxFooterTemlateContainer container = templatePlaceHolder.NamingContainer as ComboBoxFooterTemlateContainer;

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
            ComboBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ComboBoxItemTemlateContainer;
            ComboBoxItem item = (ComboBoxItem)container.Parent;

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
