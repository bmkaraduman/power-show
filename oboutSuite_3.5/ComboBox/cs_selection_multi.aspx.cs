using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_selection_multi : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(400);
        ComboBox1.AllowEdit = false;
        ComboBox1.SelectionMode = ListSelectionMode.Multiple;
        ComboBox1.EmptyText = "Select multiple countries ...";
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "CountryName";
        ComboBox1.DataValueField = "CountryID";

        ComboBox1Container.Controls.Add(ComboBox1);
        
    }
}
