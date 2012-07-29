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
        grid1.AllowColumnReordering = true;
        grid1.AllowAddingRecords = true;
       
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;

        CheckBoxSelectColumn oCol2 = new CheckBoxSelectColumn();
        oCol2.ShowHeaderCheckBox = true;
        oCol2.ControlType = GridControlType.Standard;

        Column oCol3 = new Column();
        oCol3.DataField = "ShipName";
        oCol3.HeaderText = "SHIP NAME";
      
        Column oCol4 = new Column();
        oCol4.DataField = "ShipCity";
        oCol4.HeaderText = "SHIP CITY";
          
        Column oCol5 = new Column();
        oCol5.DataField = "ShipPostalCode";
        oCol5.HeaderText = "POSTAL CODE";
        
        Column oCol6 = new Column();
        oCol6.DataField = "ShipCountry";
        oCol6.HeaderText = "SHIP COUNTRY";

        Column oCol7 = new Column();
        oCol7.AllowEdit = true;
        oCol7.AllowDelete = true;
      
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);
        grid1.Columns.Add(oCol7);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        ((CheckBoxSelectColumn)grid1.Columns[1]).ControlType = RbtnStandard.Checked ? GridControlType.Standard : GridControlType.Obout;
    }

}