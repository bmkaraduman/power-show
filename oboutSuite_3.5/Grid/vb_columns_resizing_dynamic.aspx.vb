Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_columns_resizing_dynamic
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()
    Dim grid2 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = False
        grid1.AllowPageSizeSelection = False
        grid1.AllowAddingRecords = False

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "125"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCountry"
        oCol4.HeaderText = "COUNTRY"
        oCol4.Width = "125"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "OrderDate"
        oCol5.HeaderText = "ORDER DATE"
        oCol5.Width = "135"
        oCol5.DataFormatString = "{0:MM/dd/yyyy}"

        'add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

        grid2.ID = "Grid2"
        grid2.DataSourceID = "SqlDataSource1"
        grid2.AutoGenerateColumns = False
        grid2.AllowPageSizeSelection = False
        grid2.AllowAddingRecords = False

        grid2.ScrollingSettings.ScrollWidth = 560

        ' creating the columns
        Dim oCol21 As Column = New Column()
        oCol21.DataField = "OrderID"
        oCol21.Visible = False

        Dim oCol22 As Column = New Column()
        oCol22.DataField = "ShipName"
        oCol22.HeaderText = "NAME"

        Dim oCol23 As Column = New Column()
        oCol23.DataField = "ShipCity"
        oCol23.HeaderText = "CITY"
        oCol23.Width = "125"

        Dim oCol24 As Column = New Column()
        oCol24.DataField = "ShipCountry"
        oCol24.HeaderText = "COUNTRY"
        oCol24.Width = "125"

        Dim oCol25 As Column = New Column()
        oCol25.DataField = "OrderDate"
        oCol25.HeaderText = "ORDER DATE"
        oCol25.Width = "135"
        oCol25.DataFormatString = "{0:MM/dd/yyyy}"

        Dim oCol26 As Column = New Column()
        oCol26.DataField = "ShippedDate"
        oCol26.HeaderText = "SHIPPED DATE"
        oCol26.Width = "135"
        oCol26.DataFormatString = "{0:MM/dd/yyyy}"

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol21)
        grid2.Columns.Add(oCol22)
        grid2.Columns.Add(oCol23)
        grid2.Columns.Add(oCol24)
        grid2.Columns.Add(oCol25)
        grid2.Columns.Add(oCol26)

        'add the grid to the controls collection of the PlaceHolder
        phGrid2.Controls.Add(grid2)

    End Sub

End Class
