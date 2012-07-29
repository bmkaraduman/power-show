<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.Popups" TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
    Grid grid1 = new Grid();
    OboutInc.Calendar2.Calendar dummyCal = new OboutInc.Calendar2.Calendar();
    ArrayList calendars = new ArrayList();
    ArrayList textboxes = new ArrayList();

    void Page_load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.TemplateSettings.RowEditTemplateId = "tplRowEdit";

        grid1.ClientSideEvents.OnClientEdit = "onAddEdit";
        grid1.ClientSideEvents.OnClientAdd = "onAddEdit";
        grid1.ClientSideEvents.OnBeforeClientUpdate = "onBeforeInsertUpdate";
        grid1.ClientSideEvents.OnBeforeClientInsert = "onBeforeInsertUpdate";
        grid1.ClientSideEvents.OnBeforeClientCancelEdit = "onBeforeClientCancelEdit";

        grid1.FolderStyle = "";

        // setting the event handlers
        grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
        grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
        grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
        grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);


        // creating the Template for editing Rows
        //------------------------------------------------------------------------
        GridRuntimeTemplate RowEditTemplate = new GridRuntimeTemplate();
        RowEditTemplate.ID = "tplRowEdit";
        RowEditTemplate.Template = new Obout.Grid.RuntimeTemplate();
        RowEditTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateRowEditTemplate);
        //------------------------------------------------------------------------


        grid1.Templates.Add(RowEditTemplate);


        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.Visible = false;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "150";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.Visible = true;
        oCol2.HeaderText = "NAME";
        oCol2.Width = "150";
        oCol2.TemplateSettings.RowEditTemplateControlId = "txtShipName";
        oCol2.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipAddress";
        oCol3.HeaderText = "ADDRESS";
        oCol3.Width = "160";
        oCol3.TemplateSettings.RowEditTemplateControlId = "txtShipAddress";
        oCol3.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipCity";
        oCol4.Visible = false;
        oCol4.HeaderText = "CITY";
        oCol4.Width = "150";
        oCol4.TemplateSettings.RowEditTemplateControlId = "txtShipCity";
        oCol4.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipRegion";
        oCol5.Visible = false;
        oCol5.HeaderText = "REGION";
        oCol5.Width = "150";
        oCol5.TemplateSettings.RowEditTemplateControlId = "txtShipRegion";
        oCol5.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol8 = new Column();
        oCol8.DataField = "OrderDateFormatted";
        oCol8.Visible = true;
        oCol8.HeaderText = "ORDER DATE";
        oCol8.Width = "160";
        oCol8.TemplateSettings.RowEditTemplateControlId = "txtOrderDate";
        oCol8.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol7 = new Column();
        oCol7.DataField = "ShipCountry";
        oCol7.Visible = true;
        oCol7.HeaderText = "COUNTRY";
        oCol7.Width = "150";
        oCol7.TemplateSettings.RowEditTemplateControlId = "ddlCountries";
        oCol7.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol13 = new Column();
        oCol13.DataField = "AdditionalInformationHTML";
        oCol13.Visible = false;
        oCol13.HeaderText = "ADDITIONAL INFORMATION";
        oCol13.Width = "200";
        oCol13.TemplateSettings.RowEditTemplateControlId = "EditorContent";
        oCol13.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol14 = new Column();
        oCol14.DataField = "";
        oCol14.Visible = true;
        oCol14.HeaderText = "EDIT";
        oCol14.Width = "150";
        oCol14.AllowEdit = true;
        oCol14.AllowDelete = true;


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol7);
        grid1.Columns.Add(oCol8);
        grid1.Columns.Add(oCol13);
        grid1.Columns.Add(oCol14);

        // add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1);

        dummyCal.ID = "dummyCal";
        phDummy.Controls.Add(dummyCal);

        if (!Page.IsPostBack)
        {
            BindGrid();
        }

        EditorID.Value = ((Editor)(grid1.Templates[0].Container.FindControl("Editor"))).ClientID;

        OboutInc.Calendar2.Calendar orderDateCalendar = grid1.Templates[0].Container.FindControl("gridCal1") as OboutInc.Calendar2.Calendar;
        OboutTextBox txtOrderDate = grid1.Templates[0].Container.FindControl("txtOrderDate") as OboutTextBox;
        orderDateCalendar.TextBoxId = txtOrderDate.ClientID;
    }

    protected override void OnPreRender(EventArgs e)
    {
        for (int i = 0; i < calendars.Count; i++)
        {
            OboutInc.Calendar2.Calendar cal = calendars[i] as OboutInc.Calendar2.Calendar;
            OboutTextBox textbox = textboxes[i] as OboutTextBox;

            cal.TextBoxId = textbox.ClientID;
        }

        base.OnPreRender(e);
    }

    // Create the methods that will load the data into the templates
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
        TableCell oCell2 = new TableCell();
        TableCell oCell3 = new TableCell();

        // For Ship Information
        Panel oPanelShipInformation = new Panel();
        oPanelShipInformation.Attributes["style"] = "width: 315px; height: 100px";
        oPanelShipInformation.GroupingText = "&nbsp;";
        Table oTableShipInformation = new Table();

        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship Name:", "txtShipName"));
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship Address:", "txtShipAddress"));
        oTableShipInformation.Rows.Add(CreateTableRowWithCombobox("Ship Country:", "ddlCountries"));

        oPanelShipInformation.Controls.Add(oTableShipInformation);

        oCell1.VerticalAlign = VerticalAlign.Top;
        oCell1.Controls.Add(oPanelShipInformation);

        // For Ship Information
        Panel oPanelOrderInformation = new Panel();
        oPanelOrderInformation.Attributes["style"] = "width: 315px; height: 100px";
        oPanelOrderInformation.GroupingText = "&nbsp;";
        Table oTableOrderInformation = new Table();

        oTableOrderInformation.Rows.Add(CreateTableRowWithTextbox("Ship City:", "txtShipCity"));
        oTableOrderInformation.Rows.Add(CreateTableRowWithTextbox("Ship Region:", "txtShipRegion"));
        oTableOrderInformation.Rows.Add(CreateTableRowWithCalendar("Order Date:", "txtOrderDate", "gridCal1"));

        //oTableOrderInformation.Rows.Add(CreateEmptyTableRow());

        oPanelOrderInformation.Controls.Add(oTableOrderInformation);

        oCell2.VerticalAlign = VerticalAlign.Top;
        oCell2.Controls.Add(oPanelOrderInformation);

        oTr.Cells.Add(oCell1);
        oTr.Cells.Add(oCell2);

        oTable.Rows.Add(oTr);

        TableRow oTr3 = new TableRow();
        TableCell oCell3_1 = new TableCell();
        oCell3_1.ColumnSpan = 2;
        oCell3_1.HorizontalAlign = HorizontalAlign.Center;

        // For Additional Information

        Panel oPanelAdditionalInformation = new Panel();
        oPanelAdditionalInformation.Attributes["style"] = "width: 630px; height: 300px";
        oPanelAdditionalInformation.GroupingText = "Additional Information";

        oPanelAdditionalInformation.Controls.Add(CreateHTMLEditor("Additional Information", "EditorContent"));
        oCell3_1.Controls.Add(oPanelAdditionalInformation);

        Literal HiddenInput = new Literal();
        HiddenInput.Text = "<input type=\"hidden\" id=\"EditorContent\" />";
        oCell3_1.Controls.Add(HiddenInput);

        oTr3.Cells.Add(oCell3_1);


        TableRow oTr2 = new TableRow();
        TableCell oCell2_1 = new TableCell();
        oCell2_1.ColumnSpan = 2;
        oCell2_1.HorizontalAlign = HorizontalAlign.Center;


        System.Web.UI.WebControls.Button oSaveButton = new System.Web.UI.WebControls.Button();
        oSaveButton.CssClass = "tdText";
        oSaveButton.OnClientClick = "grid1.save();return false";
        oSaveButton.Text = "Save";

        Literal oSpacer = new Literal();
        oSpacer.Text = " ";

        System.Web.UI.WebControls.Button oCancelButton = new System.Web.UI.WebControls.Button();
        oCancelButton.CssClass = "tdText";
        oCancelButton.OnClientClick = "grid1.cancel();return false";
        oCancelButton.Text = "Cancel";

        oCell2_1.Controls.Add(oSaveButton);
        oCell2_1.Controls.Add(oSpacer);
        oCell2_1.Controls.Add(oCancelButton);


        oTr2.Controls.Add(oCell2_1);

        oTable.Rows.Add(oTr3);
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

        OboutTextBox oTextBox = new OboutTextBox();
        oTextBox.ID = sControlId;
        oTextBox.Width = Unit.Pixel(150);

        oCell2.Controls.Add(oTextBox);

        oTr.Cells.Add(oCell1);
        oTr.Cells.Add(oCell2);

        return oTr;
    }

    public TableRow CreateTableRowWithCombobox(string sLabelText, string sControlId)
    {
        TableRow oTr = new TableRow();
        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();

        Label oLabel = new Label();
        oLabel.Text = sLabelText;
        oCell1.Controls.Add(oLabel);

        OboutDropDownList ddlCountries = new OboutDropDownList();
        ddlCountries.ID = sControlId;
        ddlCountries.Width = Unit.Pixel(150);
        ddlCountries.Height = Unit.Pixel(200);
        ddlCountries.MenuWidth = Unit.Pixel(175);

        ddlCountries.DataSourceID = "sds1";
        ddlCountries.DataTextField = "ShipCountry";
        ddlCountries.DataValueField = "ShipCountry";

        oCell2.Controls.Add(ddlCountries);

        oTr.Cells.Add(oCell1);
        oTr.Cells.Add(oCell2);

        return oTr;
    }

    public TableRow CreateTableRowWithCalendar(string sLabelText, string sControlId, string sCalendarId)
    {
        TableRow oTr = new TableRow();
        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();
        TableCell oCell3 = new TableCell();

        Label oLabel = new Label();
        oLabel.Text = sLabelText;
        oCell1.Controls.Add(oLabel);

        OboutTextBox oTextBox = new OboutTextBox();
        oTextBox.ID = sControlId;
        oTextBox.Width = Unit.Pixel(150);

        oCell2.Controls.Add(oTextBox);

        OboutInc.Calendar2.Calendar cal1 = new OboutInc.Calendar2.Calendar();
        cal1.ID = sCalendarId;
        cal1.StyleFolder = "../Calendar/styles/expedia";
        cal1.DatePickerMode = true;
        cal1.DatePickerImagePath = "../Calendar/styles/icon2.gif";

        oCell3.Controls.Add(cal1);

        oTr.Cells.Add(oCell1);
        oTr.Cells.Add(oCell2);
        oTr.Cells.Add(oCell3);

        calendars.Add(cal1);
        textboxes.Add(oTextBox);

        return oTr;
    }

    public TableRow CreateTableRowWithCheckbox(string sLabelText, string sControlId)
    {
        TableRow oTr = new TableRow();
        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();

        Label oLabel = new Label();
        oLabel.Text = sLabelText;
        oCell1.Controls.Add(oLabel);

        CheckBox oCheckBox = new CheckBox();
        oCheckBox.ID = sControlId;
        oCell2.Controls.Add(oCheckBox);

        oTr.Cells.Add(oCell1);
        oTr.Cells.Add(oCell2);

        return oTr;
    }

    public Editor CreateHTMLEditor(string sLabelText, string sControlId)
    {

        Editor editor = new Editor();
        editor.ID = "Editor";
        editor.Height = 270;
        editor.Width = 550;
        editor.TopToolbar.Appearance = EditorTopToolbar.AppearanceType.Lite;

        return editor;
    }

    public TableRow CreateTableRowWithLabel(string sLabelText, string sControlId)
    {
        TableRow oTr = new TableRow();
        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();

        Label oLabel = new Label();
        oLabel.Text = sLabelText;
        oCell1.Controls.Add(oLabel);

        Label oLabel2 = new Label();
        oLabel2.ID = sControlId;
        oCell2.Controls.Add(oLabel2);

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
    //------------------------------------------------------------------------


    void BindGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateFormatted FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipRegion=@ShipRegion, ShipCountry = @ShipCountry, OrderDate=@OrderDate, AdditionalInformationHTML=@AdditionalInformationHTML WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDateFormatted"];
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record["AdditionalInformationHTML"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion,  ShipCountry, OrderDate, AdditionalInformationHTML) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipCountry,@OrderDate, @AdditionalInformationHTML)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDateFormatted"];
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record["AdditionalInformationHTML"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void RebindGrid(object sender, EventArgs e)
    {
        BindGrid();
    }
</script>

<html>
<head id="Head1" runat="server">
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
            background-color: ____:#f6f9fc;padding-left:4px;padding-right:4px;}
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
    </style>

   <script type="text/JavaScript">
       function onAddEdit() {
           
           var editorObject = $find(document.getElementById('EditorID').value);
           editorObject.set_content(document.getElementById('EditorContent').value);
       }

       function onBeforeInsertUpdate() {
           var editorObject = $find(document.getElementById('EditorID').value);
           document.getElementById('EditorContent').value = editorObject.get_content();
       }
       function onBeforeClientCancelEdit() {
           var editorObject = $find(document.getElementById('EditorID').value);
           var editPanel = editorObject.get_editPanel();
           editPanel.ensurePopupsClosed();
       }   
    </script>

</head>
<body>
    <form id="Form1" runat="server">
    <br />
    <span class="tdText"><b>ASP.NET Grid - HTML Editor in Row Template</b></span>
    <br />
    <br />
    
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <obout:PopupHolder runat="Server" ID="popupHolder" DefaultAddPolicy="Demand" />

    <asp:HiddenField ID="EditorID" runat="server" />
     
    <div style="display: none">
        <asp:PlaceHolder ID="phDummy" runat="server"></asp:PlaceHolder>
    </div>
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <span class="tdText">The HTML Editor can be used inside the Grid to edit fields that
        contain data in html format. </span>
    <br />
    <br />
    <br />
    <a href="Default.aspx?type=CSHARP">« Back to examples</a>
    </form>
</body>
</html>
