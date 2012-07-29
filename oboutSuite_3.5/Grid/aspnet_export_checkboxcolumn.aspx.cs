using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_export_checkboxcolumn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Grid1_RowExported(object sender, GridRowExportEventArgs e)
    {
        if (e.SourceRow.RowType == GridRowType.DataRow)
        {
            e.Row.Cells[5].Text = bool.Parse(e.SourceRow.Cells[5].Text.ToLower()) ? "yes" : "no";
        }
    }    
}