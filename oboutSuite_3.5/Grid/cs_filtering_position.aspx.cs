using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_filtering_position : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.FolderStyle = "styles/black_glass";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.Serialize = false;
        grid1.AllowFiltering = true;
        grid1.AllowPageSizeSelection = false;

        grid1.PagingSettings.Position = GridElementPosition.TopAndBottom;
        grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.TopAndBottom;
        grid1.FilteringSettings.FilterPosition = GridFilterPosition.Bottom;
        grid1.FilteringSettings.InitialState = GridFilterState.Visible;
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipCountry";
        oCol2.HeaderText = "SHIP COUNTRY";
        oCol2.Width = "180";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "SHIP CITY";
        oCol3.Width = "180";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "180";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipName";
        oCol5.HeaderText = "SHIP NAME";
        oCol5.Width = "200";
               
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        if (NewFilterRow_PositionTop.Checked)
        {
            grid1.FilteringSettings.FilterPosition = GridFilterPosition.Top;
        }
        else if (NewFilterRow_PositionBottom.Checked)
        {
            grid1.FilteringSettings.FilterPosition = GridFilterPosition.Bottom;
        }

        if (PositionTop.Checked)
        {
            grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.Top;
        }
        else if (PositionBottom.Checked)
        {
            grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.Bottom;
        }
        else
        {
            grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.TopAndBottom;
        }
    }
}