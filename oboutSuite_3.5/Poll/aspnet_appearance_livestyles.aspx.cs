using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Poll_aspnet_appearance_livestyles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Poll1.StyleFile = "~/App_Obout/Poll/styles/" + ListBox1.SelectedValue + "/style.css";
        }
    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {        
        Poll1.InterfaceStyleFolder = "~/Interface/styles/" + ListBox1.SelectedValue;
    }
}