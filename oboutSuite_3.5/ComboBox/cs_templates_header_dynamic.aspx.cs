using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_templates_header_dynamic : System.Web.UI.Page
{
    private Obout.ComboBox.ComboBox ComboBox1;
    private Obout.ComboBox.ComboBox ComboBox2;
    private Obout.ComboBox.ComboBox ComboBox3;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new Obout.ComboBox.ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(275);
        ComboBox1.Height = Unit.Pixel(200);
        ComboBox1.AutoPostBack = true;
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";
        ComboBox1.AppendDataBoundItems = false;

        ComboBox1.SelectedIndexChanged += ComboBox1_OnSelectedIndexChanged;

        ComboBox1Container.Controls.Add(ComboBox1);

        ComboBox2 = new Obout.ComboBox.ComboBox();
        ComboBox2.ID = "ComboBox2";
        ComboBox2.Width = Unit.Pixel(200);
        ComboBox2.Height = Unit.Pixel(200);
        ComboBox2.AutoPostBack = true;
        ComboBox2.Enabled = false;
        ComboBox2.DataSourceID = "sds2";
        ComboBox2.DataTextField = "OrderID";
        ComboBox2.DataValueField = "OrderID";
        ComboBox2.AppendDataBoundItems = false;

        ComboBox2.SelectedIndexChanged += ComboBox2_OnSelectedIndexChanged;

        ComboBox2Container.Controls.Add(ComboBox2);

        ComboBox3 = new Obout.ComboBox.ComboBox();
        ComboBox3.ID = "ComboBox3";
        ComboBox3.Width = Unit.Pixel(200);
        ComboBox3.Height = Unit.Pixel(200);
        ComboBox3.Enabled = false;
        ComboBox3.DataSourceID = "sds3";
        ComboBox3.DataTextField = "CompanyName";
        ComboBox3.DataValueField = "SupplierID";
        ComboBox2.AppendDataBoundItems = false;

        ComboBox3Container.Controls.Add(ComboBox3);

        if (!IsPostBack)
        {
            ConfigureHeaderTemplates();
        }
    }

    protected void ConfigureHeaderTemplates()
    {
        ComboBox1.HeaderTemplate = new HeaderTemplate("CUSTOMERS");
        ComboBox2.HeaderTemplate = new HeaderTemplate((ComboBox1.SelectedText != String.Empty ? ComboBox1.SelectedText : ""));
        ComboBox3.HeaderTemplate = new HeaderTemplate((ComboBox2.SelectedText != String.Empty ? "Order #" + ComboBox2.SelectedText : ""));

        ComboBox1.DataBind();
        ComboBox2.DataBind();
        ComboBox3.DataBind();
    }

    protected void ComboBox1_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        ComboBox2.SelectedText = "";

        ConfigureHeaderTemplates();

        sds2.SelectParameters[0].DefaultValue = ComboBox1.SelectedValue;
        sds3.SelectParameters[0].DefaultValue = "";

        ComboBox2.Enabled = true;
        ComboBox2.Items.Clear();
        ComboBox2.SelectedIndex = -1;
        ComboBox2.SelectedValue = "";
        ComboBox2.DataBind();

        ComboBox3.Enabled = false;
        ComboBox3.Items.Clear();
        ComboBox3.SelectedIndex = -1;
    }

    protected void ComboBox2_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        ComboBox3.SelectedText = "";

        ConfigureHeaderTemplates();

        sds3.SelectParameters[0].DefaultValue = (ComboBox2.SelectedIndex != -1 ? ComboBox2.SelectedValue : "");

        ComboBox3.Enabled = (ComboBox2.SelectedIndex != -1);
        ComboBox3.Items.Clear();
        ComboBox3.SelectedIndex = -1;
        ComboBox3.DataBind();
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
