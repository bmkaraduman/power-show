using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_export_column_sets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void Grid1_Exporting(object sender, GridExportEventArgs e)
    {
        TableRow columnSetsRow = new TableRow();
        e.Table.Rows.Add(columnSetsRow);

        TableCell contactInfoSet = new TableCell();        
        columnSetsRow.Cells.Add(contactInfoSet);
        contactInfoSet.ColumnSpan = 3;
        contactInfoSet.Text = "<b>CONTACT INFORMATION</b>";

        TableCell orderInfoSet = new TableCell();        
        columnSetsRow.Cells.Add(orderInfoSet);
        orderInfoSet.ColumnSpan = 2;
        orderInfoSet.Text = "<b>ORDER INFORMATION</b>";
    }
}