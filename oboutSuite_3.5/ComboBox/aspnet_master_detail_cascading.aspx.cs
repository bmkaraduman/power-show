using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_aspnet_master_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void ComboBox1_OnSelectedIndexChanged(object sender, EventArgs e)
    {
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
        sds3.SelectParameters[0].DefaultValue = (ComboBox2.SelectedIndex != -1 ? ComboBox2.SelectedValue : "");

        ComboBox3.Enabled = (ComboBox2.SelectedIndex != -1);
        ComboBox3.Items.Clear();
        ComboBox3.SelectedIndex = -1;
        ComboBox3.DataBind();
    }
}
