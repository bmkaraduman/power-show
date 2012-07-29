using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_sorting_allow_columns : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Grid1.Columns[0].AllowSorting = chkAllowSortingShipCountry.Checked;
        Grid1.Columns[1].AllowSorting = chkAllowSortingShipCity.Checked;
        Grid1.Columns[2].AllowSorting = chkAllowSortingShipName.Checked;
        Grid1.Columns[3].AllowSorting = cbkAllowSortingOrderID.Checked;     
    }
}