using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_style_gallery : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox(); 
        ListBox1.ID = "ListBox1";
        ListBox1.AutoPostBack = true;

        ListBox1.SelectedIndexChanged += ListBox1_SelectedIndexChanged;

        ListBox1.Items.Add(new ListBoxItem("black_glass"));
        ListBox1.Items.Add(new ListBoxItem("grand_gray"));
        ListBox1.Items.Add(new ListBoxItem("plain"));
        ListBox1.Items.Add(new ListBoxItem("premiere_blue"));
        ListBox1Container.Controls.Add(ListBox1);
 
    }

    protected void ListBox1_SelectedIndexChanged(object sender, ListBoxItemEventArgs e)
    {
        ListBox1.FolderStyle = "styles/" + e.Item.Value;
    }
}
