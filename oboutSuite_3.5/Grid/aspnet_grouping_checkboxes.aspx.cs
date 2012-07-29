using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_grouping_checkboxes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string groupBy = "";

        if (ChkGroupByCountry.Checked)
        {
            groupBy += "ShipCountry";
        }

        if (ChkGroupByCity.Checked)
        {
            if (groupBy != String.Empty)
            {
                groupBy += ",";
            }
            
            groupBy += "ShipCity";
        }

        Grid1.GroupBy = groupBy;
    }
}