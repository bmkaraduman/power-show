Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid
Imports OboutInc.Calendar2
Imports Obout.Interface
Partial Class Grid_vb_filtering_datepicker
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = False
        grid1.AllowFiltering = True
        grid1.AllowAddingRecords = False

        Dim tplOrderDate As Obout.Grid.GridRuntimeTemplate = New GridRuntimeTemplate()
        tplOrderDate.ID = "tplOrderDate"
        tplOrderDate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplOrderDate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateOrderDateTemplate
        tplOrderDate.ControlID = "txtOrderDate"

        Dim tplShippedDate As Obout.Grid.GridRuntimeTemplate = New GridRuntimeTemplate()
        tplShippedDate.ID = "tplShippedDate"
        tplShippedDate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplShippedDate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateShippedDateTemplate
        tplShippedDate.ControlID = "txtShippedDate"

        Dim tplRequiredDate As Obout.Grid.GridRuntimeTemplate = New GridRuntimeTemplate()
        tplRequiredDate.ID = "tplRequiredDate"
        tplRequiredDate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplRequiredDate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateRequiredDateTemplate
        tplRequiredDate.ControlID = "txtRequiredDate"

        ' adding the templates to the Templates collection
        grid1.Templates.Add(tplOrderDate)
        grid1.Templates.Add(tplShippedDate)
        grid1.Templates.Add(tplRequiredDate)


        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"
        oCol2.ShowFilterCriterias = False
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "OrderDate"
        oCol3.HeaderText = "ORDER DATE"
        oCol3.DataFormatString = "{0:M/d/yyyy}"
        oCol3.ShowFilterCriterias = False
        oCol3.Width = "200"
        oCol3.TemplateSettings.FilterTemplateId = "tplOrderDate"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShippedDate"
        oCol4.HeaderText = "SHIPPED DATE"
        oCol4.DataFormatString = "{0:M/d/yyyy}"
        oCol4.ShowFilterCriterias = False
        oCol4.Width = "200"
        oCol4.TemplateSettings.FilterTemplateId = "tplShippedDate"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "RequiredDate"
        oCol5.HeaderText = "REQUIRED DATE"
        oCol5.DataFormatString = "{0:M/d/yyyy}"
        oCol5.ShowFilterCriterias = False
        oCol5.Width = "200"
        oCol5.TemplateSettings.FilterTemplateId = "tplRequiredDate"


        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        phGrid1.Controls.Add(grid1)

    End Sub

    Sub CreateOrderDateTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oPlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPlaceHolder)
        AddHandler CType(oPlaceHolder, PlaceHolder).DataBinding, AddressOf DataBindOrderDateTemplate
    End Sub
    Sub DataBindOrderDateTemplate(ByVal sender As Object, ByVal e As EventArgs)

        Dim oPlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oPlaceHolder.NamingContainer, Obout.Grid.TemplateContainer)

        Dim oTable As Table = New Table()
        oTable.CellPadding = 0
        oTable.CellSpacing = 0
        oTable.Attributes("width") = "100%"

        Dim oRow As TableRow = New TableRow()

        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()
        oCell2.Attributes("width") = "30"

        Dim oTextBox As OboutTextBox = New OboutTextBox()
        oTextBox.ID = "txtOrderDate"
        oTextBox.FolderStyle = "styles/premiere_blue/interface/OboutTextBox"
        oTextBox.Width = Unit.Percentage(100)

        oCell1.Controls.Add(oTextBox)

        Dim cal1 As OboutInc.Calendar2.Calendar = New OboutInc.Calendar2.Calendar()
        cal1.ID = "Calendar1"
        cal1.StyleFolder = "../calendar/styles/default"
        cal1.DatePickerMode = True
        cal1.ShowYearSelector = True
        cal1.DateMin = New DateTime(1990, 1, 1)
        cal1.DateMax = New DateTime(2015, 1, 1)
        cal1.DateFormat = "M/d/yyyy"
        cal1.YearSelectorType = SelectorType.HtmlList
        cal1.TitleText = "<span style='color:crimson'>Select year:</span> "
        cal1.DatePickerImagePath = "../calendar/styles/icon2.gif"

        oCell2.Controls.Add(cal1)

        oRow.Cells.Add(oCell1)
        oRow.Cells.Add(oCell2)

        oTable.Rows.Add(oRow)

        oPlaceHolder.Controls.Add(oTable)

    End Sub

    Sub CreateShippedDateTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oPlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPlaceHolder)
        AddHandler CType(oPlaceHolder, PlaceHolder).DataBinding, AddressOf DataBindShippedDateTemplate
    End Sub
    Sub DataBindShippedDateTemplate(ByVal sender As Object, ByVal e As EventArgs)

        Dim oPlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oPlaceHolder.NamingContainer, Obout.Grid.TemplateContainer)

        Dim oTable As Table = New Table()
        oTable.CellPadding = 0
        oTable.CellSpacing = 0
        oTable.Attributes("width") = "100%"

        Dim oRow As TableRow = New TableRow()

        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()
        oCell2.Attributes("width") = "30"

        Dim oTextBox As OboutTextBox = New OboutTextBox()
        oTextBox.ID = "txtShippedDate"
        oTextBox.FolderStyle = "styles/premiere_blue/interface/OboutTextBox"
        oTextBox.Width = Unit.Percentage(100)

        oCell1.Controls.Add(oTextBox)

        Dim cal2 As OboutInc.Calendar2.Calendar = New OboutInc.Calendar2.Calendar()
        cal2.ID = "Calendar2"
        cal2.StyleFolder = "../calendar/styles/default"
        cal2.DatePickerMode = True
        cal2.ShowYearSelector = True
        cal2.DateMin = New DateTime(1990, 1, 1)
        cal2.DateMax = New DateTime(2015, 1, 1)
        cal2.DateFormat = "M/d/yyyy"
        cal2.YearSelectorType = SelectorType.HtmlList
        cal2.TitleText = "<span style='color:crimson'>Select year:</span> "
        cal2.DatePickerImagePath = "../calendar/styles/icon2.gif"

        oCell2.Controls.Add(cal2)

        oRow.Cells.Add(oCell1)
        oRow.Cells.Add(oCell2)

        oTable.Rows.Add(oRow)

        oPlaceHolder.Controls.Add(oTable)
    End Sub

    Sub CreateRequiredDateTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oPlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPlaceHolder)
        AddHandler CType(oPlaceHolder, PlaceHolder).DataBinding, AddressOf DataBindRequiredDateTemplate
    End Sub
    Sub DataBindRequiredDateTemplate(ByVal sender As Object, ByVal e As EventArgs)

        Dim oPlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oPlaceHolder.NamingContainer, Obout.Grid.TemplateContainer)

        Dim oTable As Table = New Table()
        oTable.CellPadding = 0
        oTable.CellSpacing = 0
        oTable.Attributes("width") = "100%"

        Dim oRow As TableRow = New TableRow()

        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()
        oCell2.Attributes("width") = "30"

        Dim oTextBox As OboutTextBox = New OboutTextBox()
        oTextBox.ID = "txtRequiredDate"
        oTextBox.FolderStyle = "styles/premiere_blue/interface/OboutTextBox"
        oTextBox.Width = Unit.Percentage(100)

        oCell1.Controls.Add(oTextBox)

        Dim cal3 As OboutInc.Calendar2.Calendar = New OboutInc.Calendar2.Calendar()
        cal3.ID = "Calendar3"
        cal3.StyleFolder = "../calendar/styles/default"
        cal3.DatePickerMode = True
        cal3.ShowYearSelector = True
        cal3.DateMin = New DateTime(1990, 1, 1)
        cal3.DateMax = New DateTime(2015, 1, 1)
        cal3.DateFormat = "M/d/yyyy"
        cal3.YearSelectorType = SelectorType.HtmlList
        cal3.TitleText = "<span style='color:crimson'>Select year:</span> "
        cal3.DatePickerImagePath = "../calendar/styles/icon2.gif"

        oCell2.Controls.Add(cal3)

        oRow.Cells.Add(oCell1)
        oRow.Cells.Add(oCell2)

        oTable.Rows.Add(oRow)

        oPlaceHolder.Controls.Add(oTable)
    End Sub
End Class
