using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_templates_header_dynamic : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    private Obout.ListBox.ListBox ListBox2;
    private Obout.ListBox.ListBox ListBox3;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(275);
        ListBox1.Height = Unit.Pixel(200);
        ListBox1.AutoPostBack = true;
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "CustomerID";
        ListBox1.AppendDataBoundItems = false;

        ListBox1.SelectedIndexChanged += ListBox1_OnSelectedIndexChanged;

        ListBox1Container.Controls.Add(ListBox1);

        ListBox2 = new Obout.ListBox.ListBox();
        ListBox2.ID = "ListBox2";
        ListBox2.Width = Unit.Pixel(200);
        ListBox2.Height = Unit.Pixel(200);
        ListBox2.AutoPostBack = true;
        ListBox2.Enabled = false;
        ListBox2.DataSourceID = "sds2";
        ListBox2.DataTextField = "OrderID";
        ListBox2.DataValueField = "OrderID";
        ListBox2.AppendDataBoundItems = false;

        ListBox2.SelectedIndexChanged += ListBox2_OnSelectedIndexChanged;

        ListBox2Container.Controls.Add(ListBox2);

        ListBox3 = new Obout.ListBox.ListBox();
        ListBox3.ID = "ListBox3";
        ListBox3.Width = Unit.Pixel(200);
        ListBox3.Height = Unit.Pixel(200);
        ListBox3.Enabled = false;
        ListBox3.DataSourceID = "sds3";
        ListBox3.DataTextField = "CompanyName";
        ListBox3.DataValueField = "SupplierID";
        ListBox2.AppendDataBoundItems = false;

        ListBox3Container.Controls.Add(ListBox3);

        if (!IsPostBack)
        {
            ConfigureHeaderTemplates();
        }
    }

    protected void ConfigureHeaderTemplates()
    {
        ListBox1.HeaderTemplate = new HeaderTemplate("CUSTOMERS");
        ListBox2.HeaderTemplate = new HeaderTemplate((ListBox1.SelectedText != String.Empty ? ListBox1.SelectedText : ""));
        ListBox3.HeaderTemplate = new HeaderTemplate((ListBox2.SelectedText != String.Empty ? "Order #" + ListBox2.SelectedText : ""));

        ListBox1.DataBind();
        ListBox2.DataBind();
        ListBox3.DataBind();
    }

    protected void ListBox1_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        ListBox2.SelectedText = "";

        ConfigureHeaderTemplates();

        sds2.SelectParameters[0].DefaultValue = ListBox1.SelectedValue;
        sds3.SelectParameters[0].DefaultValue = "";

        ListBox2.Enabled = true;
        ListBox2.Items.Clear();
        ListBox2.SelectedIndex = -1;
        ListBox2.SelectedValue = "";
        ListBox2.DataBind();

        ListBox3.Enabled = false;
        ListBox3.Items.Clear();
        ListBox3.SelectedIndex = -1;
    }

    protected void ListBox2_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        ListBox3.SelectedText = "";

        ConfigureHeaderTemplates();

        sds3.SelectParameters[0].DefaultValue = (ListBox2.SelectedIndex != -1 ? ListBox2.SelectedValue : "");

        ListBox3.Enabled = (ListBox2.SelectedIndex != -1);
        ListBox3.Items.Clear();
        ListBox3.SelectedIndex = -1;
        ListBox3.DataBind();
    }

    public class HeaderTemplate : ITemplate
    {
        private string _text;

        public HeaderTemplate(string text)
        {
            _text = text;
        }

        public void InstantiateIn(Control container)
        {
            Literal header = new Literal();
            header.Text = _text;
            container.Controls.Add(header);
        }
    }
}