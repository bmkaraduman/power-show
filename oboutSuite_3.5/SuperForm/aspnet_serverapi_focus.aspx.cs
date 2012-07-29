using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;

public partial class SuperForm_aspnet_serverapi_focus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode == DetailsViewMode.Edit || SuperForm1.CurrentMode == DetailsViewMode.Insert)
        {
            ((OboutTextBox)SuperForm1.Rows[1].Cells[1].Controls[0].Controls[0]).Focus();
        }
    }
}
