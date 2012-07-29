using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_export_multiple : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Grid1_Exporting(object sender, GridExportEventArgs e)
    {
        AddTitleRow(e.Table, "CUSTOMERS");
    }

    protected void Grid1_Exported(object sender, GridExportEventArgs e)
    {
        AddGridToExportedFile(Grid2, e.Table, "ORDERS");
        AddGridToExportedFile(Grid3, e.Table, "PRODUCTS");
    }

    protected void AddTitleRow(Table table, string title)
    {
        TableRow titleRow = new TableRow();
        table.Rows.Add(titleRow);

        TableCell titleCell = new TableCell();
        titleRow.Cells.Add(titleCell);
        titleCell.ColumnSpan = 4;
        titleCell.Text = "<b>" + title + "</b>";
    }

    protected void AddGridToExportedFile(Grid grid, Table table, string title)
    {
        TableRow spacerRow = new TableRow();
        table.Rows.Add(spacerRow);

        AddTitleRow(table, title);

        TableRow headerRow = new TableRow();

        foreach (Column column in grid.Columns)
        {
            if (column.Visible)
            {
                TableCell headerCell = new TableCell();
                headerCell.Text = column.HeaderText;
                headerRow.Cells.Add(headerCell);
            }
        }

        table.Rows.Add(headerRow);

        foreach (GridRow dataRow in grid.Rows)
        {
            TableRow newRow = new TableRow();

            int columnIndex = 0;
            foreach (GridDataControlFieldCell dataCell in dataRow.Cells)
            {
                if (grid.Columns[columnIndex].Visible)
                {
                    TableCell newCell = new TableCell();
                    newCell.Text = dataCell.Text;
                    newRow.Cells.Add(newCell);
                }

                columnIndex++;
            }

            table.Rows.Add(newRow);
        }
    }
}