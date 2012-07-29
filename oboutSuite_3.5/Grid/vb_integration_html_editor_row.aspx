<%@ Page Language="VB" ValidateRequest="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.Popups" TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
<script language="VB" runat="server">
    Private grid1 As New Grid()
    Private dummyCal As New OboutInc.Calendar2.Calendar()
    Private calendars As New ArrayList()
    Private textboxes As New ArrayList()

    Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.TemplateSettings.RowEditTemplateId = "tplRowEdit"
    
        grid1.ClientSideEvents.OnClientEdit = "onAddEdit"
        grid1.ClientSideEvents.OnClientAdd = "onAddEdit"
        grid1.ClientSideEvents.OnBeforeClientUpdate = "onBeforeInsertUpdate"
        grid1.ClientSideEvents.OnBeforeClientInsert = "onBeforeInsertUpdate"
        grid1.ClientSideEvents.OnBeforeClientCancelEdit = "onBeforeClientCancelEdit"
    
        grid1.FolderStyle = ""
    
        ' setting the event handlers
        AddHandler grid1.InsertCommand, AddressOf InsertRecord
        AddHandler grid1.DeleteCommand, AddressOf DeleteRecord
        AddHandler grid1.UpdateCommand, AddressOf UpdateRecord
        AddHandler grid1.Rebind, AddressOf RebindGrid
    
    
        ' creating the Template for editing Rows
        '------------------------------------------------------------------------
        Dim RowEditTemplate As New GridRuntimeTemplate()
        RowEditTemplate.ID = "tplRowEdit"
        RowEditTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler RowEditTemplate.Template.CreateTemplate, AddressOf CreateRowEditTemplate
        '------------------------------------------------------------------------
    
    
        grid1.Templates.Add(RowEditTemplate)
    
    
        ' creating the columns
        Dim oCol1 As New Column()
        oCol1.DataField = "OrderID"
        oCol1.[ReadOnly] = True
        oCol1.Visible = False
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "150"
    
        Dim oCol2 As New Column()
        oCol2.DataField = "ShipName"
        oCol2.Visible = True
        oCol2.HeaderText = "NAME"
        oCol2.Width = "150"
        oCol2.TemplateSettings.RowEditTemplateControlId = "txtShipName"
        oCol2.TemplateSettings.RowEditTemplateControlPropertyName = "value"
    
        Dim oCol3 As New Column()
        oCol3.DataField = "ShipAddress"
        oCol3.HeaderText = "ADDRESS"
        oCol3.Width = "160"
        oCol3.TemplateSettings.RowEditTemplateControlId = "txtShipAddress"
        oCol3.TemplateSettings.RowEditTemplateControlPropertyName = "value"
    
        Dim oCol4 As New Column()
        oCol4.DataField = "ShipCity"
        oCol4.Visible = False
        oCol4.HeaderText = "CITY"
        oCol4.Width = "150"
        oCol4.TemplateSettings.RowEditTemplateControlId = "txtShipCity"
        oCol4.TemplateSettings.RowEditTemplateControlPropertyName = "value"
    
        Dim oCol5 As New Column()
        oCol5.DataField = "ShipRegion"
        oCol5.Visible = False
        oCol5.HeaderText = "REGION"
        oCol5.Width = "150"
        oCol5.TemplateSettings.RowEditTemplateControlId = "txtShipRegion"
        oCol5.TemplateSettings.RowEditTemplateControlPropertyName = "value"
    
        Dim oCol8 As New Column()
        oCol8.DataField = "OrderDateFormatted"
        oCol8.Visible = True
        oCol8.HeaderText = "ORDER DATE"
        oCol8.Width = "160"
        oCol8.TemplateSettings.RowEditTemplateControlId = "txtOrderDate"
        oCol8.TemplateSettings.RowEditTemplateControlPropertyName = "value"
    
        Dim oCol7 As New Column()
        oCol7.DataField = "ShipCountry"
        oCol7.Visible = True
        oCol7.HeaderText = "COUNTRY"
        oCol7.Width = "150"
        oCol7.TemplateSettings.RowEditTemplateControlId = "ddlCountries"
        oCol7.TemplateSettings.RowEditTemplateControlPropertyName = "value"
    
        Dim oCol13 As New Column()
        oCol13.DataField = "AdditionalInformationHTML"
        oCol13.Visible = False
        oCol13.HeaderText = "ADDITIONAL INFORMATION"
        oCol13.Width = "200"
        oCol13.TemplateSettings.RowEditTemplateControlId = "EditorContent"
        oCol13.TemplateSettings.RowEditTemplateControlPropertyName = "value"
    
        Dim oCol14 As New Column()
        oCol14.DataField = ""
        oCol14.Visible = True
        oCol14.HeaderText = "EDIT"
        oCol14.Width = "150"
        oCol14.AllowEdit = True
        oCol14.AllowDelete = True
    
    
        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol7)
        grid1.Columns.Add(oCol8)
        grid1.Columns.Add(oCol13)
        grid1.Columns.Add(oCol14)
    
        ' add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1)
    
        dummyCal.ID = "dummyCal"
        phDummy.Controls.Add(dummyCal)
    
        If Not Page.IsPostBack Then
            BindGrid()
        End If
        
        EditorID.Value = CType(grid1.Templates(0).Container.FindControl("Editor"), Editor).ClientID
   
    End Sub

    Protected Overloads Overrides Sub OnPreRender(ByVal e As EventArgs)
        For i As Integer = 0 To calendars.Count - 1
            Dim cal As OboutInc.Calendar2.Calendar = TryCast(calendars(i), OboutInc.Calendar2.Calendar)
            Dim textbox As OboutTextBox = TryCast(textboxes(i), OboutTextBox)
        
            cal.TextBoxId = textbox.ClientID
        Next
    
        MyBase.OnPreRender(e)
    End Sub

    ' Create the methods that will load the data into the templates
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
        Dim oCell2 As New TableCell()
        Dim oCell3 As New TableCell()
    
        ' For Ship Information
        Dim oPanelShipInformation As New Panel()
        oPanelShipInformation.Attributes("style") = "width: 315px; height: 100px"
        oPanelShipInformation.GroupingText = "&nbsp;"
        Dim oTableShipInformation As New Table()
    
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship Name:", "txtShipName"))
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship Address:", "txtShipAddress"))
        oTableShipInformation.Rows.Add(CreateTableRowWithCombobox("Ship Country:", "ddlCountries"))
    
        oPanelShipInformation.Controls.Add(oTableShipInformation)
    
        oCell1.VerticalAlign = VerticalAlign.Top
        oCell1.Controls.Add(oPanelShipInformation)
    
        ' For Ship Information
        Dim oPanelOrderInformation As New Panel()
        oPanelOrderInformation.Attributes("style") = "width: 315px; height: 100px"
        oPanelOrderInformation.GroupingText = "&nbsp;"
        Dim oTableOrderInformation As New Table()
    
        oTableOrderInformation.Rows.Add(CreateTableRowWithTextbox("Ship City:", "txtShipCity"))
        oTableOrderInformation.Rows.Add(CreateTableRowWithTextbox("Ship Region:", "txtShipRegion"))
        oTableOrderInformation.Rows.Add(CreateTableRowWithCalendar("Order Date:", "txtOrderDate", "gridCal1"))
    
        'oTableOrderInformation.Rows.Add(CreateEmptyTableRow());
    
        oPanelOrderInformation.Controls.Add(oTableOrderInformation)
    
        oCell2.VerticalAlign = VerticalAlign.Top
        oCell2.Controls.Add(oPanelOrderInformation)
    
        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)
    
        oTable.Rows.Add(oTr)
    
        Dim oTr3 As New TableRow()
        Dim oCell3_1 As New TableCell()
        oCell3_1.ColumnSpan = 2
        oCell3_1.HorizontalAlign = HorizontalAlign.Center
    
        ' For Additional Information
    
        Dim oPanelAdditionalInformation As New Panel()
        oPanelAdditionalInformation.Attributes("style") = "width: 630px; height: 300px"
        oPanelAdditionalInformation.GroupingText = "Additional Information"
    
        oPanelAdditionalInformation.Controls.Add(CreateHTMLEditor("Additional Information", "EditorContent"))
        oCell3_1.Controls.Add(oPanelAdditionalInformation)
        
        Dim HiddenInput As Literal = New Literal()
        HiddenInput.Text = "<input type=""hidden"" id=""EditorContent"" />"
        oCell3_1.Controls.Add(HiddenInput)
        
        oTr3.Cells.Add(oCell3_1)
    
    
        Dim oTr2 As New TableRow()
        Dim oCell2_1 As New TableCell()
        oCell2_1.ColumnSpan = 2
        oCell2_1.HorizontalAlign = HorizontalAlign.Center
    
    
        Dim oSaveButton As New System.Web.UI.WebControls.Button()
        oSaveButton.CssClass = "tdText"
        oSaveButton.OnClientClick = "grid1.save();return false"
        oSaveButton.Text = "Save"
    
        Dim oSpacer As New Literal()
        oSpacer.Text = " "
    
        Dim oCancelButton As New System.Web.UI.WebControls.Button()
        oCancelButton.CssClass = "tdText"
        oCancelButton.OnClientClick = "grid1.cancel();return false"
        oCancelButton.Text = "Cancel"
    
        oCell2_1.Controls.Add(oSaveButton)
        oCell2_1.Controls.Add(oSpacer)
        oCell2_1.Controls.Add(oCancelButton)
    
    
        oTr2.Controls.Add(oCell2_1)
    
        oTable.Rows.Add(oTr3)
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
    
        Dim oTextBox As New OboutTextBox()
        oTextBox.ID = sControlId
        oTextBox.Width = Unit.Pixel(150)
    
        oCell2.Controls.Add(oTextBox)
    
        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)
    
        Return oTr
    End Function

    Public Function CreateTableRowWithCombobox(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As New TableRow()
        Dim oCell1 As New TableCell()
        Dim oCell2 As New TableCell()
    
        Dim oLabel As New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)
    
        Dim ddlCountries As New OboutDropDownList()
        ddlCountries.ID = sControlId
        ddlCountries.Width = Unit.Pixel(150)
        ddlCountries.Height = Unit.Pixel(200)
        ddlCountries.MenuWidth = Unit.Pixel(175)
    
        ddlCountries.DataSourceID = "sds1"
        ddlCountries.DataTextField = "ShipCountry"
        ddlCountries.DataValueField = "ShipCountry"
    
        oCell2.Controls.Add(ddlCountries)
    
        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)
    
        Return oTr
    End Function

    Public Function CreateTableRowWithCalendar(ByVal sLabelText As String, ByVal sControlId As String, ByVal sCalendarId As String) As TableRow
        Dim oTr As New TableRow()
        Dim oCell1 As New TableCell()
        Dim oCell2 As New TableCell()
        Dim oCell3 As New TableCell()
    
        Dim oLabel As New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)
    
        Dim oTextBox As New OboutTextBox()
        oTextBox.ID = sControlId
        oTextBox.Width = Unit.Pixel(150)
    
        oCell2.Controls.Add(oTextBox)
    
        Dim cal1 As New OboutInc.Calendar2.Calendar()
        cal1.ID = sCalendarId
        cal1.StyleFolder = "../Calendar/styles/expedia"
        cal1.DatePickerMode = True
        cal1.DatePickerImagePath = "../Calendar/styles/icon2.gif"
    
        oCell3.Controls.Add(cal1)
    
        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)
        oTr.Cells.Add(oCell3)
    
        calendars.Add(cal1)
        textboxes.Add(oTextBox)
    
        Return oTr
    End Function

    Public Function CreateTableRowWithCheckbox(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As New TableRow()
        Dim oCell1 As New TableCell()
        Dim oCell2 As New TableCell()
    
        Dim oLabel As New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)
    
        Dim oCheckBox As New CheckBox()
        oCheckBox.ID = sControlId
        oCell2.Controls.Add(oCheckBox)
    
        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)
    
        Return oTr
    End Function

    Public Function CreateHTMLEditor(ByVal sLabelText As String, ByVal sControlId As String) As Editor
    
        Dim editor__1 As New Editor()
        editor__1.ID = "Editor"
        editor__1.Height = 270
        editor__1.Width = 550
        editor__1.TopToolbar.Appearance = EditorTopToolbar.AppearanceType.Lite

        Return editor__1
    End Function

    Public Function CreateTableRowWithLabel(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As New TableRow()
        Dim oCell1 As New TableCell()
        Dim oCell2 As New TableCell()
    
        Dim oLabel As New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)
    
        Dim oLabel2 As New Label()
        oLabel2.ID = sControlId
        oCell2.Controls.Add(oLabel2)
    
        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)
    
        Return oTr
    End Function

    Public Function CreateEmptyTableRow() As TableRow
        Dim oTr As New TableRow()
        Dim oCell1 As New TableCell()
        oCell1.ColumnSpan = 2
    
        Dim oLiteral As New Literal()
        oLiteral.Text = "<br />"
    
        oCell1.Controls.Add(oLiteral)
        oTr.Cells.Add(oCell1)
    
        Return oTr
    End Function
    '------------------------------------------------------------------------


    Private Sub BindGrid()
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, ""mm/dd/yyyy"") AS OrderDateFormatted FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
    
        grid1.DataSource = myReader
        grid1.DataBind()
    
        myConn.Close()
    End Sub

    Private Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)
    
        myComm.Parameters.Add("@OrderID", OleDbType.[Integer]).Value = e.Record("OrderID")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    Private Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipRegion=@ShipRegion, ShipCountry = @ShipCountry, OrderDate=@OrderDate, AdditionalInformationHTML=@AdditionalInformationHTML WHERE OrderID = @OrderID", myConn)
    
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record("ShipAddress")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record("ShipRegion")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderDate", OleDbType.[Date]).Value = e.Record("OrderDateFormatted")
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record("AdditionalInformationHTML")
        myComm.Parameters.Add("@OrderID", OleDbType.[Integer]).Value = e.Record("OrderID")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Private Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion,  ShipCountry, OrderDate, AdditionalInformationHTML) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipCountry,@OrderDate, @AdditionalInformationHTML)", myConn)
    
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record("ShipAddress")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record("ShipRegion")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderDate", OleDbType.[Date]).Value = e.Record("OrderDateFormatted")
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record("AdditionalInformationHTML")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    Private Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        BindGrid()
    End Sub
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
    <a href="Default.aspx?type=VBNET">« Back to examples</a>
    </form>
</body>
</html>
