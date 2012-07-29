Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_print_selected_columns
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "sds1"
        grid1.AutoGenerateColumns = False
        grid1.AllowPageSizeSelection = False
        grid1.AllowAddingRecords = False

        Dim oCol0 As Column = New Column()
        oCol0.DataField = "ORDER ID"
        oCol0.DataField = "OrderID"
        oCol0.Width = "150"

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "ShipName"
        oCol1.HeaderText = "NAME"
        oCol1.Width = "150"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipCity"
        oCol2.HeaderText = "CITY"
        oCol2.Width = "150"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipRegion"
        oCol3.HeaderText = "REGION"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "150"

        grid1.Columns.Add(oCol0)
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        phGrid1.Controls.Add(grid1)

    End Sub

End Class
