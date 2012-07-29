Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_master_detail_error
    Inherits System.Web.UI.Page
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()
    Dim grid3 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ' Creating grid1
        grid1.ID = "Grid1"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = True
        grid1.DataSourceID = "sds1"
        grid1.FolderStyle = "styles/black_glass"
        grid1.PageSize = 5
        AddHandler grid1.InsertCommand, AddressOf InsertCustomer
        AddHandler grid1.UpdateCommand, AddressOf UpdateCustomer
        AddHandler grid1.DeleteCommand, AddressOf DeleteCustomer

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback

        grid1.ClientSideEvents.ExposeSender = True
        grid1.ClientSideEvents.OnClientCallbackError = "onClientCallbackError"

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"
        oCol1.HeaderText = "CUSTOMER ID"


        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "285"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = ""
        oCol5.HeaderText = ""
        oCol5.AllowEdit = True
        oCol5.AllowDelete = True
        oCol5.Width = "140"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' Creating grid2
        grid2.ID = "Grid2"
        grid2.AutoGenerateColumns = False
        grid2.AllowAddingRecords = True
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "CustomerID"
        grid2.ShowFooter = True
        grid2.PageSize = 5
        grid2.FolderStyle = "styles/black_glass"
        AddHandler grid2.InsertCommand, AddressOf InsertOrder
        AddHandler grid2.UpdateCommand, AddressOf UpdateOrder
        AddHandler grid2.DeleteCommand, AddressOf DeleteOrder

        grid2.ClientSideEvents.ExposeSender = True
        grid2.ClientSideEvents.OnClientPopulateControls = "onPopulateControls"
        grid2.ClientSideEvents.OnClientCallbackError = "onClientCallbackError"

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback

        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = False
        oCol2_1.ReadOnly = False

        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = False
        oCol2_2.ReadOnly = True

        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "ShipName"
        oCol2_3.HeaderText = "SHIP NAME"
        oCol2_3.Width = "250"


        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "ShipCity"
        oCol2_4.HeaderText = "SHIP CITY"
        oCol2_4.Width = "200"

        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "ShipCountry"
        oCol2_5.HeaderText = "SHIP COUNTRY"
        oCol2_5.Width = "200"

        Dim oCol2_6 As Column = New Column()
        oCol2_6.DataField = ""
        oCol2_6.HeaderText = ""
        oCol2_6.Width = "210"
        oCol2_6.AllowEdit = True
        oCol2_6.AllowDelete = True
        oCol2_6.Width = "210"
        oCol2_6.Align = "center"

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_4)
        grid2.Columns.Add(oCol2_5)
        grid2.Columns.Add(oCol2_6)

        grid1.DetailGrids.Add(grid2)


        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub

    Sub DeleteCustomer(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        ' try to delete the customer
        ' ...
        ' throw an exception if something goes wrong
        Throw New Exception("An error occured when trying to delete the customer.")
    End Sub
    Sub DeleteOrder(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        ' try to delete the order
        ' ...
        ' throw an exception if something goes wrong
        Throw New Exception("An error occured when trying to delete the order.")
    End Sub

    Sub UpdateCustomer(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        ' try to update the customer
        ' ...
        ' throw an exception if something goes wrong
        Throw New Exception("An error occured when trying to update the customer.")
    End Sub
    Sub UpdateOrder(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        ' try to update the order
        ' ...
        ' throw an exception if something goes wrong
        Throw New Exception("An error occured when trying to update the order.")
    End Sub

    Sub InsertCustomer(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        ' try to insert the customer
        ' ...
        ' throw an exception if something goes wrong
        Throw New Exception("An error occured when trying to insert the customer.")
    End Sub
    Sub InsertOrder(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        ' try to insert the order
        ' ...
        ' throw an exception if something goes wrong
        Throw New Exception("An error occured when trying to insert the order.")
    End Sub
End Class
