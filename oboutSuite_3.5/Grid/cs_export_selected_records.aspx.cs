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


public partial class Grid_cs_export_selected_records : System.Web.UI.Page
{
    Grid Grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        Grid1.ID = "Grid1";
        Grid1.DataSourceID = "sds1";
        Grid1.AutoGenerateColumns = false;
        Grid1.AllowAddingRecords = false;
        Grid1.RowExported += Grid1_RowExported;

        // creating the columns
        CheckBoxSelectColumn oCol1 = new CheckBoxSelectColumn();

        Column oCol2 = new Column();
        oCol2.DataField = "OrderID";
        oCol2.HeaderText = "ORDER ID";
        oCol2.Visible = false;
        oCol2.ReadOnly = true;
        oCol2.Width = "100";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipName";
        oCol3.HeaderText = "NAME";
        oCol3.Width = "250";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipCity";
        oCol4.HeaderText = "CITY";
        oCol4.Width = "150";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipPostalCode";
        oCol5.HeaderText = "POSTAL CODE";
        oCol5.Width = "150";

        Column oCol6 = new Column();
        oCol6.DataField = "ShipCountry";
        oCol6.HeaderText = "COUNTRY";
        oCol6.Width = "150";
               
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
            bool exportCurrentRow = true;

            if (Grid1.SelectedRecords != null)
            {
                Hashtable currentRecord = e.SourceRow.ToHashtable();

                foreach (Hashtable selectedRecord in Grid1.SelectedRecords)
                {
                    exportCurrentRow = true;

                    foreach (DictionaryEntry entry in selectedRecord)
                    {
                        if (currentRecord[entry.Key].ToString() != selectedRecord[entry.Key].ToString())
                        {
                            exportCurrentRow = false;
                            break;
                        }
                    }

                    if (exportCurrentRow)
                    {
                        break;
                    }
                }
            }
            else
            {
                exportCurrentRow = false;
            }

            if (!exportCurrentRow)
            {
                e.Row.Parent.Controls.Remove(e.Row);
            }
        }
    }
}