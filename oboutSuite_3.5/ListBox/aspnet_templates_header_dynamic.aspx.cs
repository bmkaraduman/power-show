using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_aspnet_templates_header_dynamic : System.Web.UI.Page
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
