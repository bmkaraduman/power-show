using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_master_detail_autowidth : System.Web.UI.Page
{
    Grid grid1 = new Grid();
    DetailGrid grid2 = new DetailGrid();
    DetailGrid grid3 = new DetailGrid();

    protected void Page_Load(object sender, EventArgs e)
    {
        // Creating grid1
        grid1.ID = "Grid1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "sds1";
        grid1.Width = Unit.Percentage(100);
        grid1.AllowPaging = false;
        grid1.FolderStyle = "styles/black_glass";	

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "CustomerID";
        oCol1.HeaderText = "CUSTOMER ID";
        oCol1.Visible = true;
        oCol1.Width = "25%";

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "45%";

        Column oCol3 = new Column();
        oCol3.DataField = "Country";
        oCol3.HeaderText = "COUNTRY";
        oCol3.Width = "30%";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);

        // Creating grid2
        grid2.ID = "Grid2";
        grid2.AutoGenerateColumns = false;
        grid2.AllowAddingRecords = false;
        grid2.Width = Unit.Percentage(95);
        grid2.AllowPageSizeSelection = false;
        grid2.DataSourceID = "sds2";
        grid2.ForeignKeys = "CustomerID";
        grid2.AllowPaging = false;
        grid2.FolderStyle = "styles/black_glass";	

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;

        // creating the columns
        Column oCol2_1 = new Column();
        oCol2_1.DataField = "CustomerID";
        oCol2_1.HeaderText = "CUSTOMER ID";
        oCol2_1.Visible = false;
        oCol2_1.Width = "0%";

        Column oCol2_2 = new Column();
        oCol2_2.DataField = "OrderID";
        oCol2_2.HeaderText = "ORDER ID";
        oCol2_2.Visible = false;
        oCol2_2.Width = "0%";

        Column oCol2_3 = new Column();
        oCol2_3.DataField = "OrderDate";
        oCol2_3.HeaderText = "ORDER DATE";
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}";
        oCol2_3.Width = "35%";

        Column oCol2_4 = new Column();
        oCol2_4.DataField = "ShippedDate";
        oCol2_4.HeaderText = "SHIPPED DATE";
        oCol2_4.DataFormatString = "{0:MM/dd/yyyy}";
        oCol2_4.Width = "33%";

        Column oCol2_5 = new Column();
        oCol2_5.DataField = "Freight";
        oCol2_5.HeaderText = "FREIGHT";
        oCol2_5.DataFormatString = "{0:C2}";
        oCol2_5.Width = "32%";

        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1); 
        grid2.Columns.Add(oCol2_2);
        grid2.Columns.Add(oCol2_3);
        grid2.Columns.Add(oCol2_4);
        grid2.Columns.Add(oCol2_5);

        // Creating grid3
        grid3.ID = "Grid3";
        grid3.AutoGenerateColumns = false;
        grid3.AllowAddingRecords = false;
        grid3.AllowPageSizeSelection = false;
        grid3.DataSourceID = "sds3";
        grid3.ForeignKeys = "OrderID";
        grid3.AllowPaging = false;
        grid3.Width = Unit.Percentage(95);
        grid3.FolderStyle = "styles/black_glass";	

        // creating the columns
        Column oCol3_1 = new Column();
        oCol3_1.DataField = "OrderID";
        oCol3_1.HeaderText = "ORDER ID";
        oCol3_1.Visible = false;
        oCol3_1.ReadOnly = true;
        oCol3_1.Width = "0%";

        Column oCol3_2 = new Column();
        oCol3_2.DataField = "UnitPrice";
        oCol3_2.HeaderText = "UNIT PRICE";
        oCol3_2.DataFormatString = "{0:C2}";
        oCol3_2.Width = "35%";

        Column oCol3_3 = new Column();
        oCol3_3.DataField = "Quantity";
        oCol3_3.HeaderText = "QUANTITY";
        oCol3_3.Width = "33%";

        Column oCol3_4 = new Column();
        oCol3_4.DataField = "Discount";
        oCol3_4.HeaderText = "DISCOUNT";
        oCol3_4.DataFormatString = "{0:F2}";
        oCol3_4.Width = "32%";

        // add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1);
        grid3.Columns.Add(oCol3_2);
        grid3.Columns.Add(oCol3_3);
        grid3.Columns.Add(oCol3_4);

        grid2.DetailGrids.Add(grid3);
        grid1.DetailGrids.Add(grid2);


        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
    }

}