using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;
using System.Data;
using System.Data.OleDb;

public partial class ListBox_cs_selection_multi : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {

        ListBox1 = new Obout.ListBox.ListBox(); 
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(400);
        ListBox1.SelectionMode = ListSelectionMode.Multiple;
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CountryName";
        ListBox1.DataValueField = "CountryID";

        ListBox1Container.Controls.Add(ListBox1);

    }
}
