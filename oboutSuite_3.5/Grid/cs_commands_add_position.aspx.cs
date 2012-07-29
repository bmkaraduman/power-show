using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_commands_add_position : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.FolderStyle = "styles/black_glass";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = true;
        grid1.Serialize = false;

        grid1.PagingSettings.Position = GridElementPosition.TopAndBottom;
        grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.TopAndBottom;
        grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Dynamic;

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipCountry";
        oCol2.HeaderText = "SHIP COUNTRY";
        oCol2.Width = "150";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "SHIP CITY";
        oCol3.Width = "150";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "150";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipName";
        oCol5.HeaderText = "SHIP NAME";
        oCol5.Width = "150";

        Column oCol6 = new Column();
        oCol6.Width = "150";
        oCol6.AllowDelete = true;
        oCol6.AllowEdit = true;

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        if (AddLinksPosition_Bottom.Checked)
        {
            grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.Bottom;
        }
        else if (AddLinksPosition_Top.Checked)
        {
            grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.Top;
        }
        else
        {
            grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.TopAndBottom;
        }

        if (NewRecordPosition_Bottom.Checked)
        {
            grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Bottom;
        }
        else if (NewRecordPosition_Top.Checked)
        {
            grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Top;
        }
        else
        {
            grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Dynamic;
        }
    }
}