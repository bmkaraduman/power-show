using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using Obout.ListBox;
using System.Text;

public partial class ListBox_aspnet_icons_columns : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ListBox1_ItemDataBound(object sender, ListBoxItemEventArgs e)
    {
        e.Item.ImageUrl = "resources/images/products/" + DataBinder.Eval(e.Item.DataItem, "ImageName");
    }
}