Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_master_detail_with_row_template
    Inherits System.Web.UI.Page
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.AutoGenerateColumns = False
        grid1.PageSize = 5
        grid1.AllowAddingRecords = True
        grid1.DataSourceID = "sds1"
        grid1.AllowPageSizeSelection = False

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        grid1.TemplateSettings.RowEditTemplateId = "tplRowEditMaster"

        Dim RowEditTemplate As Obout.Grid.GridRuntimeTemplate
        RowEditTemplate = New GridRuntimeTemplate()
        RowEditTemplate.ID = "tplRowEditMaster"
        RowEditTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(RowEditTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateRowEditTemplate
        '------------------------------------------------------------------------

        grid1.Templates.Add(RowEditTemplate)

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"
        oCol1.HeaderText = "CUSTOMER ID"
        oCol1.Visible = False
        oCol1.TemplateSettings.RowEditTemplateControlId = "txtCustomerID"
        oCol1.TemplateSettings.RowEditTemplateControlPropertyName = "innerHTML"

        Dim oCol2 As New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "200"
        oCol2.TemplateSettings.RowEditTemplateControlId = "txtCompanyName"
        oCol2.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"
        oCol3.TemplateSettings.RowEditTemplateControlId = "txtContactName"
        oCol3.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"
        oCol4.TemplateSettings.RowEditTemplateControlId = "ddlCountries"
        oCol4.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = ""
        oCol5.HeaderText = ""
        oCol5.AllowEdit = True
        oCol5.AllowDelete = True
        oCol5.Width = "145"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        grid2.AutoGenerateColumns = False
        grid2.EnableTypeValidation = False
        grid2.AllowAddingRecords = True
        grid2.ShowFooter = True
        grid2.PageSize = 5
        AddHandler grid2.RowCreated, AddressOf grid2_RowCreated
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "CustomerID"
        grid2.AllowPageSizeSelection = False

        grid2.ClientSideEvents.ExposeSender = True
        grid2.ClientSideEvents.OnClientPopulateControls = "onPopulateControls"
        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        grid2.TemplateSettings.RowEditTemplateId = "tplRowEditDetail"

        Dim RowEditTemplateDetail As Obout.Grid.GridRuntimeTemplate
        RowEditTemplateDetail = New GridRuntimeTemplate()
        RowEditTemplateDetail.ID = "tplRowEditDetail"
        RowEditTemplateDetail.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(RowEditTemplateDetail.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateRowEditTemplateDetail
        '------------------------------------------------------------------------

        grid2.Templates.Add(RowEditTemplateDetail)

        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = False
        oCol2_1.ReadOnly = False
        oCol2_1.TemplateSettings.RowEditTemplateControlId = "hiddenCustomerID"
        oCol2_1.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = False
        oCol2_2.ReadOnly = False
        oCol2_2.TemplateSettings.RowEditTemplateControlId = "hiddenOrderID"
        oCol2_2.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "ShipName"
        oCol2_3.HeaderText = "NAME"
        oCol2_3.TemplateSettings.RowEditTemplateControlId = "txtShipName"
        oCol2_3.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "ShipCity"
        oCol2_4.HeaderText = "CITY"
        oCol2_4.TemplateSettings.RowEditTemplateControlId = "txtShipCity"
        oCol2_4.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "ShipCountry"
        oCol2_5.HeaderText = "COUNTRY"
        oCol2_5.DataFormatString = "{0:C2}"
        oCol2_5.Width = "125"
        oCol2_5.TemplateSettings.RowEditTemplateControlId = "ddlShipCountries"
        oCol2_5.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol2_6 As Column = New Column()
        oCol2_6.DataField = ""
        oCol2_6.HeaderText = "EDIT"
        oCol2_6.Width = "140"
        oCol2_6.AllowEdit = True
        oCol2_6.AllowDelete = True

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_4)
        grid2.Columns.Add(oCol2_5)
        grid2.Columns.Add(oCol2_6)

        grid1.DetailGrids.Add(grid2)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

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

        ' For Ship Information
        Dim oPanelShipInformation As Panel = New Panel()
        oPanelShipInformation.Attributes("style") = "width: 300px; height: 125px;"
        oPanelShipInformation.GroupingText = "Customer Information"
        Dim oTableShipInformation As Table = New Table()

        oTableShipInformation.Rows.Add(CreateTableRowWithSpan("Customer ID:", "txtCustomerID"))
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Company Name:", "txtCompanyName"))
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Contact Name:", "txtContactName"))
        oTableShipInformation.Rows.Add(CreateTableRowWithDropdown("Country:", "ddlCountries"))
        oTableShipInformation.Rows.Add(CreateEmptyTableRow())

        oPanelShipInformation.Controls.Add(oTableShipInformation)
        oCell1.Controls.Add(oPanelShipInformation)

        oTr.Cells.Add(oCell1)
        oTable.Rows.Add(oTr)

        oPH1.Controls.Add(oTable)
    End Sub

    Public Function CreateTableRowWithTextbox(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As TableRow = New TableRow()
        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()

        Dim oLabel As Label = New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)

        Dim oTextBox As Obout.Interface.OboutTextBox = New Obout.Interface.OboutTextBox()
        oTextBox.ID = sControlId
        oTextBox.Width = Unit.Pixel(150)

        oCell2.Controls.Add(oTextBox)

        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)

        Return oTr
    End Function

    Public Function CreateTableRowWithDropdown(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As TableRow = New TableRow()
        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()

        Dim oLabel As Label = New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)

        Dim ddlCountries As Obout.Interface.OboutDropDownList = New Obout.Interface.OboutDropDownList()
        ddlCountries.ID = sControlId
        ddlCountries.Width = Unit.Pixel(150)
        ddlCountries.Height = Unit.Pixel(200)
        ddlCountries.MenuWidth = Unit.Pixel(175)

        ddlCountries.DataSourceID = "sds3"
        ddlCountries.DataTextField = "ShipCountry"
        ddlCountries.DataValueField = "ShipCountry"

        oCell2.Controls.Add(ddlCountries)

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

    Public Function CreateTableRowWithSpan(ByVal sLabelText As String, ByVal sControlId As String) As TableRow
        Dim oTr As TableRow = New TableRow()
        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()

        Dim oLabel As Label = New Label()
        oLabel.Text = sLabelText
        oCell1.Controls.Add(oLabel)

        Dim oLiteral As Literal = New Literal()
        oLiteral.Text = "<span id=""txtCustomerID"" style=""width: 150px;""></span>"

        oCell2.Controls.Add(oLiteral)

        oTr.Cells.Add(oCell1)
        oTr.Cells.Add(oCell2)

        Return oTr
    End Function


    Sub CreateRowEditTemplateDetail(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindRowEditTemplateDetail
    End Sub

    Public Sub DataBindRowEditTemplateDetail(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)

        Dim inputHiddenCustomer As Literal = New Literal()
        inputHiddenCustomer.Text = "<input type=""hidden"" id=""hiddenCustomerID"" />"

        Dim inputHiddenOrder As Literal = New Literal()
        inputHiddenOrder.Text = "<input type=""hidden"" id=""hiddenOrderID"" />"

        Dim oTable As Table = New Table()
        oTable.CssClass = "rowEditTable"

        Dim oTr As TableRow = New TableRow()

        Dim oCell1 As TableCell = New TableCell()

        ' For Ship Information
        Dim oPanelShipInformation As Panel = New Panel()
        oPanelShipInformation.Attributes("style") = "width: 300px; height: 125px;"
        oPanelShipInformation.GroupingText = "Ship Information"
        Dim oTableShipInformation As Table = New Table()

        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship Name:", "txtShipName"))
        oTableShipInformation.Rows.Add(CreateTableRowWithTextbox("Ship City:", "txtShipCity"))
        oTableShipInformation.Rows.Add(CreateTableRowWithDropdown("Ship Country:", "ddlShipCountries"))
        oTableShipInformation.Rows.Add(CreateEmptyTableRow())

        oPanelShipInformation.Controls.Add(oTableShipInformation)
        oCell1.Controls.Add(oPanelShipInformation)

        oTr.Cells.Add(oCell1)
        oTable.Rows.Add(oTr)

        oPH1.Controls.Add(inputHiddenCustomer)
        oPH1.Controls.Add(inputHiddenOrder)
        oPH1.Controls.Add(oTable)
    End Sub

    Sub grid2_RowCreated(ByVal sender As Object, ByVal e As GridRowEventArgs)

        Dim detailGrid As DetailGrid = CType(sender, DetailGrid)
        AddHandler CType(detailGrid, DetailGrid).DataBound, AddressOf grid2_DataBound

    End Sub


    Sub grid2_DataBound(ByVal sender As Object, ByVal e As EventArgs)

        Dim detailGrid As DetailGrid = CType(sender, DetailGrid)

        Dim txtShipName As Obout.Interface.OboutTextBox = CType(detailGrid.Templates(0).Container.FindControl("txtShipName"), Obout.Interface.OboutTextBox)
        Dim txtShipCity As Obout.Interface.OboutTextBox = CType(detailGrid.Templates(0).Container.FindControl("txtShipCity"), Obout.Interface.OboutTextBox)
        Dim ddlShipCountries As Obout.Interface.OboutDropDownList = CType(detailGrid.Templates(0).Container.FindControl("ddlShipCountries"), Obout.Interface.OboutDropDownList)

        If txtShipName IsNot Nothing AndAlso txtShipCity IsNot Nothing AndAlso ddlShipCountries IsNot Nothing Then
            txtShipName.ID = detailGrid.ID + "_txtShipName"
            txtShipCity.ID = detailGrid.ID + "_txtShipCity"
            ddlShipCountries.ID = detailGrid.ID + "_ddlShipCountries"

            detailGrid.Columns(2).TemplateSettings.RowEditTemplateControlId = txtShipName.ID
            detailGrid.Columns(3).TemplateSettings.RowEditTemplateControlId = txtShipCity.ID
            detailGrid.Columns(4).TemplateSettings.RowEditTemplateControlId = ddlShipCountries.ID
        End If

    End Sub
End Class
