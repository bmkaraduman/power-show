using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Interface_user_controls_Button : System.Web.UI.UserControl
{
    public string Text
    {
        get
        {
            return OboutButton1.Text;
        }
        set
        {
            OboutButton1.Text = value;
        }
    }

    public Unit Width
    {
        get
        {
            return OboutButton1.Width;
        }
        set
        {
            OboutButton1.Width = value;
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
