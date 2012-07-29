using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_aspnet_apiserver_tooltips : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ComboBox1_ItemDataBound(object sender, ComboBoxItemEventArgs e)
    {
        e.Item.ToolTip = e.Item.Text;
    }
}
