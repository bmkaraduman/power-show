using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_columns_auto_resize : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Grid1_ColumnsCreated(object sender, EventArgs e)
    {
        Grid grid = sender as Grid;

        foreach (Column column in grid.Columns)
        {
            column.TemplateSettings.TemplateId = "Template1";
            column.TemplateSettings.HeaderTemplateId = "Template1";
        }
    }
}