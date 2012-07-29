using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;
using System.Data;
using System.Data.OleDb;

public partial class ListBox_cs_icons_items : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {

        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(175);
        ListBox1.SelectedIndex = 2;

        ListBoxItem item1 = new ListBoxItem();
        item1.Text = "USA";
        item1.Value = "1";
        item1.ImageUrl = "resources/Images/flags/flag_usa.png";
        ListBox1.Items.Add(item1);

        ListBoxItem item2 = new ListBoxItem();
        item2.Text = "UK";
        item2.Value ="2";
        item2.ImageUrl = "resources/Images/flags/flag_england.png";
        ListBox1.Items.Add(item2);

        ListBoxItem item3 = new ListBoxItem();
        item3.Text = "Germany";
        item3.Value = "3";
        item3.ImageUrl = "resources/Images/flags/flag_germany.png";
        ListBox1.Items.Add(item3);

        ListBoxItem item4 = new ListBoxItem();
        item4.Text = "France";
        item4.Value = "4";
        item4.ImageUrl = "resources/Images/flags/flag_france.png";
        ListBox1.Items.Add(item4);

        ListBoxItem item5 = new ListBoxItem();
        item5.Text = "Russia";
        item5.Value = "5";
        item5.ImageUrl = "resources/Images/flags/flag_russia.png";
        ListBox1.Items.Add(item5);

        ListBoxItem item6 = new ListBoxItem();
        item6.Text = "India";
        item6.Value = "6";
        item6.ImageUrl = "resources/Images/flags/flag_india.png";
        ListBox1.Items.Add(item6);

        ListBoxItem item7 = new ListBoxItem();
        item7.Text = "Japan";
        item7.Value = "7";
        item7.ImageUrl = "resources/Images/flags/flag_japan.png";
        ListBox1.Items.Add(item7);

        ListBoxItem item8 = new ListBoxItem();
        item8.Text = "China";
        item8.Value = "8";
        item8.ImageUrl = "resources/Images/flags/flag_china.png";
        ListBox1.Items.Add(item8);

        ListBox1Container.Controls.Add(ListBox1);
    }
}
