using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_master_detail_show_empty_callback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Grid1.MasterDetailSettings.ShowEmptyDetails = ChkShowEmptyDetails.Checked;
        Grid2.MasterDetailSettings.ShowEmptyDetails = ChkShowEmptyDetails.Checked;
    }
}