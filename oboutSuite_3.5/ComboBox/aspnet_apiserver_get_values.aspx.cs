using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_aspnet_apiserver_get_values : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ComboBox1_SelectedIndexChanged(object sender, ComboBoxItemEventArgs  e)
    {
        Literal container1 = e.Item.FindControl("Container1") as Literal;
        Literal container2 = e.Item.FindControl("Container2") as Literal;
        Literal container3 = e.Item.FindControl("Container3") as Literal;
  
        string details = "<br /><br />";

        details += "<b>Order ID</b>: " + container1.Text;
        details += "<br />";
        details += "<b>Company Name</b>: " + container2.Text;
        details += "<br />";
        details += "<b>City</b>: " + container3.Text;

        Details.Text = details;
    }
}
