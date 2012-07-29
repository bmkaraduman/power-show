using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_scroll_vertical_keep : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {		
	
        if (Grid1.SelectedRecords != null)
        {
            string sText = "These are the selected records (server-side):";
            foreach (System.Collections.Hashtable oRecord in Grid1.SelectedRecords)
            {
                sText += "<br />" + oRecord["OrderID"] + " --- " + oRecord["ShipName"] + " --- " + oRecord["ShipCity"] + " --- " + oRecord["ShipCountry"];
            }

            divSelectedRecords.Text = "<br />" + sText;
        }
	}
		
}