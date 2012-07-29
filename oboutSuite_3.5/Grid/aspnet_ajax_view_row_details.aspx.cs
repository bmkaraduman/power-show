using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Interface;
using System.Collections;
using System.Text;


public partial class Grid_aspnet_view_row_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ViewDetail(object sender, CommandEventArgs e)
    {
        int rowIndex = int.Parse(e.CommandArgument.ToString());

        Hashtable dataItem = grid1.Rows[rowIndex].ToHashtable() as Hashtable;

        string detailsText = "<br />";

        detailsText += "The clicked row contains this information:<br />";
        detailsText += "<b>Order ID:</b> " + dataItem["OrderID"].ToString() + "<br />";
        detailsText += "<b>Name:</b> " + dataItem["ShipName"].ToString() + "<br />";
        detailsText += "<b>City:</b> " + dataItem["ShipCity"].ToString() + "<br />";
        detailsText += "<b>Postal Code:</b> " + dataItem["ShipPostalCode"].ToString() + "<br />";
        detailsText += "<b>Country:</b> " + dataItem["ShipCountry"].ToString() + "<br />";

        Details.Text = detailsText;
    }
}
