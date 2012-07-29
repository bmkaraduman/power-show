using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_different_styles : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    private ComboBox ComboBox2;
    private ComboBox ComboBox3;

    protected void Page_Load(object sender, EventArgs e)
    { 
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(250);
        ComboBox1.EmptyText = "Select a customer ...";
        ComboBox1.DataSourceID = "sds1"; 
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";
        ComboBox1.FolderStyle = "styles/black_glass";

        ComboBoxContainer1.Controls.Add(ComboBox1);

        ComboBox2 = new ComboBox();
        ComboBox2.ID = "ComboBox2";
        ComboBox2.Width = Unit.Pixel(250);
        ComboBox2.EmptyText = "Select a customer ...";
        ComboBox2.DataSourceID = "sds1";
        ComboBox2.DataTextField = "CompanyName";
        ComboBox2.DataValueField = "CustomerID";
        ComboBox2.FolderStyle = "_";

        ComboBoxContainer2.Controls.Add(ComboBox2);

        ComboBox3 = new ComboBox();
        ComboBox3.ID = "ComboBox3";
        ComboBox3.Width = Unit.Pixel(250);
        ComboBox3.EmptyText = "Select a customer ...";
        ComboBox3.DataSourceID = "sds1";
        ComboBox3.DataTextField = "CompanyName";
        ComboBox3.DataValueField = "CustomerID";
        ComboBox3.FolderStyle = "_";
  
        ComboBoxContainer3.Controls.Add(ComboBox3);
    }

}
