Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_sorting_allow_columns
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.AllowSorting = True
        grid1.CallbackMode = True
        grid1.Serialize = True


        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "ShipCountry"
        oCol1.HeaderText = "COUNTRY"
        oCol1.Width = "150"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipCity"
        oCol2.HeaderText = "CITY"
        oCol2.Width = "150"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipName"
        oCol3.HeaderText = "NAME"
        oCol3.Width = "200"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "OrderID"
        oCol4.HeaderText = "ORDER ID"
        oCol4.Width = "150"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)


        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

        grid1.Columns(0).AllowSorting = chkAllowSortingShipCountry.Checked
        grid1.Columns(1).AllowSorting = chkAllowSortingShipCity.Checked
        grid1.Columns(2).AllowSorting = chkAllowSortingShipName.Checked
        grid1.Columns(3).AllowSorting = cbkAllowSortingOrderID.Checked

    End Sub

End Class
