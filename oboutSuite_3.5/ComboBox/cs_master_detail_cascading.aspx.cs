using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_master_detail_cascading : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    private ComboBox ComboBox2;
    private ComboBox ComboBox3;

    protected void Page_Load(object sender, EventArgs e)
    {        
            ComboBox1 = new ComboBox();
            ComboBox1.ID = "ComboBox1";
            ComboBox1.Width = Unit.Pixel(275);
            ComboBox1.Height = Unit.Pixel(250);
            ComboBox1.AutoPostBack = true;
            ComboBox1.EmptyText = "Select a customer ...";
            ComboBox1.DataSourceID = "sds1";
            ComboBox1.DataTextField = "CompanyName";
            ComboBox1.DataValueField = "CustomerID";

            ComboBox1.SelectedIndexChanged += ComboBox1_OnSelectedIndexChanged;

            ComboBox1Container.Controls.Add(ComboBox1);


            ComboBox2 = new ComboBox();
            ComboBox2.ID = "ComboBox2";
            ComboBox2.Width = Unit.Pixel(275);            
            ComboBox2.Enabled = false;            
            ComboBox2.AutoPostBack = true;
            ComboBox2.EmptyText = "Select an order ...";
            ComboBox2.DataSourceID = "sds2";
            ComboBox2.DataTextField = "OrderID";
            ComboBox2.DataValueField = "OrderID";

            ComboBox2.SelectedIndexChanged += ComboBox2_OnSelectedIndexChanged;

            ComboBox2Container.Controls.Add(ComboBox2);


            ComboBox3 = new ComboBox();
            ComboBox3.ID = "ComboBox3";
            ComboBox3.Width = Unit.Pixel(275);
            ComboBox3.Enabled = false;            
            ComboBox3.EmptyText = "Select a supplier ...";
            ComboBox3.DataSourceID = "sds3";
            ComboBox3.DataTextField = "CompanyName";
            ComboBox3.DataValueField = "SupplierID";

            ComboBox3Container.Controls.Add(ComboBox3);


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
