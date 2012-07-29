using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_aspnet_validation_custom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ValidateTitle(object sender, ServerValidateEventArgs e)
    {
        if (e.Value != "Mr." && e.Value != "Ms." && e.Value != "Mrs." && e.Value != "Dr.")
        {
            e.IsValid = false;
            return;
        }
        
        e.IsValid = true;
    }
}
