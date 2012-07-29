using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Collections;
using System;

public partial class Grid_cs_export_large_data_set : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    { 
        grid1.ID = "Grid1";
        grid1.AllowPageSizeSelection = false;
        grid1.AllowAddingRecords = false;
        grid1.ScrollingSettings.ScrollWidth = 625;

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        PopulateGrid();
    }
    protected void PopulateGrid()
    {
        DataTable dt = new DataTable();
        for (int i = 1; i <= 10; i++)
        {
            dt.Columns.Add("Col" + i.ToString());
        }

        for (int i = 1; i <= 25000; i++)
        {
            DataRow row = dt.NewRow();

            for (int j = 0; j < dt.Columns.Count; j++)
            {
                row[dt.Columns[j].ColumnName] = "Item " + i.ToString() + "-" + (j + 1).ToString();
            }

            dt.Rows.Add(row);
        }

        grid1.DataSource = dt;
        grid1.DataBind();
    }

    protected void OboutButton1_Click(object sender, EventArgs e)
    {
        // Export current page
        ExportGrid();
    }

    protected void OboutButton2_Click(object sender, EventArgs e)
    {
        // Export all pages
        grid1.PageSize = -1;
        grid1.DataBind();
        ExportGrid();
    }

    private void ExportGrid()
    {
        Response.Clear();

        int j = 0;

        //Add headers of the exported file
        foreach (Column col in grid1.Columns)
        {
            if (j > 0)
            {
                Response.Write(",");
            }

            Response.Write(col.HeaderText);

            j++;
        }

        //How add the data from the Grid to exported file
        for (int i = 0; i < grid1.Rows.Count; i++)
        {
            Hashtable dataItem = grid1.Rows[i].ToHashtable();
            j = 0;

            Response.Write("\n");

            foreach (Column col in grid1.Columns)
            {
                if (j > 0)
                {
                    Response.Write(",");
                }

                Response.Write(dataItem[col.DataField].ToString());

                j++;
            }
        }

        // Send the data and the appropriate headers to the browser        
        Response.AddHeader("content-disposition", "attachment;filename=oboutGrid.csv");
        Response.ContentType = "text/csv";
        Response.End();
    }

}