using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_master_detail_with_row_template : System.Web.UI.Page
{
    Grid grid1 = new Grid();
    DetailGrid grid2 = new DetailGrid();
    DetailGrid grid3 = new DetailGrid();

    protected void Page_Load(object sender, EventArgs e)
    {
                  
        // Creating grid1
        grid1.ID = "Grid1";
        grid1.AutoGenerateColumns = false;
        grid1.PageSize = 5;
        grid1.AllowAddingRecords = true;
        grid1.DataSourceID = "sds1";
        grid1.AllowPageSizeSelection = false;

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;
        grid1.TemplateSettings.RowEditTemplateId = "tplRowEditMaster";


        // creating the Template for editing Rows
        //------------------------------------------------------------------------
        GridRuntimeTemplate RowEditTemplate = new GridRuntimeTemplate();
        RowEditTemplate.ID = "tplRowEditMaster";
        RowEditTemplate.Template = new Obout.Grid.RuntimeTemplate();
        RowEditTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateRowEditTemplate);
        //------------------------------------------------------------------------

        grid1.Templates.Add(RowEditTemplate);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "CustomerID";
        oCol1.HeaderText = "CUSTOMER ID";
        oCol1.Visible = false;
        oCol1.TemplateSettings.RowEditTemplateControlId = "txtCustomerID";
        oCol1.TemplateSettings.RowEditTemplateControlPropertyName = "innerHTML";

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "200";
        oCol2.TemplateSettings.RowEditTemplateControlId = "txtCompanyName";
        oCol2.TemplateSettings.RowEditTemplateControlPropertyName = "value";


        Column oCol3 = new Column();
        oCol3.DataField = "ContactName";
        oCol3.HeaderText = "CONTACT NAME";
        oCol3.TemplateSettings.RowEditTemplateControlId = "txtContactName";
        oCol3.TemplateSettings.RowEditTemplateControlPropertyName = "value";


        Column oCol4 = new Column();
        oCol4.DataField = "Country";
        oCol4.HeaderText = "COUNTRY";
        oCol4.TemplateSettings.RowEditTemplateControlId = "ddlCountries";
        oCol4.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol5 = new Column();
        oCol5.DataField = "";
        oCol5.HeaderText = "";
        oCol5.AllowEdit = true;
        oCol5.AllowDelete = true;
        oCol5.Width = "145";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // Creating grid2
        grid2.ID = "Grid2";
        grid2.AutoGenerateColumns = false;
        grid2.EnableTypeValidation = false;
        grid2.AllowAddingRecords = true; 
        grid2.ShowFooter = true;
        grid2.PageSize = 5;
        grid2.RowCreated += grid2_RowCreated;
        grid2.DataSourceID = "sds2";
        grid2.ForeignKeys = "CustomerID";
        grid2.AllowPageSizeSelection = false;

        grid2.ClientSideEvents.ExposeSender = true;
        grid2.ClientSideEvents.OnClientPopulateControls = "onPopulateControls";
        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;
        grid2.TemplateSettings.RowEditTemplateId = "tplRowEditDetail";


        // creating the Template for editing Rows
        //------------------------------------------------------------------------
        GridRuntimeTemplate RowEditTemplateDetail = new GridRuntimeTemplate();
        RowEditTemplateDetail.ID = "tplRowEditDetail";
        RowEditTemplateDetail.Template = new Obout.Grid.RuntimeTemplate();
        RowEditTemplateDetail.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateRowEditTemplateDetail);
        //------------------------------------------------------------------------

        grid2.Templates.Add(RowEditTemplateDetail);

        // creating the columns
        Column oCol2_1 = new Column();
        oCol2_1.DataField = "CustomerID";
        oCol2_1.HeaderText = "CUSTOMER ID";
        oCol2_1.Visible = false;
        oCol2_1.ReadOnly = false;
        oCol2_1.TemplateSettings.RowEditTemplateControlId = "hiddenCustomerID";
        oCol2_1.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol2_2 = new Column();
        oCol2_2.DataField = "OrderID";
        oCol2_2.HeaderText = "ORDER ID";
        oCol2_2.Visible = false;
        oCol2_2.ReadOnly = false;
        oCol2_2.TemplateSettings.RowEditTemplateControlId = "hiddenOrderID";
        oCol2_2.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol2_3 = new Column();
        oCol2_3.DataField = "ShipName";
        oCol2_3.HeaderText = "NAME";
        oCol2_3.TemplateSettings.RowEditTemplateControlId = "txtShipName";
        oCol2_3.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol2_4 = new Column();
        oCol2_4.DataField = "ShipCity";
        oCol2_4.HeaderText = "CITY";
        oCol2_4.TemplateSettings.RowEditTemplateControlId = "txtShipCity";
        oCol2_4.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol2_5 = new Column();
        oCol2_5.DataField = "ShipCountry";
        oCol2_5.HeaderText = "COUNTRY";
        oCol2_5.DataFormatString = "{0:C2}";
        oCol2_5.Width = "125";
        oCol2_5.TemplateSettings.RowEditTemplateControlId = "ddlShipCountries";
        oCol2_5.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol2_6 = new Column();
        oCol2_6.DataField = "";
        oCol2_6.HeaderText = "EDIT";
        oCol2_6.Width = "140";
        oCol2_6.AllowEdit = true;
        oCol2_6.AllowDelete = true;

        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1);
        grid2.Columns.Add(oCol2_2);
        grid2.Columns.Add(oCol2_3);     
        grid2.Columns.Add(oCol2_4);
        grid2.Columns.Add(oCol2_5);
        grid2.Columns.Add(oCol2_6);

        grid1.DetailGrids.Add(grid2);


        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
    }

    public void CreateRowEditTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPH1 = new PlaceHolder();
        e.Container.Controls.Add(oPH1);
        oPH1.DataBinding += new EventHandler(DataBindRowEditTemplate);
    }
    protected void DataBindRowEditTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPH1 = sender as PlaceHolder;
        Obout.Grid.TemplateContainer oContainer = oPH1.NamingContainer as Obout.Grid.TemplateContainer;

        Table oTable = new Table();
        oTable.CssClass = "rowEditTable";

        TableRow oTr = new TableRow();

        TableCell oCell1 = new TableCell();

        // For Ship Information
        Panel oPanelShipInformation = new Panel();
        oPanelShipInformation.Attributes["style"] = "width: 300px; height: 125px;";
        oPanelShipInformation.GroupingText = "Customer Information";
        Table oTableShipInformation = new Table();

        oTableShipInformation.Rows.Add(CreateTableRowWithSpan("Customer ID:", "txtCustomerID"));
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Company Name:", "txtCompanyName"));
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Contact Name:", "txtContactName"));
        oTableShipInformation.Rows.Add(CreateTableRowWithDropdown("Country:", "ddlCountries"));
        oTableShipInformation.Rows.Add(CreateEmptyTableRow());

        oPanelShipInformation.Controls.Add(oTableShipInformation);
        oCell1.Controls.Add(oPanelShipInformation);

        oTr.Cells.Add(oCell1);
        oTable.Rows.Add(oTr);

        oPH1.Controls.Add(oTable);
    }

    public TableRow CreateTableRowWithTextbox(string sLabelText, string sControlId)
    {
        TableRow oTr = new TableRow();
        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();

        Label oLabel = new Label();
        oLabel.Text = sLabelText;
        oCell1.Controls.Add(oLabel);

        Obout.Interface.OboutTextBox oTextBox = new Obout.Interface.OboutTextBox();
        oTextBox.ID = sControlId;
        oTextBox.Width = Unit.Pixel(150);

        oCell2.Controls.Add(oTextBox);

        oTr.Cells.Add(oCell1);
        oTr.Cells.Add(oCell2);

        return oTr;
    }

    public TableRow CreateTableRowWithDropdown(string sLabelText, string sControlId)
    {
        TableRow oTr = new TableRow();
        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();

        Label oLabel = new Label();
        oLabel.Text = sLabelText;
        oCell1.Controls.Add(oLabel);

        Obout.Interface.OboutDropDownList ddlCountries = new Obout.Interface.OboutDropDownList();
        ddlCountries.ID = sControlId;
        ddlCountries.Width = Unit.Pixel(150);
        ddlCountries.Height = Unit.Pixel(200);
        ddlCountries.MenuWidth = Unit.Pixel(175);

        ddlCountries.DataSourceID = "sds3";
        ddlCountries.DataTextField = "ShipCountry";
        ddlCountries.DataValueField = "ShipCountry";

        oCell2.Controls.Add(ddlCountries);

        oTr.Cells.Add(oCell1);
        oTr.Cells.Add(oCell2);

        return oTr;
    }

    public TableRow CreateTableRowWithSpan(string sLabelText, string sControlId)
    {
        TableRow oTr = new TableRow();
        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();

        Label oLabel = new Label();
        oLabel.Text = sLabelText;
        oCell1.Controls.Add(oLabel);

        Literal oLiteral = new Literal();
        oLiteral.Text = "<span id=\"txtCustomerID\" style=\"width: 150px;\"></span>";

        oCell2.Controls.Add(oLiteral);

        oTr.Cells.Add(oCell1);
        oTr.Cells.Add(oCell2);

        return oTr;
    }

    public TableRow CreateEmptyTableRow()
    {
        TableRow oTr = new TableRow();
        TableCell oCell1 = new TableCell();
        oCell1.ColumnSpan = 2;

        Literal oLiteral = new Literal();
        oLiteral.Text = "<br />";

        oCell1.Controls.Add(oLiteral);
        oTr.Cells.Add(oCell1);

        return oTr;
    }

    public void CreateRowEditTemplateDetail(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPH1 = new PlaceHolder();
        e.Container.Controls.Add(oPH1);
        oPH1.DataBinding += new EventHandler(DataBindRowEditTemplateDetail);
    }
    protected void DataBindRowEditTemplateDetail(Object sender, EventArgs e)
    {
        PlaceHolder oPH1 = sender as PlaceHolder;
        Obout.Grid.TemplateContainer oContainer = oPH1.NamingContainer as Obout.Grid.TemplateContainer;

        Literal inputHiddenCustomer = new Literal(); 
        inputHiddenCustomer.Text = "<input type=\"hidden\" id=\"hiddenCustomerID\" />";

        Literal inputHiddenOrder = new Literal(); 
        inputHiddenOrder.Text = "<input type=\"hidden\" id=\"hiddenOrderID\" />";

        Table oTable = new Table();
        oTable.CssClass = "rowEditTable";

        TableRow oTr = new TableRow();

        TableCell oCell1 = new TableCell();

        // For Ship Information
        Panel oPanelShipInformation = new Panel();
        oPanelShipInformation.Attributes["style"] = "width: 300px; height: 125px;";
        oPanelShipInformation.GroupingText = "Ship Information";
        Table oTableShipInformation = new Table();

        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship Name:", "txtShipName"));
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship City:", "txtShipCity"));
        oTableShipInformation.Rows.Add(CreateTableRowWithDropdown("Ship Country:", "ddlShipCountries"));        
        oTableShipInformation.Rows.Add(CreateEmptyTableRow());

        oPanelShipInformation.Controls.Add(oTableShipInformation);
        oCell1.Controls.Add(oPanelShipInformation);

        oTr.Cells.Add(oCell1);
        oTable.Rows.Add(oTr);

        oPH1.Controls.Add(inputHiddenCustomer);
        oPH1.Controls.Add(inputHiddenOrder);
        oPH1.Controls.Add(oTable);
    }

    protected void grid2_RowCreated(object sender, GridRowEventArgs e)
    {
        DetailGrid detailGrid = sender as DetailGrid;
        detailGrid.DataBound += new EventHandler(grid2_DataBound);
    }

    void grid2_DataBound(object sender, EventArgs e)
    {
        DetailGrid detailGrid = sender as DetailGrid;

        Obout.Interface.OboutTextBox txtShipName = detailGrid.Templates[0].Container.FindControl("txtShipName") as Obout.Interface.OboutTextBox;
        Obout.Interface.OboutTextBox txtShipCity = detailGrid.Templates[0].Container.FindControl("txtShipCity") as Obout.Interface.OboutTextBox;
        Obout.Interface.OboutDropDownList ddlShipCountries = detailGrid.Templates[0].Container.FindControl("ddlShipCountries") as Obout.Interface.OboutDropDownList;

        if (txtShipName != null && txtShipCity != null && ddlShipCountries != null)
        {
            txtShipName.ID = detailGrid.ID + "_txtShipName";
            txtShipCity.ID = detailGrid.ID + "_txtShipCity";
            ddlShipCountries.ID = detailGrid.ID + "_ddlShipCountries";

            detailGrid.Columns[2].TemplateSettings.RowEditTemplateControlId = txtShipName.ID;
            detailGrid.Columns[3].TemplateSettings.RowEditTemplateControlId = txtShipCity.ID;
            detailGrid.Columns[4].TemplateSettings.RowEditTemplateControlId = ddlShipCountries.ID;
        }
    }
}