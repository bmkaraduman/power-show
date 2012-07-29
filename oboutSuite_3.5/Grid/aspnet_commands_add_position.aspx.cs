using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_commands_add_position : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (AddLinksPosition_Bottom.Checked)
        {
            Grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.Bottom;
        }
        else if (AddLinksPosition_Top.Checked)
        {
            Grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.Top;
        }
        else
        {
            Grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.TopAndBottom;
        }

        if (NewRecordPosition_Bottom.Checked)
        {
            Grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Bottom;
        }
        else if (NewRecordPosition_Top.Checked)
        {
            Grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Top;
        }
        else
        {
            Grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Dynamic;
        }
    }
}