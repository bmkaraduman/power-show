using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_master_detail : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    private Obout.ListBox.ListBox ListBox2;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "Master";
        ListBox1.Width = Unit.Pixel(175);
        ListBox1.Height = Unit.Pixel(150);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "ContinentName";
        ListBox1.DataValueField = "ContinentID";

        ListBox1.HeaderTemplate = new HeaderTemplate("CONTINENTS");

        ListBox2 = new Obout.ListBox.ListBox();
        ListBox2.ID = "Master";
        ListBox2.Width = Unit.Pixel(200);
        ListBox2.Height = Unit.Pixel(150);
        ListBox2.EnableLoadOnDemand = true;
        ListBox2.DataSourceID = "sds2";
        ListBox2.DataTextField = "CountryName";
        ListBox2.DataValueField = "CountryID";

        ListBox2.HeaderTemplate = new HeaderTemplate("COUNTRIES");

        ListBox2.LoadingItems += Detail_LoadingItems;

        ListBox1.Details.Add(ListBox2);

        ListBox1Container.Controls.Add(ListBox1);

    }

    protected void Detail_LoadingItems(object sender, ListBoxLoadingItemsEventArgs e)
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
