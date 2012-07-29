using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_master_detail_full_declarative : System.Web.UI.Page
{
    Grid grid1 = new Grid();
    DetailGrid grid2 = new DetailGrid();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        // Creating grid1
        grid1.ID = "grid1";
        grid1.AutoGenerateColumns = false;
        grid1.PageSize = 5;
        grid1.DataSourceID = "sds1";
        grid1.FolderStyle = "styles/black_glass";
        grid1.AllowAddingRecords = true;

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;  
       
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "CustomerID";
        oCol1.HeaderText = "CUSTOMER ID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";

        Column oCol3 = new Column();
        oCol3.DataField = "ContactName";
        oCol3.HeaderText = "CONTACT NAME";

        Column oCol4 = new Column();
        oCol4.DataField = "Country";
        oCol4.HeaderText = "COUNTRY";

        Column oCol5 = new Column();
        oCol5.DataField = "";
        oCol5.AllowEdit = true;
        oCol5.AllowDelete = true;

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // Creating grid2
        grid2.ID = "grid2";
        grid2.AutoGenerateColumns = false;
        grid2.FolderStyle = "styles/black_glass";
        grid2.AllowAddingRecords = true;
        grid2.ShowFooter = true;
        grid2.AllowPageSizeSelection = false;
        grid2.DataSourceID = "sds2";
        grid2.ForeignKeys = "CustomerID";
        grid2.PageSize = 5;

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;

        grid2.ClientSideEvents.ExposeSender = true;
        grid2.ClientSideEvents.OnClientPopulateControls = "onPopulateControls";


        // creating the columns
        Column oCol2_1 = new Column();
        oCol2_1.DataField = "CustomerID";
        oCol2_1.HeaderText = "CUSTOMER ID";
        oCol2_1.Visible = false;
        oCol2_1.ReadOnly = true;

        Column oCol2_2 = new Column();
        oCol2_2.DataField = "OrderID";
        oCol2_2.HeaderText = "ORDER ID";
        oCol2_2.Visible = false;
        oCol2_1.ReadOnly = true;

        Column oCol2_3 = new Column();
        oCol2_3.DataField = "ShipName";
        oCol2_3.HeaderText = "SHIP NAME";
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}";

        Column oCol2_4 = new Column();
        oCol2_4.DataField = "ShipCity";
        oCol2_4.HeaderText = "SHIP CITY";

        Column oCol2_5 = new Column();
        oCol2_5.DataField = "ShipCountry";
        oCol2_5.HeaderText = "SHIP COUNTRY";
        oCol2_5.DataFormatString = "{0:C2}";

        Column oCol2_6 = new Column();
        oCol2_6.DataField = "";
        oCol2_6.AllowEdit = true;
        oCol2_6.AllowDelete = true;
        oCol2_6.Width = "170";

        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1);
        grid2.Columns.Add(oCol2_2);
        grid2.Columns.Add(oCol2_3);
        grid2.Columns.Add(oCol2_4);
        grid2.Columns.Add(oCol2_5);
        grid2.Columns.Add(oCol2_6);

        grid1.DetailGrids.Add(grid2);


        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
    }
}