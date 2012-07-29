using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;
using System.Data;
using System.Data.OleDb;


public partial class ComboBox_cs_icons_columns : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(200);
        ComboBox1.MenuWidth = Unit.Pixel(450);
        ComboBox1.ShowSelectedImage = true;
        ComboBox1.AllowEdit = false;
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "ControlName";
        ComboBox1.DataValueField = "ControlID";

        ComboBox1.ItemDataBound += ComboBox1_ItemDataBound;

        ComboBox1Container.Controls.Add(ComboBox1);
    }

    protected void ComboBox1_ItemDataBound(object sender, ComboBoxItemEventArgs e)
    {
        e.Item.ImageUrl = "resources/images/products/" + DataBinder.Eval(e.Item.DataItem, "ImageName");
    }
}
