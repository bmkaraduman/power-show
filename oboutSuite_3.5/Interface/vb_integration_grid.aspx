<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim dummyCal As OboutInc.Calendar2.Calendar = New OboutInc.Calendar2.Calendar()
    Dim calendars As ArrayList = New ArrayList()
    Dim textboxes As ArrayList = New ArrayList()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.EnableRecordHover = True
        grid1.AllowFiltering = True
        
        grid1.FolderStyle = "../Grid/styles/premiere_blue"
        
        grid1.TemplateSettings.RowEditTemplateId = "tplRowEdit"
        grid1.TemplateSettings.NewRecord_TemplateId = "addTemplate"
        grid1.TemplateSettings.NewRecord_EditTemplateId = "saveTemplate"
        grid1.TemplateSettings.FilterShowButton_TemplateId = "tplShowFilter"
        grid1.TemplateSettings.FilterApplyButton_TemplateId = "tplApplyFilter"
        grid1.TemplateSettings.FilterHideButton_TemplateId = "tplHideFilter"
        grid1.TemplateSettings.FilterRemoveButton_TemplateId = "tplRemoveFilter"

        ' setting the event handlers
        AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
        AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
        AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
				
		        
        
        ' creating the Template for editing Rows
        '------------------------------------------------------------------------
        Dim RowEditTemplate As Obout.Grid.GridRuntimeTemplate
        RowEditTemplate = New GridRuntimeTemplate()
        RowEditTemplate.ID = "tplRowEdit"
        RowEditTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(RowEditTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateRowEditTemplate
        '------------------------------------------------------------------------
        
        Dim ButtonsTemplate As Obout.Grid.GridRuntimeTemplate
        ButtonsTemplate = New GridRuntimeTemplate()
        ButtonsTemplate.ID = "ButtonsTemplate"
        ButtonsTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(ButtonsTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateButtonsTemplate
        
        Dim ButtonsEditTemplate As Obout.Grid.GridRuntimeTemplate
        ButtonsEditTemplate = New GridRuntimeTemplate()
        ButtonsEditTemplate.ID = "ButtonsEditTemplate"
        ButtonsEditTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(ButtonsEditTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateButtonsEditTemplate
        
        Dim addTemplate As Obout.Grid.GridRuntimeTemplate
        addTemplate = New GridRuntimeTemplate()
        addTemplate.ID = "addTemplate"
        addTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(addTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateAddTemplate
        
        Dim saveTemplate As Obout.Grid.GridRuntimeTemplate
        saveTemplate = New GridRuntimeTemplate()
        saveTemplate.ID = "saveTemplate"
        saveTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(saveTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateSaveTemplate
        
        Dim tplShowFilter As Obout.Grid.GridRuntimeTemplate
        tplShowFilter = New GridRuntimeTemplate()
        tplShowFilter.ID = "tplShowFilter"
        tplShowFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplShowFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTplShowFilter
        
        Dim tplApplyFilter As Obout.Grid.GridRuntimeTemplate
        tplApplyFilter = New GridRuntimeTemplate()
        tplApplyFilter.ID = "tplApplyFilter"
        tplApplyFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplApplyFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTplApplyFilter
        
        Dim tplHideFilter As Obout.Grid.GridRuntimeTemplate
        tplHideFilter = New GridRuntimeTemplate()
        tplHideFilter.ID = "tplHideFilter"
        tplHideFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplHideFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTplHideFilter
        
        Dim tplRemoveFilter As Obout.Grid.GridRuntimeTemplate
        tplRemoveFilter = New GridRuntimeTemplate()
        tplRemoveFilter.ID = "tplRemoveFilter"
        tplRemoveFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplRemoveFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTplRemoveFilter

        
        grid1.Templates.Add(RowEditTemplate)
        grid1.Templates.Add(ButtonsTemplate)
        grid1.Templates.Add(ButtonsEditTemplate)
        grid1.Templates.Add(addTemplate)
        grid1.Templates.Add(saveTemplate)
        grid1.Templates.Add(tplShowFilter)
        grid1.Templates.Add(tplApplyFilter)
        grid1.Templates.Add(tplHideFilter)
        grid1.Templates.Add(tplRemoveFilter)
		
																						
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "OrderID"
		oCol1.ReadOnly = true
        oCol1.Visible = false
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "150"
        oCol1.TemplateSettings.RowEditTemplateControlId = "txtOrderID"
        oCol1.TemplateSettings.RowEditTemplateControlPropertyName = "innerHTML"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"        
        oCol2.Visible = true
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"
        oCol2.TemplateSettings.RowEditTemplateControlId = "txtShipName"
        oCol2.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipAddress"        
        oCol3.Visible = false
        oCol3.HeaderText = "ADDRESS"
        oCol3.Width = "125"
        oCol3.TemplateSettings.RowEditTemplateControlId = "txtShipAddress"
        oCol3.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCity"        
        oCol4.Visible = true
        oCol4.HeaderText = "CITY"
        oCol4.Width = "150"
        oCol4.TemplateSettings.RowEditTemplateControlId = "txtShipCity"
        oCol4.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipRegion"
        oCol5.Visible = false
        oCol5.HeaderText = "REGION"
        oCol5.Width = "150"
        oCol5.TemplateSettings.RowEditTemplateControlId = "txtShipRegion"
        oCol5.TemplateSettings.RowEditTemplateControlPropertyName = "value"
        
        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipPostalCode"
        oCol6.Visible = true
        oCol6.HeaderText = "POSTAL CODE"
        oCol6.Width = "150"
        oCol6.TemplateSettings.RowEditTemplateControlId = "txtShipPostalCode"
        oCol6.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol7 As Column = New Column()
        oCol7.DataField = "ShipCountry"
        oCol7.Visible = true
        oCol7.HeaderText = "COUNTRY"
        oCol7.Width = "175"
        oCol7.TemplateSettings.RowEditTemplateControlId = "ddlCountries"
        oCol7.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol8 As Column = New Column()
        oCol8.DataField = "OrderDateFormatted"
        oCol8.Visible = true
        oCol8.HeaderText = "ORDER DATE"
        oCol8.Width = "175"
        oCol8.TemplateSettings.RowEditTemplateControlId = "txtOrderDate"
        oCol8.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol9 As Column = New Column()
        oCol9.DataField = "RequiredDateFormatted"
        oCol9.Visible = false
        oCol9.HeaderText = "REQUIRED DATE"
        oCol9.Width = "200"
        oCol9.TemplateSettings.RowEditTemplateControlId = "txtRequiredDate"
        oCol9.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol10 As Column = New Column()
        oCol10.DataField = "ShippedDateFormatted"
        oCol10.Visible = false
        oCol10.HeaderText = "SHIPPED DATE"
        oCol10.Width = "200"
        oCol10.TemplateSettings.RowEditTemplateControlId = "txtShippedDate"
        oCol10.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol11 As Column = New Column()
        oCol11.DataField = "ShipVia"
        oCol11.Visible = false
        oCol11.HeaderText = "SHIP VIA"
        oCol11.Width = "200"
        oCol11.TemplateSettings.RowEditTemplateControlId = "txtShipVia"
        oCol11.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol12 As Column = New Column()
        oCol12.DataField = "Sent"
        oCol12.Visible = false
        oCol12.HeaderText = "SENT"
        oCol12.Width = "175"
        oCol12.TemplateSettings.RowEditTemplateControlId = "txtSent"
        oCol12.TemplateSettings.RowEditTemplateControlPropertyName = "checked"
        oCol12.TemplateSettings.RowEditTemplateUseQuotes = False

        Dim oCol13 As Column = New Column()
        oCol13.DataField = "AdditionalInformation"
        oCol13.Visible = false
        oCol13.HeaderText = "ADDITIONAL INFORMATION"
        oCol13.Width = "200"
        oCol13.TemplateSettings.RowEditTemplateControlId = "txtAdditionalInformation"
        oCol13.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol14 As Column = New Column()
        oCol14.DataField = ""
        oCol14.Visible = true
        oCol14.HeaderText = "EDIT"
        oCol14.Width = "200"
        oCol14.AllowEdit = true
        oCol14.AllowDelete = true
        oCol14.TemplateSettings.TemplateId = "ButtonsTemplate"
        oCol14.TemplateSettings.EditTemplateId = "ButtonsEditTemplate"
		

        ' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
		grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)
        grid1.Columns.Add(oCol8)
        grid1.Columns.Add(oCol9)
        grid1.Columns.Add(oCol10)
        grid1.Columns.Add(oCol11)
        grid1.Columns.Add(oCol12)
        grid1.Columns.Add(oCol13)
        grid1.Columns.Add(oCol14)

        ' add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1)
        
        dummyCal.ID = "dummyCal"
        phDummy.Controls.Add(dummyCal)
				
        If Not Page.IsPostBack Then
            BindGrid()
        End If
    End Sub
    
    Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
        Dim i As Integer
        For i = 0 To calendars.Count - 1
            Dim cal As OboutInc.Calendar2.Calendar = CType(calendars(i), OboutInc.Calendar2.Calendar)
            Dim textbox As OboutTextBox = CType(textboxes(i), OboutTextBox)

            cal.TextBoxId = textbox.ClientID
        Next
    End Sub

	' Create the methods that will load the data into the templates
    '------------------------------------------------------------------------
    Sub CreateButtonsTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindButtonsTemplate
    End Sub
    Public Sub DataBindButtonsTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim OboutButton1 As OboutButton = New OboutButton()
        OboutButton1.Text = "Edit"
        OboutButton1.OnClientClick = "return editRecord(this)"
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton"
        OboutButton1.Width = Unit.Pixel(70)
        
        Dim spacer As Literal = New Literal()
        spacer.Text = " &#160 "
        
        Dim OboutButton2 As OboutButton = New OboutButton()
        OboutButton2.Text = "Delete"
        OboutButton2.OnClientClick = "return deleteRecord(this)"
        OboutButton2.FolderStyle = "styles/premiere_blue/OboutButton"
        OboutButton2.Width = Unit.Pixel(70)
        
        oPH1.Controls.Add(OboutButton1)
        oPH1.Controls.Add(spacer)
        oPH1.Controls.Add(OboutButton2)
    End Sub
    
    Sub CreateButtonsEditTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindButtonsEditTemplate
    End Sub
    Public Sub DataBindButtonsEditTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim OboutButton1 As OboutButton = New OboutButton()
        OboutButton1.ID = "BtnUpdate"
        OboutButton1.Text = "Update"
        OboutButton1.OnClientClick = "return updateRecord(this, 'BtnUpdate');"
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton"
        OboutButton1.Width = Unit.Pixel(70)
        
        Dim spacer As Literal = New Literal()
        spacer.Text = " &#160 "
        
        Dim OboutButton2 As OboutButton = New OboutButton()
        OboutButton2.ID = "BtnCancel"
        OboutButton2.Text = "Cancel"
        OboutButton2.OnClientClick = "return cancelEdit(this, 'BtnCancel');"
        OboutButton2.FolderStyle = "styles/premiere_blue/OboutButton"
        OboutButton2.Width = Unit.Pixel(70)
        
        oPH1.Controls.Add(OboutButton1)
        oPH1.Controls.Add(spacer)
        oPH1.Controls.Add(OboutButton2)
    End Sub
    
    Sub CreateAddTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindAddTemplate
    End Sub
    Public Sub DataBindAddTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim OboutButton1 As OboutButton = New OboutButton()
        OboutButton1.ID = "BtnAddNew"
        OboutButton1.Text = "Add New"
        OboutButton1.OnClientClick = "return addNew('BtnAddNew');"
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton"
        
        oPH1.Controls.Add(OboutButton1)
    End Sub
    
    Sub CreateSaveTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindSaveTemplate
    End Sub
    Public Sub DataBindSaveTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim OboutButton1 As OboutButton = New OboutButton()
        OboutButton1.ID = "BtnSaveNew"
        OboutButton1.Text = "Save"
        OboutButton1.OnClientClick = "return saveNew('BtnSaveNew');"
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton"
        
        Dim spacer As Literal = New Literal()
        spacer.Text = " &#160 "
        
        Dim OboutButton2 As OboutButton = New OboutButton()
        OboutButton2.ID = "BtnCancelNew"
        OboutButton2.Text = "Cancel"
        OboutButton2.OnClientClick = "return cancelNew('BtnCancelNew');"
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton"
        
        oPH1.Controls.Add(OboutButton1)
        oPH1.Controls.Add(spacer)
        oPH1.Controls.Add(OboutButton2)
    End Sub
    
    Sub CreateTplShowFilter(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindTplShowFilter
    End Sub
    Public Sub DataBindTplShowFilter(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim OboutButton1 As OboutButton = New OboutButton()
        OboutButton1.ID = "BtnShowFilter"
        OboutButton1.Text = "Show Filter"
        OboutButton1.OnClientClick = "return showFilter('BtnShowFilter');"
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton"
        
        oPH1.Controls.Add(OboutButton1)
    End Sub
    
    Sub CreateTplApplyFilter(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindTplApplyFilter
    End Sub
    Public Sub DataBindTplApplyFilter(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim OboutButton1 As OboutButton = New OboutButton()
        OboutButton1.ID = "BtnApplyFilter"
        OboutButton1.Text = "Apply Filter"
        OboutButton1.OnClientClick = "return applyFilter('BtnApplyFilter');"
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton"
        
        oPH1.Controls.Add(OboutButton1)
    End Sub
    
    Sub CreateTplHideFilter(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindTplHideFilter
    End Sub
    Public Sub DataBindTplHideFilter(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim OboutButton1 As OboutButton = New OboutButton()
        OboutButton1.ID = "BtnHideFilter"
        OboutButton1.Text = "Hide Filter"
        OboutButton1.OnClientClick = "return hideFilter('BtnHideFilter');"
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton"
        
        oPH1.Controls.Add(OboutButton1)
    End Sub
    
    Sub CreateTplRemoveFilter(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindTplRemoveFilter
    End Sub
    Public Sub DataBindTplRemoveFilter(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim OboutButton1 As OboutButton = New OboutButton()
        OboutButton1.ID = "BtnRemoveFilter"
        OboutButton1.Text = "Remove Filter"
        OboutButton1.OnClientClick = "return removeFilter('BtnRemoveFilter');"
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton"
        
        oPH1.Controls.Add(OboutButton1)
    End Sub
    
    
    
    Sub CreateRowEditTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindRowEditTemplate
    End Sub
    
    Public Sub DataBindRowEditTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim oTable As Table = New Table()
        oTable.CssClass = "rowEditTable"

        Dim oTr As TableRow = New TableRow()

        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()
        Dim oCell3 As TableCell = New TableCell()

        ' For Ship Information
        Dim oPanelShipInformation As Panel = New Panel()
        oPanelShipInformation.Attributes("style") = "width: 300px; height: 180px"
        oPanelShipInformation.GroupingText = "Ship Information"
        Dim oTableShipInformation As Table = New Table()

        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship Name:", "txtShipName"))
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship Address:", "txtShipAddress"))
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship City:", "txtShipCity"))
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship Region:", "txtShipRegion"))
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship Postal Code:", "txtShipPostalCode"))
        oTableShipInformation.Rows.Add(CreateTableRowWithCombobox("Ship Country:", "ddlCountries"))
        oTableShipInformation.Rows.Add(CreateEmptyTableRow())

        oPanelShipInformation.Controls.Add(oTableShipInformation)
        oCell1.Controls.Add(oPanelShipInformation)

        ' For Ship Information
        Dim oPanelOrderInformation As Panel = New Panel()
        oPanelOrderInformation.Attributes("style") = "width: 300px; height: 180px"
        oPanelOrderInformation.GroupingText = "Order Information"
        Dim oTableOrderInformation As Table = New Table()

        oTableOrderInformation.Rows.Add(CreateTableRowWithLabel("Order ID:", "txtOrderID"))
        oTableOrderInformation.Rows.Add(CreateTableRowWithCalendar("Order Date:", "txtOrderDate", "gridCal1"))
        oTableOrderInformation.Rows.Add(CreateTableRowWithCalendar("Required Date:", "txtRequiredDate", "gridCal2"))
        oTableOrderInformation.Rows.Add(CreateTableRowWithCalendar("Shipped Date:", "txtShippedDate", "gridCal3"))
        oTableOrderInformation.Rows.Add(CreateTableRowWithTextbox("Ship Via:", "txtShipVia"))
        oTableOrderInformation.Rows.Add(CreateTableRowWithCheckbox("Sent:", "txtSent"))

        oPanelOrderInformation.Controls.Add(oTableOrderInformation)
        oCell2.Controls.Add(oPanelOrderInformation)

        ' For Additional Information
        Dim oPanelAdditionalInformation As Panel = New Panel()
        oPanelAdditionalInformation.Attributes("style") = "width: 300px; height: 180px"
        oPanelAdditionalInformation.GroupingText = "Additional Information"
        Dim oTableAdditionalInformation As Table = New Table()

        oTableAdditionalInformation.Rows.Add(CreateTableRowWithTextarea("Additional Information", "txtAdditionalInformation"))

        oPanelAdditionalInformation.Controls.Add(oTableAdditionalInformation)
        oCell3.Controls.Add(oPanelAdditionalInformation)

        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)
        oTr.Cells.Add(oCell3)
        oTable.Rows.Add(oTr)
        
        Dim oTr2 As TableRow = New TableRow()
        Dim oCell2_1 As TableCell = New TableCell()
        oCell2_1.ColumnSpan = 3
        oCell2_1.HorizontalAlign = HorizontalAlign.Center
        
        Dim BtnSaveChanges As OboutButton = New OboutButton()
        BtnSaveChanges.ID = "BtnSaveChanges"
        BtnSaveChanges.OnClientClick = "return saveChanges(BtnSaveChanges)"
        BtnSaveChanges.Text = "Save"
        
        Dim oSpacer As Literal = New Literal()
        oSpacer.Text = " &#160 "
        
        Dim BtnCancelChanges As OboutButton = New OboutButton()
        BtnCancelChanges.ID = "BtnCancelChanges"
        BtnCancelChanges.OnClientClick = "return cancelChanges(BtnCancelChanges)"
        BtnCancelChanges.Text = "Cancel"

        oCell2_1.Controls.Add(BtnSaveChanges)
        oCell2_1.Controls.Add(oSpacer)
        oCell2_1.Controls.Add(BtnCancelChanges)
        oTr2.Controls.Add(oCell2_1)

        oTable.Rows.Add(oTr2)
        
        oPH1.Controls.Add(oTable)
    End Sub
    
    

    Public Function CreateTableRowWithTextbox(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As TableRow = New TableRow()
        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()

        Dim oLabel As Label = New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)

        Dim oTextBox As OboutTextBox = New OboutTextBox()
        oTextBox.ID = sControlId
        oTextBox.Width = Unit.Pixel(150)
        oTextBox.FolderStyle = "styles/premiere_blue/OboutTextBox"
        
        oCell2.Controls.Add(oTextBox)

        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)

        Return oTr
    End Function

    Public Function CreateTableRowWithCombobox(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As TableRow = New TableRow()
        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()

        Dim oLabel As Label = New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)
        
        Dim ddlCountries As OboutDropDownList = New OboutDropDownList()
        ddlCountries.ID = sControlId
        ddlCountries.Width = Unit.Pixel(150)
        ddlCountries.Height = Unit.Pixel(200)
        ddlCountries.MenuWidth = Unit.Pixel(175)
        ddlCountries.FolderStyle = "styles/premiere_blue/OboutDropDownList"
        
        ddlCountries.DataSourceID = "sds1"
        ddlCountries.DataTextField = "ShipCountry"
        ddlCountries.DataValueField = "ShipCountry"
        
        oCell2.Controls.Add(ddlCountries)

        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)

        Return oTr
    End Function

    Public Function CreateTableRowWithCalendar(ByVal sLabelText As String, ByVal sControlId As String, ByVal sCalendarId As String) As TableRow
        Dim oTr As TableRow = New TableRow()
        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()
        Dim oCell3 As TableCell = New TableCell()

        Dim oLabel As Label = New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)
        
        Dim oTextBox As OboutTextBox = New OboutTextBox()
        oTextBox.ID = sControlId
        oTextBox.Width = Unit.Pixel(150)
        oTextBox.FolderStyle = "styles/premiere_blue/OboutTextBox"
        
        oCell2.Controls.Add(oTextBox)
        
        Dim cal1 As OboutInc.Calendar2.Calendar = New OboutInc.Calendar2.Calendar()
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
        Dim oTr As TableRow = New TableRow()
        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()

        Dim oLabel As Label = New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)

        Dim oCheckBox As OboutCheckBox = New OboutCheckBox()
        oCheckBox.ID = sControlId
        oCheckBox.FolderStyle = "styles/premiere_blue/OboutCheckBox"
        oCell2.Controls.Add(oCheckBox)

        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)

        Return oTr
    End Function

    Public Function CreateTableRowWithTextarea(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As TableRow = New TableRow()
        Dim oCell1 As TableCell = New TableCell()
       
        Dim oTextBox As OboutTextBox = New OboutTextBox()
        oTextBox.ID = sControlId
        oTextBox.Width = Unit.Pixel(285)
        oTextBox.Height = Unit.Pixel(140)
        oTextBox.TextMode = TextBoxMode.MultiLine
        oTextBox.FolderStyle = "styles/premiere_blue/OboutTextBox"
        oCell1.Controls.Add(oTextBox)

        oTr.Cells.Add(oCell1)

        Return oTr
    End Function

    Public Function CreateTableRowWithLabel(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As TableRow = New TableRow()
        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()

        Dim oLabel As Label = New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)

        Dim oLabel2 As Label = New Label()
        oLabel2.ID = sControlId
        oCell2.Controls.Add(oLabel2)

        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)

        Return oTr
    End Function

    Public Function CreateEmptyTableRow() As TableRow
        Dim oTr As TableRow = New TableRow()
        Dim oCell1 As TableCell = New TableCell()
        oCell1.ColumnSpan = 2

        Dim oLiteral As Literal = New Literal()
        oLiteral.Text = "<br />"
        
        oCell1.Controls.Add(oLiteral)
        oTr.Cells.Add(oCell1)
        
        Return oTr
    End Function
    '------------------------------------------------------------------------


    Sub BindGrid()
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, ""mm/dd/yyyy"") AS OrderDateFormatted, FORMAT(RequiredDate, ""mm/dd/yyyy"") AS RequiredDateFormatted, FORMAT(ShippedDate, ""mm/dd/yyyy"") AS ShippedDateFormatted FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
    End Sub
		
    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)
        
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, Sent = @Sent, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia, AdditionalInformation=@AdditionalInformation WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record("ShipAddress")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record("ShipRegion")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record("Sent")
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record("OrderDateFormatted")
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = e.Record("RequiredDateFormatted")
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = e.Record("ShippedDateFormatted")
        myComm.Parameters.Add("@ShipVia", OleDbType.Integer).Value = e.Record("ShipVia")
        myComm.Parameters.Add("@AdditionalInformation", OleDbType.VarChar).Value = e.Record("AdditionalInformation")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, Sent, OrderDate, RequiredDate, ShippedDate, ShipVia, AdditionalInformation) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, @Sent, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @AdditionalInformation)", myConn)
		
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record("ShipAddress")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record("ShipRegion")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record("Sent")
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record("OrderDateFormatted")
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = e.Record("RequiredDateFormatted")
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = e.Record("ShippedDateFormatted")
        myComm.Parameters.Add("@ShipVia", OleDbType.Integer).Value = e.Record("ShipVia")
        myComm.Parameters.Add("@AdditionalInformation", OleDbType.VarChar).Value = e.Record("AdditionalInformation")
  
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        BindGrid()
    End Sub
	</script>		

<html>
	<head runat="server">
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;
				background-color___:#f6f9fc;
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
			
			.rowEditTable td {
			    font-family: Verdana;
		        font-size: 10px;
		        color: #4B555E;
			}
			
			.ob_gFBSp
            {
                visibility: hidden;
            }
		</style>
		<script type="text/javascript">
		    function blurButton(btnId) {
		        var btn = eval(btnId);
		        btn.blur();
		    }

		    function editRecord(btn) {
		        blurButton(btn.id);

		        grid1.edit_record(btn);

		        return false;
		    }

		    function updateRecord(btn, btnObj) {
		        blurButton(btnObj);

		        grid1.update_record(btn);

		        return false;
		    }

		    function cancelEdit(btn, btnObj) {
		        blurButton(btnObj);

		        grid1.cancel_edit(btn);

		        return false;
		    }

		    function deleteRecord(btn) {
		        blurButton(btn.id);

		        grid1.delete_record(btn);

		        return false;
		    }

		    function saveChanges(btnObj) {
		        blurButton(btnObj);

		        grid1.save();

		        return false;
		    }

		    function cancelChanges(btnObj) {
		        blurButton(btnObj);

		        grid1.cancel();

		        return false;
		    }

		    function addNew(btnObj) {
		        blurButton(btnObj);

		        grid1.addRecord();

		        return false;
		    }

		    function saveNew(btnObj) {
		        blurButton(btnObj);

		        grid1.insertRecord();

		        return false;
		    }

		    function cancelNew(btnObj) {
		        blurButton(btnObj);

		        grid1.cancelNewRecord();

		        return false;
		    }

		    function showFilter(btnObj) {
		        blurButton(btnObj);

		        grid1.showFilter();

		        return false;
		    }

		    function applyFilter(btnObj) {
		        blurButton(btnObj);

		        grid1.filter();

		        return false;
		    }

		    function hideFilter(btnObj) {
		        blurButton(btnObj);

		        grid1.hideFilter();

		        return false;
		    }

		    function removeFilter(btnObj) {
		        blurButton(btnObj);

		        grid1.removeFilter();

		        return false;
		    }
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>obout Interface - Inside Grid Templates</b></span>
		<br /><br />			
			
		<div style="display: none"><asp:PlaceHolder ID="phDummy" runat="server"></asp:PlaceHolder></div>
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

		<br /><br /><br />
		
		<span class="tdText">
		    You can use the OboutDropDownList and OboutTextBox controls inside Grid templates to modify data.<br />
		    The OboutButton control can be used to replace the standard hyperlinks (used for performing various actions).
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>