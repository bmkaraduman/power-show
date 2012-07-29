using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using Obout.ComboBox;
using System.Text;

public partial class ComboBox_aspnet_templates_header_dynamic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
