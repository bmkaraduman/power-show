using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;

public partial class SuperForm_aspnet_fields_passwordfield : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_Inserting(object sender, EventArgs e)
    {
        SuperForm1.Visible = false;
        MessagePanel.Visible = true;
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode != DetailsViewMode.ReadOnly)
        {
            OboutTextBox password = SuperForm1.GetFieldControl(1) as OboutTextBox;
            password.TextMode = TextBoxMode.Password;
        }
    }
}
