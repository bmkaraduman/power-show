using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;
using System.Data;
using System.Data.OleDb;

public partial class ListBox_cs_populate_declarative : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {

        ListBox1 = new Obout.ListBox.ListBox(); 
        ListBox1.ID = "ListBox1";

        ListBoxItem item1 = new ListBoxItem();
        item1.Text = "Item 1";
        item1.Value = "1";
        ListBox1.Items.Add(item1);

        ListBoxItem item2 = new ListBoxItem();
        item2.Text = "Item 2";
        item2.Value = "2";
        ListBox1.Items.Add(item2);

        ListBoxItem item3 = new ListBoxItem();
        item3.Text = "Item 3";
        item3.Value = "3";
        ListBox1.Items.Add(item3);

        ListBoxItem item4 = new ListBoxItem();
        item4.Text = "Item 4";
        item4.Value = "4";
        ListBox1.Items.Add(item4);

        ListBoxItem item5 = new ListBoxItem();
        item5.Text = "Item 5";
        item5.Value = "5";
        ListBox1.Items.Add(item5);

        ListBox1Container.Controls.Add(ListBox1);

    }

    
}
