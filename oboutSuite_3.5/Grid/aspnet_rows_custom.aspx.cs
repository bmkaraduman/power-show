using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_rows_custom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }	
    protected void OnGridRowCreated(object sender, GridRowEventArgs args)
    {
        // modify the row structure here
    }
    protected void OnGridRowDataBound(object sender, GridRowEventArgs args)
    {
        args.Row.Cells[0].ForeColor = System.Drawing.Color.Red;
        args.Row.Cells[0].BackColor = System.Drawing.Color.LightGray;

        if (args.Row.Cells[4].Text == "USA" || args.Row.Cells[4].Text == "Denmark" || args.Row.Cells[4].Text == "Germany")
        {
            for (int i = 1; i < args.Row.Cells.Count; i++)
            {
                args.Row.Cells[i].BackColor = System.Drawing.Color.DarkGray;
            }
        }
            
    }
}