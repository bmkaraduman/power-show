using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_aspnet_validation_compare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_Inserting(object sender, EventArgs e)
    {
        SuperForm1.Visible = false;
        MessagePanel.Visible = true;
    }
}
