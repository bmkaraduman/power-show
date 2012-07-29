using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_rows_custom : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;

        grid1.DataSourceID = "sds1";
        grid1.EmbedFilterInSortExpression = true;

        grid1.FolderStyle = "styles/grand_gray";
        grid1.FolderLocalization = "localization";
        grid1.AllowFiltering = true;

        // setting the event handlers
        grid1.RowCreated += new Obout.Grid.GridRowEventHandler(OnGridRowCreated);
        grid1.RowDataBound += new Obout.Grid.GridRowEventHandler(OnGridRowDataBound);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "200";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "150";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "150";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "150";



        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
		
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