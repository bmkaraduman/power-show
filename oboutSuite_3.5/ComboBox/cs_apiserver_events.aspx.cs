using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_apiserver_events : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(250);
        ComboBox1.EmptyText = "Select a customer ...";
        ComboBox1.AutoPostBack = true;
        ComboBox1.DataSourceID = "sds1"; 
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1.SelectedIndexChanged += ComboBox1_SelectedIndexChanged;

        ComboBox1Container.Controls.Add(ComboBox1);
       
    }

    protected void ComboBox1_SelectedIndexChanged(object sender, ComboBoxItemEventArgs e)
    {
        EventLogger.Text = "<br /><br /><b>The selection has been changed to:</b> " + e.Item.Text;
    }
}
