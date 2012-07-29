using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Interface_user_controls_TextBox : System.Web.UI.UserControl
{
    public string Text
    {
        get
        {
            return OboutTextBox1.Text;
        }
        set
        {
            OboutTextBox1.Text = value;
        }
    }

    public Unit Width
    {
        get
        {
            return OboutTextBox1.Width;
        }
        set
        {
            OboutTextBox1.Width = value;
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
