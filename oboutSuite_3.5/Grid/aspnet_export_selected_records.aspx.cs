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

public partial class Grid_aspnet_export_selected_records : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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