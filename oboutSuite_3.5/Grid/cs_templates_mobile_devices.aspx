<%@ Page Language="C#" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">	
    
    Grid grid1 = new Grid();

    void Page_load(object sender, EventArgs e)
    {

        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.AllowPageSizeSelection = false;
        grid1.PageSize = 5;


        grid1.TemplateSettings.RowEditTemplateId = "tplRowEdit";

        grid1.FolderStyle = "styles/grand_gray";

        // setting the event handlers

        grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
        grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);

        // creating the Template to Show Records.
        //------------------------------------------------------------------------
        GridRuntimeTemplate FormTemplate = new GridRuntimeTemplate();
        FormTemplate.ID = "tplFormView";
        FormTemplate.Template = new Obout.Grid.RuntimeTemplate();
        FormTemplate.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateFormViewTemplate);

        // creating the Template for editing Rows
        //------------------------------------------------------------------------
        GridRuntimeTemplate RowEditTemplate = new GridRuntimeTemplate();
        RowEditTemplate.ID = "tplRowEdit";
        RowEditTemplate.Template = new Obout.Grid.RuntimeTemplate();
        RowEditTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateRowEditTemplate);
        //------------------------------------------------------------------------


        grid1.Templates.Add(RowEditTemplate);
        grid1.Templates.Add(FormTemplate);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = false;
        oCol1.Visible = true;
        oCol1.HeaderText = "SHIP INFORMATION";
        oCol1.Width = "250";
        oCol1.TemplateSettings.TemplateId = "tplFormView";
        oCol1.TemplateSettings.RowEditTemplateControlId = "lblEditID";
        oCol1.TemplateSettings.RowEditTemplateControlPropertyName = "innerHTML";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.Visible = false;
        oCol2.HeaderText = "NAME";
        oCol2.Width = "125";
        oCol2.TemplateSettings.RowEditTemplateControlId = "txtShipName";
        oCol2.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipAddress";
        oCol3.Visible = false;
        oCol3.HeaderText = "ADDRESS";
        oCol3.Width = "125";
        oCol3.TemplateSettings.RowEditTemplateControlId = "txtShipAddress";
        oCol3.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);

        // add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1);


        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

    void CreateFormViewTemplate(object sender, GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPH1 = new PlaceHolder();
        e.Container.Controls.Add(oPH1);
        oPH1.DataBinding += new EventHandler(DataBindFormViewTemplate);
    }


    // Create the methods that will load the data into the ViewTemplates
    //------------------------------------------------------------------------
    protected void DataBindFormViewTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPH1 = sender as PlaceHolder;
        Obout.Grid.TemplateContainer oContainer = oPH1.NamingContainer as Obout.Grid.TemplateContainer;

        Table oTable = new Table();
        oTable.CssClass = "rowEditTable";

        TableRow oTr = new TableRow();

        TableCell oCell1 = new TableCell();

        // For Ship Information
        Table oTableShipInformation = new Table();

        oTableShipInformation.Rows.Add(CreateTableRowWithLabel("ID:", "lblID", oContainer.DataItem["OrderID"].ToString()));
        oTableShipInformation.Rows.Add(CreateTableRowWithLabel("Name:", "lblShipName", oContainer.DataItem["ShipName"].ToString()));
        oTableShipInformation.Rows.Add(CreateTableRowWithLabel("Address:", "lblShipAddress", oContainer.DataItem["ShipAddress"].ToString()));

        oCell1.Controls.Add(oTableShipInformation);
        oTr.Cells.Add(oCell1);
        oTable.Rows.Add(oTr);

        TableRow oTr2 = new TableRow();
        TableCell oCell2_1 = new TableCell();
        //oCell2_1.ColumnSpan = 2;
        oCell2_1.HorizontalAlign = HorizontalAlign.Left;

        Button oSaveEdit = new Button();
        oSaveEdit.CssClass = "tdTextSmall";
        oSaveEdit.OnClientClick = "grid1.editRecord(" + oContainer.PageRecordIndex + ");return false";
        oSaveEdit.Text = "Edit";

        oCell2_1.Controls.Add(oSaveEdit);

        oTr2.Controls.Add(oCell2_1);
        oTable.Rows.Add(oTr2);

        oPH1.Controls.Add(oTable);
    }

    // Create the methods that will load the data into the EditTemplates
    //------------------------------------------------------------------------
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
        oPanelShipInformation.GroupingText = "Ship Information";
        Table oTableShipInformation = new Table();

        oTableShipInformation.Rows.Add(CreateTableRowWithLabel("ID:", "lblEditID", null));
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Name:", "txtShipName"));
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Address:", "txtShipAddress"));

        oPanelShipInformation.Controls.Add(oTableShipInformation);
        oCell1.Controls.Add(oPanelShipInformation);

        oTr.Cells.Add(oCell1);
        oTable.Rows.Add(oTr);

        TableRow oTr2 = new TableRow();
        TableCell oCell2_1 = new TableCell();
        oCell2_1.ColumnSpan = 3;
        oCell2_1.HorizontalAlign = HorizontalAlign.Center;

        Button oSaveButton = new Button();
        oSaveButton.CssClass = "tdTextSmall";
        oSaveButton.OnClientClick = "grid1.save();return false";
        oSaveButton.Text = "Save";

        Literal oSpacer = new Literal();
        oSpacer.Text = " ";

        Button oCancelButton = new Button();
        oCancelButton.CssClass = "tdTextSmall";
        oCancelButton.OnClientClick = "grid1.cancel();return false";
        oCancelButton.Text = "Cancel";

        oCell2_1.Controls.Add(oSaveButton);
        oCell2_1.Controls.Add(oSpacer);
        oCell2_1.Controls.Add(oCancelButton);
        oTr2.Controls.Add(oCell2_1);

        oTable.Rows.Add(oTr2);

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

        TextBox oTextBox = new TextBox();
        oTextBox.ID = sControlId;
        oTextBox.CssClass = "ob_gEC";
        oCell2.Controls.Add(oTextBox);

        oTr.Cells.Add(oCell1);
        oTr.Cells.Add(oCell2);

        return oTr;
    }

    public TableRow CreateTableRowWithLabel(string sLabelText, string sControlId, string sValue)
    {
        TableRow oTr = new TableRow();
        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();

        Label oLabel = new Label();
        oLabel.Text = sLabelText;
        oCell1.Controls.Add(oLabel);

        Label oLabel2 = new Label();
        oLabel2.ID = sControlId;

        if (sValue != null)
            oLabel2.Text = sValue;

        oCell2.Controls.Add(oLabel2);

        oTr.Cells.Add(oCell1);
        oTr.Cells.Add(oCell2);

        return oTr;
    }

    void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateFormatted, FORMAT(RequiredDate, \"mm/dd/yyyy\") AS RequiredDateFormatted, FORMAT(ShippedDate, \"mm/dd/yyyy\") AS ShippedDateFormatted FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }


</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>obout ASP.NET Grid examples</title>
    <style type="text/css">
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        .option2
        {
            font: 11px Verdana;
            color: #0033cc;
            padding-left: 4px;
            padding-right: 4px;
        }
        a
        {
            font: 11px Verdana;
            color: #315686;
            text-decoration: underline;
        }
        a:hover
        {
            color: crimson;
        }
        .rowEditTable td
        {
            font-family: Verdana;
            font-size: 10px;
            color: #4B555E;
        }
        .tdTextSmall
        {
            font: 9px Verdana;
            color: #333333;
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
    
    <br />
    
    <span class="tdText"><b>ASP.NET Grid - Customize for Mobile Devices</b></span>
    
    <br />
    <br />
    
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
    
    <br />
    <br />
    
    <span class="tdText">
        The Grid can be customized to display all the data in a single column, for both view and edit mode.
        <br />
        This is very useful for displaying data on mobile devices.
    </span>
    
    <br />
    <br />
    
    <a href="Default.aspx?type=CSHARP">« Back to examples</a>
    
    <br />
    
    </form>
    <style type="text/css">
        .ob_gFRP
        {
            display: none;
        }
        .ob_gRETpl /*.ob_gridRowEditTemplate*/
        {
            padding: 5px;
        }
        .ob_gRC /*.ob_gridResizableContent*/
        {
            padding-left: 4px;
        }
        .ob_gFContent table td /* .ob_gridFooterContent table td */
        {
            text-align: left;
        }
    </style>
</body>
</html>
