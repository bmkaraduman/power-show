using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class SuperForm_aspnet_live_styles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void ListBox1_SelectedIndexChanged(object sender, ListBoxItemEventArgs e)
    {
        SuperForm1.FolderStyle = "styles/" + e.Item.Value;
        SuperForm1.InterfaceFolderStyle = "../Interface/styles/" + e.Item.Value;
        SuperForm1.DataBind();
    }
}
