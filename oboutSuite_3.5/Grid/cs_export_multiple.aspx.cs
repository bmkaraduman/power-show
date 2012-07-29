using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_export_multiple : System.Web.UI.Page
{
    Grid grid1 = new Grid();
    Grid grid2 = new Grid();
    Grid grid3 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "SqlDataSource3";
        grid1.FolderStyle = "styles/black_glass";
        grid1.PageSize = 5;        
        grid1.Exporting += Grid1_Exporting;
        grid1.Exported += Grid1_Exported;

        grid1.TemplateSettings.HeadingTemplateId = "Template1";
        grid1.ExportingSettings.ExportHiddenColumns = false;

        GridRuntimeTemplate Template1 = new GridRuntimeTemplate();
        Template1.ID = "Template1";
        Template1.Template = new Obout.Grid.RuntimeTemplate();
        Template1.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateTemplate1);
        //------------------------------------------------------------------------

        GridRuntimeTemplate Template2 = new GridRuntimeTemplate();
        Template2.ID = "Template2";
        Template2.Template = new Obout.Grid.RuntimeTemplate();
        Template2.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateTemplate2);
        //------------------------------------------------------------------------


        GridRuntimeTemplate Template3 = new GridRuntimeTemplate();
        Template3.ID = "Template3";
        Template3.Template = new Obout.Grid.RuntimeTemplate();
        Template3.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateTemplate3);
        //------------------------------------------------------------------------

        // adding the templates to the Templates collection
        grid1.Templates.Add(Template1);
        grid2.Templates.Add(Template2);
        grid3.Templates.Add(Template3);

        // creating the columns
        Column g1Col1 = new Column();
        g1Col1.DataField = "CustomerID";
        g1Col1.Visible = false;
        g1Col1.Width = "150";
        g1Col1.ReadOnly = true;

        Column g1Col2 = new Column();
        g1Col2.DataField = "CompanyName";
        g1Col2.HeaderText = "COMPANY NAME";

        Column g1Col3 = new Column();
        g1Col3.DataField = "Address";
        g1Col3.HeaderText = "ADDRESS";

        Column g1Col4 = new Column();
        g1Col4.DataField = "City";
        g1Col4.HeaderText = "CITY";

        Column g1Col5 = new Column();
        g1Col5.DataField = "Country";
        g1Col5.HeaderText = "COUNTRY";


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(g1Col1);
        grid1.Columns.Add(g1Col2);
        grid1.Columns.Add(g1Col3);
        grid1.Columns.Add(g1Col4);
        grid1.Columns.Add(g1Col5);


        grid2.ID = "Grid2";
        grid2.AutoGenerateColumns = false;
        grid2.AllowAddingRecords = false;
        grid2.DataSourceID = "SqlDataSource2";
        grid2.FolderStyle = "styles/black_glass";
        grid2.PageSize = 5;

        grid2.TemplateSettings.HeadingTemplateId = "Template2";
        grid2.ExportingSettings.ExportHiddenColumns = false;

        // creating the columns
        Column g2Col1 = new Column();
        g2Col1.DataField = "OrderID";
        g2Col1.Visible = false;
        g2Col1.Width = "150";
        g2Col1.ReadOnly = true;

        Column g2Col2 = new Column();
        g2Col2.DataField = "ShipName";
        g2Col2.HeaderText = "SHIP NAME";

        Column g2Col3 = new Column();
        g2Col3.DataField = "ShipCity";
        g2Col3.HeaderText = "SHIP CITY";

        Column g2Col4 = new Column();
        g2Col4.DataField = "ShipRegion";
        g2Col4.HeaderText = "REGION";

        Column g2Col5 = new Column();
        g2Col5.DataField = "ShipCountry";
        g2Col5.HeaderText = "SHIP COUNTRY";


        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(g2Col1);
        grid2.Columns.Add(g2Col2);
        grid2.Columns.Add(g2Col3);
        grid2.Columns.Add(g2Col4);
        grid2.Columns.Add(g2Col5);

        grid3.ID = "Grid3";
        grid3.AutoGenerateColumns = false;
        grid3.AllowAddingRecords = false;
        grid3.DataSourceID = "SqlDataSource1";
        grid3.FolderStyle = "styles/black_glass";
        grid3.PageSize = 5;

        grid3.TemplateSettings.HeadingTemplateId = "Template3";
        grid3.ExportingSettings.ExportHiddenColumns = false;

        // creating the columns
        Column g3Col1 = new Column();
        g3Col1.DataField = "ProductID";
        g3Col1.Visible = false;
        g3Col1.Width = "150";
        g3Col1.ReadOnly = true;

        Column g3Col2 = new Column();
        g3Col2.DataField = "CategoryID";
        g3Col2.HeaderText = "CATEGORY ID";
        g3Col2.Visible = false;
        g3Col2.Width = "150";
        g3Col2.ReadOnly = true;

        Column g3Col3 = new Column();
        g3Col3.DataField = "ProductName";
        g3Col3.HeaderText = "PRODUCT NAME";

        Column g3Col4 = new Column();
        g3Col4.DataField = "UnitPrice";
        g3Col4.HeaderText = "PRICE";

        Column g3Col5 = new Column();
        g3Col5.DataField = "UnitsInStock";
        g3Col5.HeaderText = "SUNITS IN STOCK";

        Column g3Col6 = new Column();
        g3Col6.DataField = "UnitsOnOrder";
        g3Col6.HeaderText = "UNITS ON ORDER";


        // add the columns to the Columns collection of the grid
        grid3.Columns.Add(g3Col1);
        grid3.Columns.Add(g3Col2);
        grid3.Columns.Add(g3Col3);
        grid3.Columns.Add(g3Col4);
        grid3.Columns.Add(g3Col5);
        grid3.Columns.Add(g3Col6);



        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        phGrid2.Controls.Add(grid2);
        phGrid3.Controls.Add(grid3);
    }

    protected void Grid1_Exporting(object sender, GridExportEventArgs e)
    {
        AddTitleRow(e.Table, "CUSTOMERS");
    }

    protected void Grid1_Exported(object sender, GridExportEventArgs e)
    {
        AddGridToExportedFile(grid2, e.Table, "ORDERS");
        AddGridToExportedFile(grid3, e.Table, "PRODUCTS");
    }

    protected void AddTitleRow(Table table, string title)
    {
        TableRow titleRow = new TableRow();
        table.Rows.Add(titleRow);

        TableCell titleCell = new TableCell();
        titleRow.Cells.Add(titleCell);
        titleCell.ColumnSpan = 4;
        titleCell.Text = "<b>" + title + "</b>";
    }

    protected void AddGridToExportedFile(Grid grid, Table table, string title)
    {
        TableRow spacerRow = new TableRow();
        table.Rows.Add(spacerRow);

        AddTitleRow(table, title);

        TableRow headerRow = new TableRow();

        foreach (Column column in grid.Columns)
        {
            if (column.Visible)
            {
                TableCell headerCell = new TableCell();
                headerCell.Text = column.HeaderText;
                headerRow.Cells.Add(headerCell);
            }
        }

        table.Rows.Add(headerRow);

        foreach (GridRow dataRow in grid.Rows)
        {
            TableRow newRow = new TableRow();

            int columnIndex = 0;
            foreach (GridDataControlFieldCell dataCell in dataRow.Cells)
            {
                if (grid.Columns[columnIndex].Visible)
                {
                    TableCell newCell = new TableCell();
                    newCell.Text = dataCell.Text;
                    newRow.Cells.Add(newCell);
                }

                columnIndex++;
            }

            table.Rows.Add(newRow);
        }
    }
    public void CreateTemplate1(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
       
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "CUSTOMERS";
        e.Container.Controls.Add(oLiteral);		
    }

    public void CreateTemplate2(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();

        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "ORDERS";
        e.Container.Controls.Add(oLiteral);		
    }

    public void CreateTemplate3(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();

        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "PRODUCTS";
        e.Container.Controls.Add(oLiteral);		
    }
}