Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_export_multiple
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()
    Dim grid2 As Grid = New Grid()
    Dim grid3 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "SqlDataSource3"
        grid1.FolderStyle = "styles/black_glass"
        grid1.PageSize = 5
        AddHandler grid1.Exporting, AddressOf Grid1_Exporting
        AddHandler grid1.Exported, AddressOf Grid1_Exported

        Dim Template1 As GridRuntimeTemplate = New GridRuntimeTemplate()
        Template1.ID = "Template1"
        Template1.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(Template1.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTemplate1
        '------------------------------------------------------------------------

        Dim Template2 As GridRuntimeTemplate = New GridRuntimeTemplate()
        Template2.ID = "Template2"
        Template2.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(Template2.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTemplate2
        '------------------------------------------------------------------------


        Dim Template3 As GridRuntimeTemplate = New GridRuntimeTemplate()
        Template3.ID = "Template3"
        Template3.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(Template3.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTemplate3
        '------------------------------------------------------------------------

        ' adding the templates to the Templates collection
        grid1.Templates.Add(Template1)
        grid2.Templates.Add(Template2)
        grid3.Templates.Add(Template3)

        'creating the columns
        Dim g1Col1 As Column = New Column()
        g1Col1.DataField = "CustomerID"
        g1Col1.Visible = False
        g1Col1.Width = "150"
        g1Col1.ReadOnly = True

        Dim g1Col2 As Column = New Column()
        g1Col2.DataField = "CompanyName"
        g1Col2.HeaderText = "COMPANY NAME"

        Dim g1Col3 As Column = New Column()
        g1Col3.DataField = "Address"
        g1Col3.HeaderText = "ADDRESS"

        Dim g1Col4 As Column = New Column()
        g1Col4.DataField = "City"
        g1Col4.HeaderText = "CITY"

        Dim g1Col5 As Column = New Column()
        g1Col5.DataField = "Country"
        g1Col5.HeaderText = "COUNTRY"


        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(g1Col1)
        grid1.Columns.Add(g1Col2)
        grid1.Columns.Add(g1Col3)
        grid1.Columns.Add(g1Col4)
        grid1.Columns.Add(g1Col5)


        grid2.ID = "Grid2"
        grid2.AutoGenerateColumns = False
        grid2.AllowAddingRecords = False
        grid2.DataSourceID = "SqlDataSource2"
        grid2.FolderStyle = "styles/black_glass"
        grid2.PageSize = 5

        grid2.TemplateSettings.HeadingTemplateId = "Template2"
        grid2.ExportingSettings.ExportHiddenColumns = False

        'creating the columns
        Dim g2Col1 As Column = New Column()
        g2Col1.DataField = "OrderID"
        g2Col1.Visible = False
        g2Col1.Width = "150"
        g2Col1.ReadOnly = True

        Dim g2Col2 As Column = New Column()
        g2Col2.DataField = "ShipName"
        g2Col2.HeaderText = "SHIP NAME"

        Dim g2Col3 As Column = New Column()
        g2Col3.DataField = "ShipCity"
        g2Col3.HeaderText = "SHIP CITY"

        Dim g2Col4 As Column = New Column()
        g2Col4.DataField = "ShipRegion"
        g2Col4.HeaderText = "REGION"

        Dim g2Col5 As Column = New Column()
        g2Col5.DataField = "ShipCountry"
        g2Col5.HeaderText = "SHIP COUNTRY"


        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(g2Col1)
        grid2.Columns.Add(g2Col2)
        grid2.Columns.Add(g2Col3)
        grid2.Columns.Add(g2Col4)
        grid2.Columns.Add(g2Col5)

        grid3.ID = "Grid3"
        grid3.AutoGenerateColumns = False
        grid3.AllowAddingRecords = False
        grid3.DataSourceID = "SqlDataSource1"
        grid3.FolderStyle = "styles/black_glass"
        grid3.PageSize = 5

        grid3.TemplateSettings.HeadingTemplateId = "Template3"
        grid3.ExportingSettings.ExportHiddenColumns = False

        ' creating the columns
        Dim g3Col1 As Column = New Column()
        g3Col1.DataField = "ProductID"
        g3Col1.Visible = False
        g3Col1.Width = "150"
        g3Col1.ReadOnly = True

        Dim g3Col2 As Column = New Column()
        g3Col2.DataField = "CategoryID"
        g3Col2.HeaderText = "CATEGORY ID"
        g3Col2.Visible = False
        g3Col2.Width = "150"
        g3Col2.ReadOnly = True

        Dim g3Col3 As Column = New Column()
        g3Col3.DataField = "ProductName"
        g3Col3.HeaderText = "PRODUCT NAME"

        Dim g3Col4 As Column = New Column()
        g3Col4.DataField = "UnitPrice"
        g3Col4.HeaderText = "PRICE"

        Dim g3Col5 As Column = New Column()
        g3Col5.DataField = "UnitsInStock"
        g3Col5.HeaderText = "SUNITS IN STOCK"

        Dim g3Col6 As Column = New Column()
        g3Col6.DataField = "UnitsOnOrder"
        g3Col6.HeaderText = "UNITS ON ORDER"


        ' add the columns to the Columns collection of the grid
        grid3.Columns.Add(g3Col1)
        grid3.Columns.Add(g3Col2)
        grid3.Columns.Add(g3Col3)
        grid3.Columns.Add(g3Col4)
        grid3.Columns.Add(g3Col5)
        grid3.Columns.Add(g3Col6)



        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        phGrid2.Controls.Add(grid2)
        phGrid3.Controls.Add(grid3)
    End Sub

    Protected Sub Grid1_Exporting(ByVal sender As Object, ByVal e As GridExportEventArgs)

        AddTitleRow(e.Table, "CUSTOMERS")
    End Sub

    Protected Sub Grid1_Exported(ByVal sender As Object, ByVal e As GridExportEventArgs)

        AddGridToExportedFile(grid2, e.Table, "ORDERS")
        AddGridToExportedFile(grid3, e.Table, "PRODUCTS")
    End Sub

    Sub AddTitleRow(ByVal table As Table, ByVal title As String)

        Dim titleRow As TableRow = New TableRow()
        Table.Rows.Add(titleRow)

        Dim titleCell As TableCell = New TableCell()
        titleRow.Cells.Add(titleCell)
        titleCell.ColumnSpan = 4
        titleCell.Text = "<b>" + Title + "</b>"
    End Sub

    Sub AddGridToExportedFile(ByVal grid As Grid, ByVal table As Table, ByVal title As String)

        Dim spacerRow As TableRow = New TableRow()
        Table.Rows.Add(spacerRow)

        AddTitleRow(Table, Title)

        Dim headerRow As TableRow = New TableRow()

        For Each column As Column In grid.Columns
            If column.Visible Then
                Dim headerCell As New TableCell()
                headerCell.Text = column.HeaderText
                headerRow.Cells.Add(headerCell)
            End If
        Next

        table.Rows.Add(headerRow)

        For Each dataRow As GridRow In grid.Rows
            Dim newRow As New TableRow()

            Dim columnIndex As Integer = 0
            For Each dataCell As GridDataControlFieldCell In dataRow.Cells
                If grid.Columns(columnIndex).Visible Then
                    Dim newCell As New TableCell()
                    newCell.Text = dataCell.Text
                    newRow.Cells.Add(newCell)
                End If

                columnIndex += 1
            Next

            table.Rows.Add(newRow)
        Next

    End Sub

    Sub CreateTemplate1(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oLiteral As Literal = New Literal()

        Dim oContainer As Obout.Grid.TemplateContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "CUSTOMERS"
        e.Container.Controls.Add(oLiteral)
    End Sub

    Sub CreateTemplate2(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oLiteral As Literal = New Literal()

        Dim oContainer As Obout.Grid.TemplateContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "ORDERS"
        e.Container.Controls.Add(oLiteral)
    End Sub

    Sub CreateTemplate3(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oLiteral As Literal = New Literal()

        Dim oContainer As Obout.Grid.TemplateContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "PRODUCTS"
        e.Container.Controls.Add(oLiteral)
    End Sub

End Class
