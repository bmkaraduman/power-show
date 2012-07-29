using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_aspnet_mask_masks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_ItemInserted(object sender, EventArgs e)
    {
        SuperForm1.DefaultMode = DetailsViewMode.ReadOnly;
    }

    protected void SuperForm1_ItemCommand(object sender, EventArgs e)
    {
        SuperForm1.DefaultMode = DetailsViewMode.ReadOnly;
    }
}
