using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_columns_reordering : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "styles/black_glass";
        grid1.AllowAddingRecords = false;
       
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "SHIP NAME";
      
        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "SHIP CITY";
          
        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        
        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "SHIP COUNTRY";

        Column oCol6 = new Column();
        oCol6.AllowEdit = true;
        oCol6.AllowDelete = true;
      
        grid1.PagingSettings.Position = GridElementPosition.TopAndBottom;
        grid1.PagingSettings.PageSizeSelectorPosition = GridElementPosition.TopAndBottom;
           
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        if (PageSizeSelectorPosition_Top.Checked)
        {
            grid1.PagingSettings.PageSizeSelectorPosition = GridElementPosition.Top;
        }
        else if (PageSizeSelectorPosition_Bottom.Checked)
        {
            grid1.PagingSettings.PageSizeSelectorPosition = GridElementPosition.Bottom;
        }
        else
        {
            grid1.PagingSettings.PageSizeSelectorPosition = GridElementPosition.TopAndBottom;
        }

        if (PagingButtonsPosition_Top.Checked)
        {
            grid1.PagingSettings.Position = GridElementPosition.Top;
        }
        else if (PagingButtonsPosition_Bottom.Checked)
        {
            grid1.PagingSettings.Position = GridElementPosition.Bottom;
        }
        else
        {
            grid1.PagingSettings.Position = GridElementPosition.TopAndBottom;
        }
    }
}