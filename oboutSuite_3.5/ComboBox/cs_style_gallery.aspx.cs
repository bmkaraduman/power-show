using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_selection_retrieve : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
       
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.AllowEdit = false;
        ComboBox1.AutoPostBack = true; 
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1.SelectedIndexChanged += ComboBox1_SelectedIndexChanged;

        ComboBox1.Items.Add(new ComboBoxItem("black_glass"));
        ComboBox1.Items.Add(new ComboBoxItem("grand_gray"));
        ComboBox1.Items.Add(new ComboBoxItem("plain"));
        ComboBox1.Items.Add(new ComboBoxItem("premiere_blue"));

        ComboBox1Container.Controls.Add(ComboBox1);
    }

    protected void ComboBox1_SelectedIndexChanged(object sender, ComboBoxItemEventArgs e)
    {
        ComboBox1.FolderStyle = "styles/" + e.Item.Value;
    }
}
