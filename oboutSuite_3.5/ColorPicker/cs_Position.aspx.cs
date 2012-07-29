using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ColorPicker_cs_Position : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void color_postback(object sender, Obout.Ajax.UI.ColorPicker.ColorPostBackEventArgs e)
    {
        textbox.Style[HtmlTextWriterStyle.BackgroundColor] = e.Color;
    }
}
