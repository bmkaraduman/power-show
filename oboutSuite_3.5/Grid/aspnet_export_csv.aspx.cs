using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Collections;

public partial class Grid_aspnet_export_csv : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void OboutButton1_Click(object sender, EventArgs e)
    {
        // Export current page
        ExportGridToCSV();
    }

    protected void OboutButton2_Click(object sender, EventArgs e)
    {
        // Export all pages
        Grid1.PageSize = -1;
        Grid1.DataBind();
        ExportGridToCSV();
    }

    private void ExportGridToCSV()
    {        
        Response.Clear();

        int j = 0;

        //Add headers of the csv table
        foreach (Column col in Grid1.Columns)
        {
            if (j > 0)
            {
                Response.Write(",");
            }
            
            Response.Write(col.HeaderText);

            j++;
        }

        //How add the data from the Grid to csv table
        for (int i = 0; i < Grid1.Rows.Count; i++)
        {
            Hashtable dataItem = Grid1.Rows[i].ToHashtable();
            j = 0;

            Response.Write("\n");

            foreach (Column col in Grid1.Columns)
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