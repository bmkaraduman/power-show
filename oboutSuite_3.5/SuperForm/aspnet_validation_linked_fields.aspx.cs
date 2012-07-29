using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;

public partial class SuperForm_aspnet_validation_linked_fields : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode != DetailsViewMode.ReadOnly)
        {
            OboutCheckBox discontinuedChk = SuperForm1.GetFieldControl(2) as OboutCheckBox;

            discontinuedChk.ClientSideEvents.OnCheckedChanged = "Discontinued_CheckedChanged";
        }
    }
}
