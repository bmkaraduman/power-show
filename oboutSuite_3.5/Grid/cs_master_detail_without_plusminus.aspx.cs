using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_master_detail_without_plusminus : System.Web.UI.Page
{
    Grid grid1 = new Grid();
    DetailGrid grid2 = new DetailGrid();

    protected void Page_Load(object sender, EventArgs e)
    {
                  
        // Creating grid1
        grid1.ID = "Grid1";
        grid1.AutoGenerateColumns = false;
        grid1.PageSize = 5;
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "sds1";
        grid1.AllowPageSizeSelection = false;

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;


        // creating the Template for editing Rows
        //------------------------------------------------------------------------
        GridRuntimeTemplate ExpandTemplate = new GridRuntimeTemplate();
        ExpandTemplate.ID = "TemplateExpand";
        ExpandTemplate.Template = new Obout.Grid.RuntimeTemplate();
        ExpandTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateExpandTemplate);
        //------------------------------------------------------------------------

        grid1.Templates.Add(ExpandTemplate);

        // creating the columns

        Column oCol0 = new Column();
        oCol0.HeaderText = "";
        oCol0.Width = "110";
        oCol0.TemplateSettings.TemplateId = "TemplateExpand";

        Column oCol1 = new Column();
        oCol1.DataField = "CustomerID";
        oCol1.HeaderText = "CUSTOMER ID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "200";

        Column oCol3 = new Column();
        oCol3.DataField = "ContactName";
        oCol3.HeaderText = "CONTACT NAME";


        Column oCol4 = new Column();
        oCol4.DataField = "Country";
        oCol4.HeaderText = "COUNTRY";
        oCol4.Width = "125";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol0);
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
     

        // Creating grid2
        grid2.ID = "Grid2";
        grid2.AutoGenerateColumns = false;
        grid2.EnableTypeValidation = false;
        grid2.AllowAddingRecords = false; 
        grid2.ShowFooter = true;
        grid2.PageSize = 5;
        grid2.DataSourceID = "sds2";
        grid2.ForeignKeys = "CustomerID";
        grid2.AllowPageSizeSelection = false;

        grid2.ClientSideEvents.ExposeSender = true;
        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;

        // creating the columns
        Column oCol2_1 = new Column();
        oCol2_1.DataField = "CustomerID";
        oCol2_1.HeaderText = "CUSTOMER ID";
        oCol2_1.Visible = false;
        oCol2_1.ReadOnly = false;

        Column oCol2_2 = new Column();
        oCol2_2.DataField = "OrderID";
        oCol2_2.HeaderText = "ORDER ID";
        oCol2_2.Visible = false;
        oCol2_2.ReadOnly = false;

        Column oCol2_3 = new Column();
        oCol2_3.DataField = "ShipName";
        oCol2_3.HeaderText = "NAME";
        oCol2_3.Width = "250";

        Column oCol2_4 = new Column();
        oCol2_4.DataField = "ShipCity";
        oCol2_4.HeaderText = "CITY";
        oCol2_4.Width = "170";

        Column oCol2_5 = new Column();
        oCol2_5.DataField = "ShipCountry";
        oCol2_5.HeaderText = "COUNTRY";
        oCol2_5.DataFormatString = "{0:C2}";
        oCol2_5.Width = "150";


        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1);
        grid2.Columns.Add(oCol2_2);
        grid2.Columns.Add(oCol2_3);     
        grid2.Columns.Add(oCol2_4);
        grid2.Columns.Add(oCol2_5);

        grid1.DetailGrids.Add(grid2);


        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
    }

    public void CreateExpandTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal expand = new Literal();
        Obout.Grid.TemplateContainer oContainer = expand.NamingContainer as Obout.Grid.TemplateContainer;
        expand.Text = "<a href=\"javascript: //\" onclick=\"showDetails(event, this);\" class=\"visible\">View Details</a><a href=\"javascript: //\" onclick=\"hideDetails(event, this);\" class=\"hidden\">Close Details</a>";

        e.Container.Controls.Add(expand);
        
    }


}