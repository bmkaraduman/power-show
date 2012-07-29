using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_aspnet_master_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void ListBox1_OnSelectedIndexChanged(object sender, EventArgs e)
    {
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
        sds3.SelectParameters[0].DefaultValue = (ListBox2.SelectedIndex != -1 ? ListBox2.SelectedValue : "");
        
        ListBox3.Enabled = (ListBox2.SelectedIndex != -1);
        ListBox3.Items.Clear();
        ListBox3.SelectedIndex = -1;
        ListBox3.DataBind();
    }
}
