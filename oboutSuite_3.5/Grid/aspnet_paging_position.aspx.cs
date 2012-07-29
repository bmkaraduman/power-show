using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_paging_position : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PageSizeSelectorPosition_Top.Checked)
        {
            Grid1.PagingSettings.PageSizeSelectorPosition = GridElementPosition.Top;
        }
        else if (PageSizeSelectorPosition_Bottom.Checked)
        {
            Grid1.PagingSettings.PageSizeSelectorPosition = GridElementPosition.Bottom;
        }
        else
        {
            Grid1.PagingSettings.PageSizeSelectorPosition = GridElementPosition.TopAndBottom;
        }

        if (PagingButtonsPosition_Top.Checked)
        {
            Grid1.PagingSettings.Position = GridElementPosition.Top;
        }
        else if (PagingButtonsPosition_Bottom.Checked)
        {
            Grid1.PagingSettings.Position = GridElementPosition.Bottom;
        }
        else
        {
            Grid1.PagingSettings.Position = GridElementPosition.TopAndBottom;
        }
    }
}