using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

namespace cs_templates_footer
{
    public partial class ComboBox_cs_templates_footer : System.Web.UI.Page
    {
        private ComboBox ComboBox1;

        protected void Page_Load(object sender, EventArgs e)
        {
            ComboBox1 = new ComboBox();
            ComboBox1.ID = "ComboBox1";
            ComboBox1.Width = Unit.Pixel(250);
            ComboBox1.DataSourceID = "sds1";
            ComboBox1.DataTextField = "CompanyName";
            ComboBox1.DataValueField = "CustomerID";


            ComboBox1.FooterTemplate = new FooterTemplate();

            ComboBox1Container.Controls.Add(ComboBox1);

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
}
