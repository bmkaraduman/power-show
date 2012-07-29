using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_icons_items : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    private ComboBox ComboBox2;

    protected void Page_Load(object sender, EventArgs e)
    { 
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(175);
        ComboBox1.ShowSelectedImage = false;
        ComboBox1.SelectedIndex = 2; 

        ComboBoxItem item1 = new ComboBoxItem();
        item1.Text = "USA";
        item1.Value = "1";
        item1.ImageUrl = "resources/Images/flags/flag_usa.png";
        ComboBox1.Items.Add(item1);

        ComboBoxItem item2 = new ComboBoxItem();
        item2.Text = "UK";
        item2.Value ="2";
        item2.ImageUrl = "resources/Images/flags/flag_england.png";
        ComboBox1.Items.Add(item2);

        ComboBoxItem item3 = new ComboBoxItem();
        item3.Text = "Germany";
        item3.Value = "3";
        item3.ImageUrl = "resources/Images/flags/flag_germany.png";
        ComboBox1.Items.Add(item3);

        ComboBoxItem item4 = new ComboBoxItem();
        item4.Text = "France";
        item4.Value = "4";
        item4.ImageUrl = "resources/Images/flags/flag_france.png";
        ComboBox1.Items.Add(item4);
        ComboBoxItem item5 = new ComboBoxItem();
        item5.Text = "Russia";
        item5.Value = "5";
        item5.ImageUrl = "resources/Images/flags/flag_russia.png";
        ComboBox1.Items.Add(item5);

        ComboBoxItem item6 = new ComboBoxItem();
        item6.Text = "India";
        item6.Value = "6";
        item6.ImageUrl = "resources/Images/flags/flag_india.png";
        ComboBox1.Items.Add(item6);

        ComboBoxItem item7 = new ComboBoxItem();
        item7.Text = "Japan";
        item7.Value = "7";
        item7.ImageUrl = "resources/Images/flags/flag_japan.png";
        ComboBox1.Items.Add(item7);

        ComboBoxItem item8 = new ComboBoxItem();
        item8.Text = "China";
        item8.Value = "8";
        item8.ImageUrl = "resources/Images/flags/flag_china.png";
        ComboBox1.Items.Add(item8);


        ComboBox1Container.Controls.Add(ComboBox1);

       
        ComboBox2 = new ComboBox();
        ComboBox2.ID = "ComboBox2";
        ComboBox2.Width = Unit.Pixel(175);
        ComboBox2.ShowSelectedImage = true;
        ComboBox2.SelectedIndex = 5;

        ComboBoxItem item9 = new ComboBoxItem();
        item9.Text = "USA";
        item9.Value = "9";
        item9.ImageUrl = "resources/Images/flags/flag_usa.png";
        ComboBox2.Items.Add(item9);

        ComboBoxItem item10 = new ComboBoxItem();
        item10.Text = "UK";
        item10.Value = "10";
        item10.ImageUrl = "resources/Images/flags/flag_england.png";
        ComboBox2.Items.Add(item10);

        ComboBoxItem item11 = new ComboBoxItem();
        item11.Text = "Germany";
        item11.Value = "11";
        item11.ImageUrl = "resources/Images/flags/flag_germany.png";
        ComboBox2.Items.Add(item11);

        ComboBoxItem item12 = new ComboBoxItem();
        item12.Text = "France";
        item12.Value = "12";
        item12.ImageUrl = "resources/Images/flags/flag_france.png";
        ComboBox2.Items.Add(item12);

        ComboBoxItem item13 = new ComboBoxItem();
        item13.Text = "Russia";
        item13.Value = "13";
        item13.ImageUrl = "resources/Images/flags/flag_russia.png";
        ComboBox2.Items.Add(item13);

        ComboBoxItem item14 = new ComboBoxItem();
        item14.Text = "India";
        item14.Value = "14";
        item14.ImageUrl = "resources/Images/flags/flag_india.png";
        ComboBox2.Items.Add(item14);

        ComboBoxItem item15 = new ComboBoxItem();
        item15.Text = "Japan";
        item15.Value = "15";
        item15.ImageUrl = "resources/Images/flags/flag_japan.png";
        ComboBox2.Items.Add(item15);

        ComboBoxItem item16 = new ComboBoxItem();
        item16.Text = "China";
        item16.Value = "16";
        item16.ImageUrl = "resources/Images/flags/flag_china.png";
        ComboBox2.Items.Add(item16);

        ComboBox2Container.Controls.Add(ComboBox2);
    }

   
}
