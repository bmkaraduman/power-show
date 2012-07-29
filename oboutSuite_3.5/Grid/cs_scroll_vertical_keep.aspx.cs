using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_cs_scroll_vertical_keep : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Init(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AllowAddingRecords = false;
        grid1.PageSize = 50;
        grid1.AutoPostBackOnSelect = true;
        grid1.ScrollingSettings.ScrollHeight = 150;

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ID";
        oCol1.Width = "45";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "SHIP NAME";
        oCol2.Width = "250";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "SHIP CITY";
        oCol3.Width = "150";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "150";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "SHIP COUNTRY";
        oCol5.Width = "150";


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (grid1.SelectedRecords != null)
        {
            string sText = "These are the selected records (server-side):";
            foreach (System.Collections.Hashtable oRecord in grid1.SelectedRecords)
            {
                sText += "<br />" + oRecord["OrderID"] + " --- " + oRecord["ShipName"] + " --- " + oRecord["ShipCity"] + " --- " + oRecord["ShipCountry"];
            }

            divSelectedRecords.Text = "<br />" + sText;
        }
    }

}