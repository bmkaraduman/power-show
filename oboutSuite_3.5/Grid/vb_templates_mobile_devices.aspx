<%@ Page Language="VB" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">

    Private grid1 As New Grid()

    Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
    
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.AllowPageSizeSelection = False
        grid1.PageSize = 5
    
    
        grid1.TemplateSettings.RowEditTemplateId = "tplRowEdit"
    
        grid1.FolderStyle = "styles/grand_gray"
    
        ' setting the event handlers
    
        AddHandler grid1.UpdateCommand, AddressOf UpdateRecord
        AddHandler grid1.Rebind, AddressOf RebindGrid
    
        ' creating the Template to Show Records.
        '------------------------------------------------------------------------
        Dim FormTemplate As New GridRuntimeTemplate()
        FormTemplate.ID = "tplFormView"
        FormTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler FormTemplate.Template.CreateTemplate, AddressOf CreateFormViewTemplate
    
        ' creating the Template for editing Rows
        '------------------------------------------------------------------------
        Dim RowEditTemplate As New GridRuntimeTemplate()
        RowEditTemplate.ID = "tplRowEdit"
        RowEditTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler RowEditTemplate.Template.CreateTemplate, AddressOf CreateRowEditTemplate
        '------------------------------------------------------------------------
    
    
        grid1.Templates.Add(RowEditTemplate)
        grid1.Templates.Add(FormTemplate)
    
        ' creating the columns
        Dim oCol1 As New Column()
        oCol1.DataField = "OrderID"
        oCol1.[ReadOnly] = False
        oCol1.Visible = True
        oCol1.HeaderText = "SHIP INFORMATION"
        oCol1.Width = "250"
        oCol1.TemplateSettings.TemplateId = "tplFormView"
        oCol1.TemplateSettings.RowEditTemplateControlId = "lblEditID"
        oCol1.TemplateSettings.RowEditTemplateControlPropertyName = "innerHTML"
    
        Dim oCol2 As New Column()
        oCol2.DataField = "ShipName"
        oCol2.Visible = False
        oCol2.HeaderText = "NAME"
        oCol2.Width = "125"
        oCol2.TemplateSettings.RowEditTemplateControlId = "txtShipName"
        oCol2.TemplateSettings.RowEditTemplateControlPropertyName = "value"
    
        Dim oCol3 As New Column()
        oCol3.DataField = "ShipAddress"
        oCol3.Visible = False
        oCol3.HeaderText = "ADDRESS"
        oCol3.Width = "125"
        oCol3.TemplateSettings.RowEditTemplateControlId = "txtShipAddress"
        oCol3.TemplateSettings.RowEditTemplateControlPropertyName = "value"
    
        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
    
        ' add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1)
    
    
        If Not Page.IsPostBack Then
            CreateGrid()
        End If
    End Sub

    Private Sub CreateFormViewTemplate(ByVal sender As Object, ByVal e As GridRuntimeTemplateEventArgs)
        Dim oPH1 As New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler oPH1.DataBinding, AddressOf DataBindFormViewTemplate
    End Sub


    ' Create the methods that will load the data into the ViewTemplates
    '------------------------------------------------------------------------
    Protected Sub DataBindFormViewTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = TryCast(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
    
        Dim oTable As New Table()
        oTable.CssClass = "rowEditTable"
    
        Dim oTr As New TableRow()
    
        Dim oCell1 As New TableCell()
    
        ' For Ship Information
        Dim oTableShipInformation As New Table()
    
        oTableShipInformation.Rows.Add(CreateTableRowWithLabel("ID:", "lblID", oContainer.DataItem("OrderID").ToString()))
        oTableShipInformation.Rows.Add(CreateTableRowWithLabel("Name:", "lblShipName", oContainer.DataItem("ShipName").ToString()))
        oTableShipInformation.Rows.Add(CreateTableRowWithLabel("Address:", "lblShipAddress", oContainer.DataItem("ShipAddress").ToString()))
    
        oCell1.Controls.Add(oTableShipInformation)
        oTr.Cells.Add(oCell1)
        oTable.Rows.Add(oTr)
    
        Dim oTr2 As New TableRow()
        Dim oCell2_1 As New TableCell()
        'oCell2_1.ColumnSpan = 2;
        oCell2_1.HorizontalAlign = HorizontalAlign.Left
    
        Dim oSaveEdit As New Button()
        oSaveEdit.CssClass = "tdTextSmall"
        oSaveEdit.OnClientClick = "grid1.editRecord(" & oContainer.PageRecordIndex & ");return false"
        oSaveEdit.Text = "Edit"
    
        oCell2_1.Controls.Add(oSaveEdit)
    
        oTr2.Controls.Add(oCell2_1)
        oTable.Rows.Add(oTr2)
    
        oPH1.Controls.Add(oTable)
    End Sub

    ' Create the methods that will load the data into the EditTemplates
    '------------------------------------------------------------------------
    Public Sub CreateRowEditTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler oPH1.DataBinding, AddressOf DataBindRowEditTemplate
    End Sub

    Protected Sub DataBindRowEditTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = TryCast(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
    
        Dim oTable As New Table()
        oTable.CssClass = "rowEditTable"
    
        Dim oTr As New TableRow()
    
        Dim oCell1 As New TableCell()
    
        ' For Ship Information
        Dim oPanelShipInformation As New Panel()
        oPanelShipInformation.GroupingText = "Ship Information"
        Dim oTableShipInformation As New Table()
    
        oTableShipInformation.Rows.Add(CreateTableRowWithLabel("ID:", "lblEditID", Nothing))
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Name:", "txtShipName"))
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Address:", "txtShipAddress"))
    
        oPanelShipInformation.Controls.Add(oTableShipInformation)
        oCell1.Controls.Add(oPanelShipInformation)
    
        oTr.Cells.Add(oCell1)
        oTable.Rows.Add(oTr)
    
        Dim oTr2 As New TableRow()
        Dim oCell2_1 As New TableCell()
        oCell2_1.ColumnSpan = 3
        oCell2_1.HorizontalAlign = HorizontalAlign.Center
    
        Dim oSaveButton As New Button()
        oSaveButton.CssClass = "tdTextSmall"
        oSaveButton.OnClientClick = "grid1.save();return false"
        oSaveButton.Text = "Save"
    
        Dim oSpacer As New Literal()
        oSpacer.Text = " "
    
        Dim oCancelButton As New Button()
        oCancelButton.CssClass = "tdTextSmall"
        oCancelButton.OnClientClick = "grid1.cancel();return false"
        oCancelButton.Text = "Cancel"
    
        oCell2_1.Controls.Add(oSaveButton)
        oCell2_1.Controls.Add(oSpacer)
        oCell2_1.Controls.Add(oCancelButton)
        oTr2.Controls.Add(oCell2_1)
    
        oTable.Rows.Add(oTr2)
    
        oPH1.Controls.Add(oTable)
    End Sub

    Public Function CreateTableRowWithTextbox(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As New TableRow()
        Dim oCell1 As New TableCell()
        Dim oCell2 As New TableCell()
    
        Dim oLabel As New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)
    
        Dim oTextBox As New TextBox()
        oTextBox.ID = sControlId
        oTextBox.CssClass = "ob_gEC"
        oCell2.Controls.Add(oTextBox)
    
        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)
    
        Return oTr
    End Function

    Public Function CreateTableRowWithLabel(ByVal sLabelText As String, ByVal sControlId As String, ByVal sValue As String) As TableRow
        Dim oTr As New TableRow()
        Dim oCell1 As New TableCell()
        Dim oCell2 As New TableCell()
    
        Dim oLabel As New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)
    
        Dim oLabel2 As New Label()
        oLabel2.ID = sControlId
    
        If sValue IsNot Nothing Then
            oLabel2.Text = sValue
        End If
    
        oCell2.Controls.Add(oLabel2)
    
        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)
    
        Return oTr
    End Function

    Private Sub CreateGrid()
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, ""mm/dd/yyyy"") AS OrderDateFormatted, FORMAT(RequiredDate, ""mm/dd/yyyy"") AS RequiredDateFormatted, FORMAT(ShippedDate, ""mm/dd/yyyy"") AS ShippedDateFormatted FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
    
        grid1.DataSource = myReader
        grid1.DataBind()
    
        myConn.Close()
    End Sub

    Private Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress WHERE OrderID = @OrderID", myConn)
    
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record("ShipAddress")
        myComm.Parameters.Add("@OrderID", OleDbType.[Integer]).Value = e.Record("OrderID")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Private Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        CreateGrid()
    End Sub


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
    
    <a href="Default.aspx?type=VBNET">« Back to examples</a>
    
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
