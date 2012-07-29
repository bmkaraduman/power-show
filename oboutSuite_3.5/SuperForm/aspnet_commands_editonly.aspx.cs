using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_aspnet_commands_editonly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void SuperForm1_ModeChaning(object sender, DetailsViewModeEventArgs e)
    {
        if (e.NewMode == DetailsViewMode.ReadOnly)
        {
            SuperForm1.DataBind();
        }
        e.Cancel = true;
    }
}
