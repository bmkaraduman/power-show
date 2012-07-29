using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;

public partial class SuperForm_aspnet_layout_direction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SetDirection(object sender, EventArgs e)
    {
        if (VerticalDirection.Checked)
        {
            SuperForm1.Direction = Direction.Vertical;
            SuperForm1.Width = Unit.Pixel(350);
        }
        else if (HorizontalDirection.Checked)
        {
            SuperForm1.Direction = Direction.Horizontal;
            SuperForm1.Width = Unit.Pixel(630);
        }

        SuperForm1.DataBind();
    }
}
