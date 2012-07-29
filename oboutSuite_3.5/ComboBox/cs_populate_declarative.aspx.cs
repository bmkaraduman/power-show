using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_populate_declarative : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
   
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";

        ComboBoxItem item1 = new ComboBoxItem();
        item1.Text = "Item 1";
        item1.Value = "1";
        ComboBox1.Items.Add(item1);

        ComboBoxItem item2 = new ComboBoxItem();
        item2.Text = "Item 2";
        item2.Value = "2";
        ComboBox1.Items.Add(item2);

        ComboBoxItem item3 = new ComboBoxItem();
        item3.Text = "Item 3";
        item3.Value = "3";
        ComboBox1.Items.Add(item3);

        ComboBoxItem item4 = new ComboBoxItem();
        item4.Text = "Item 4";
        item4.Value = "4";
        ComboBox1.Items.Add(item4);

        ComboBoxItem item5 = new ComboBoxItem();
        item5.Text = "Item 5";
        item5.Value = "5";
        ComboBox1.Items.Add(item5);

        ComboBox1Container.Controls.Add(ComboBox1);
    }
}
