using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using Obout.ListBox;
using System.Text;

public partial class ListBox_cs_templates_header : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(250);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "CustomerID";

        ListBox1.HeaderTemplate = new HeaderTemplate();

        ListBox1Container.Controls.Add(ListBox1);
    }

    public class HeaderTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            Literal header = new Literal();
            header.Text = "<div class=\"header\">CUSTOMERS</div>";
            container.Controls.Add(header);
        }
    }
}
