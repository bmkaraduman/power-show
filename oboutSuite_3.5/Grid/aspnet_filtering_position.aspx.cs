using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_filtering_position : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (NewFilterRow_PositionTop.Checked)
        {
            Grid1.FilteringSettings.FilterPosition = GridFilterPosition.Top;
        }
        else if (NewFilterRow_PositionBottom.Checked)
        {
            Grid1.FilteringSettings.FilterPosition = GridFilterPosition.Bottom;
        }
 
        if (PositionTop.Checked)
        {
            Grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.Top;
        }
        else if (PositionBottom.Checked)
        {
            Grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.Bottom;
        }
        else
        {
            Grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.TopAndBottom;
        }
    }
}