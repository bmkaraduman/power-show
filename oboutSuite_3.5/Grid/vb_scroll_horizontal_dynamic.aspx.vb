Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_scroll_horizontal_dynamic
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = True
        grid1.AllowAddingRecords = False
        grid1.ScrollingSettings.ScrollWidth = 625
        grid1.AllowPageSizeSelection = False

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub

    Sub LoadSuppliers(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ClearPreviousDataSource()
        grid1.DataSourceID = "SqlDataSource1"
    End Sub

    Sub LoadProducts(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ClearPreviousDataSource()
        grid1.DataSourceID = "SqlDataSource2"
    End Sub

    Sub LoadOrders(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ClearPreviousDataSource()
        grid1.DataSourceID = "SqlDataSource3"
    End Sub

    Sub LoadCustomers(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ClearPreviousDataSource()
        grid1.DataSourceID = "SqlDataSource4"
    End Sub

End Class
