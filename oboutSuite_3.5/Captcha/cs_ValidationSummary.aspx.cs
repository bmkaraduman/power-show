using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Captcha_cs_ValidationSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Submit1_click(object sender, EventArgs e)
    {
        CaptchaIn.Text = "";
    }
}