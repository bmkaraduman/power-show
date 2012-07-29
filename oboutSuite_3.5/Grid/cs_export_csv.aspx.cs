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

public partial class Grid_cs_export_csv : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "SqlDataSource1";

        // creating the columns
        Column g1Col1 = new Column();
        g1Col1.DataField = "OrderID";
        g1Col1.HeaderText = "Order ID";

        Column g1Col2 = new Column();
        g1Col2.DataField = "ShipName";
        g1Col2.HeaderText = "NAME";

        Column g1Col3 = new Column();
        g1Col3.DataField = "ShipCity";
        g1Col3.HeaderText = "CITY";

        Column g1Col4 = new Column();
        g1Col4.DataField = "ShipCountry";
        g1Col4.HeaderText = "COUNTRY";


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(g1Col1);
        grid1.Columns.Add(g1Col2);
        grid1.Columns.Add(g1Col3);
        grid1.Columns.Add(g1Col4);

        phGrid1.Controls.Add(grid1);
    }

    protected void OboutButton1_Click(object sender, EventArgs e)
    {
        // Export current page
        ExportGridToCSV();
    }

    protected void OboutButton2_Click(object sender, EventArgs e)
    {
        // Export all pages
        grid1.PageSize = -1;
        grid1.DataBind();
        ExportGridToCSV();
    }

    private void ExportGridToCSV()
    {        
        Response.Clear();

        int j = 0;

        //Add headers of the csv table
        foreach (Column col in grid1.Columns)
        {
            if (j > 0)
            {
                Response.Write(",");
            }
            
            Response.Write(col.HeaderText);

            j++;
        }

        //How add the data from the Grid to csv table
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