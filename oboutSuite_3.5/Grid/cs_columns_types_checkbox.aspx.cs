using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_columns_type_checkbox : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowColumnReordering = true;
        grid1.AllowAddingRecords = true;
        grid1.Serialize = false;
       
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

        CheckBoxColumn oCol6 = new CheckBoxColumn();
        oCol6.DataField = "Sent";
        oCol6.HeaderText = "SENT";
        oCol6.Width = "75";
        oCol6.ShowHeader = true; 

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


        ((CheckBoxColumn)grid1.Columns[5]).ControlType = RbtnStandard.Checked ? GridControlType.Standard : GridControlType.Obout;
    }
}