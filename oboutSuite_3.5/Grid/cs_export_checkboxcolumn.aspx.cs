using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;
using System.Collections;


public partial class Grid_cs_export_checkboxcolumn : System.Web.UI.Page
{
    Grid Grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        Grid1.ID = "Grid1";
        Grid1.DataSourceID = "SqlDataSource1";
        Grid1.AutoGenerateColumns = false;
        Grid1.AllowAddingRecords = false;
        Grid1.Serialize = false;
        Grid1.AllowColumnReordering = true;
        Grid1.RowExported += Grid1_RowExported;
        Grid1.ExportingSettings.ExportHiddenColumns = true;

        // creating the columns
       
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.HeaderText = "ORDER ID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "125";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "125";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "125";

        CheckBoxColumn oCol6 = new CheckBoxColumn();
        oCol6.DataField = "Sent";
        oCol6.HeaderText = "SENT";
        oCol6.Width = "95";
        oCol6.ShowHeader = true;
               
        // add the columns to the Columns collection of the grid
        Grid1.Columns.Add(oCol1);
        Grid1.Columns.Add(oCol2);
        Grid1.Columns.Add(oCol3);
        Grid1.Columns.Add(oCol4);
        Grid1.Columns.Add(oCol5);
        Grid1.Columns.Add(oCol6);


        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(Grid1);


    }

    protected void Grid1_RowExported(object sender, GridRowExportEventArgs e)
    {
        if (e.SourceRow.RowType == GridRowType.DataRow)
        {
            e.Row.Cells[5].Text = e.SourceRow.Cells[5].Text.ToLower() == "true" ? "yes" : "no";
        }
    }    
}