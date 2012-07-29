using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_master_detail : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    private ComboBox ComboBox2;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "Master";
        ComboBox1.Width = Unit.Pixel(200);
        ComboBox1.Height = Unit.Pixel(150);
        ComboBox1.AutoClose = false;
        ComboBox1.EmptyText = "Select a country ...";
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "ContinentName";
        ComboBox1.DataValueField = "ContinentID";

        ComboBox1.HeaderTemplate = new HeaderTemplate("CONTINENTS");


        ComboBox2 = new ComboBox();
        ComboBox2.ID = "Detail";
        ComboBox2.Width = Unit.Pixel(200);
        ComboBox2.Height = Unit.Pixel(150);
        ComboBox2.EnableLoadOnDemand = true;
        ComboBox2.EmptyText = "Select a country ...";
        ComboBox2.DataSourceID = "sds2";
        ComboBox2.DataTextField = "CountryName";
        ComboBox2.DataValueField = "CountryID";

        ComboBox2.HeaderTemplate = new HeaderTemplate("COUNTRIES");

        ComboBox2.LoadingItems += Detail_LoadingItems;

        ComboBox1.Details.Add(ComboBox2);

        ComboBox1Container.Controls.Add(ComboBox1);

    }
  
    protected void Detail_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        if (!string.IsNullOrEmpty(e.Text))
        {
            int tryout = 0;
            if (int.TryParse(e.Text, out tryout))
            {
                sds2.SelectParameters[0].DefaultValue = e.Text;
            }
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
