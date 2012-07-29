using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_aspnet_selection_retrieve : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OboutCheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        ComboBox1.AllowEdit = OboutCheckBox1.Checked;
    }
}
