using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_master_detail_show_empty_callback : System.Web.UI.Page
{
    Grid grid1 = new Grid();
    DetailGrid grid2 = new DetailGrid();
    DetailGrid grid3 = new DetailGrid();

    void Page_load(object sender, EventArgs e)
    {
        // Creating grid1
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "sds1";

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;
        grid1.MasterDetailSettings.ShowEmptyDetails = false;
        grid1.MasterDetailSettings.DetailsCountField = "HasDetails";

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "EmployeeID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "FirstName";
        oCol2.HeaderText = "FIRST NAME";
        oCol2.Width = "200";

        Column oCol3 = new Column();
        oCol3.DataField = "LastName";
        oCol3.HeaderText = "LAST NAME";

        Column oCol4 = new Column();
        oCol4.DataField = "City";
        oCol4.HeaderText = "CITY";

        Column oCol5 = new Column();
        oCol5.DataField = "Country";
        oCol5.HeaderText = "COUNTRY";

        Column oCol6 = new Column();
        oCol6.DataField = "ReportsTo";
        oCol6.Visible = false;

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);

        // Creating grid2
        grid2.ID = "grid2";
        grid2.CallbackMode = true;
        grid2.AutoGenerateColumns = false;
        grid2.FolderStyle = "styles/grand_gray";
        grid2.AllowAddingRecords = false;
        grid2.ShowFooter = true;
        grid2.AllowPageSizeSelection = false;
        grid2.AllowPaging = false;
        grid2.DataSourceID = "sds2";
        grid2.ForeignKeys = "EmployeeID";

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;
        grid2.MasterDetailSettings.ShowEmptyDetails = false;
        grid2.MasterDetailSettings.DetailsCountField = "HasDetails";

        // creating the columns
        Column oCol2_1 = new Column();
        oCol2_1.DataField = "EmployeeID";
        oCol2_1.Visible = false;

        Column oCol2_2 = new Column();
        oCol2_2.DataField = "FirstName";
        oCol2_2.HeaderText = "FIRST NAME";

        Column oCol2_3 = new Column();
        oCol2_3.DataField = "LastName";
        oCol2_3.HeaderText = "LAST NAME";

        Column oCol2_4 = new Column();
        oCol2_4.DataField = "City";
        oCol2_4.HeaderText = "CITY";

        Column oCol2_5 = new Column();
        oCol2_5.DataField = "Country";
        oCol2_5.HeaderText = "COUNTRY";

        Column oCol2_6 = new Column();
        oCol2_6.DataField = "ReportsTo";
        oCol2_6.Visible = false;

        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1);
        grid2.Columns.Add(oCol2_2);
        grid2.Columns.Add(oCol2_3);
        grid2.Columns.Add(oCol2_4);
        grid2.Columns.Add(oCol2_5);
        grid2.Columns.Add(oCol2_6);


        // Creating grid3
        grid3.ID = "grid3";
        grid3.CallbackMode = true;
        grid3.AutoGenerateColumns = false;
        grid3.FolderStyle = "styles/grand_gray";
        grid3.AllowAddingRecords = false;
        grid3.ShowFooter = true;
        grid3.AllowPageSizeSelection = false;
        grid3.AllowPaging = false;
        grid3.DataSourceID = "sds2";
        grid3.ForeignKeys = "EmployeeID";

        // creating the columns
        Column oCol3_1 = new Column();
        oCol3_1.DataField = "EmployeeID";
        oCol3_1.Visible = false;

        Column oCol3_2 = new Column();
        oCol3_2.DataField = "FirstName";
        oCol3_2.HeaderText = "FIRST NAME";

        Column oCol3_3 = new Column();
        oCol3_3.DataField = "LastName";
        oCol3_3.HeaderText = "LAST NAME";

        Column oCol3_4 = new Column();
        oCol3_4.DataField = "City";
        oCol3_4.HeaderText = "CITY";

        Column oCol3_5 = new Column();
        oCol3_5.DataField = "Country";
        oCol3_5.HeaderText = "COUNTRY";
        oCol3_5.Width = "150";

        Column oCol3_6 = new Column();
        oCol3_6.DataField = "ReportsTo";
        oCol3_6.Visible = false;

        // add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1);
        grid3.Columns.Add(oCol3_2);
        grid3.Columns.Add(oCol3_3);
        grid3.Columns.Add(oCol3_4);
        grid3.Columns.Add(oCol3_5);
        grid3.Columns.Add(oCol3_6);

        grid2.DetailGrids.Add(grid3);
        grid1.DetailGrids.Add(grid2);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        grid1.MasterDetailSettings.ShowEmptyDetails = ChkShowEmptyDetails.Checked;
        grid2.MasterDetailSettings.ShowEmptyDetails = ChkShowEmptyDetails.Checked;
    }
}