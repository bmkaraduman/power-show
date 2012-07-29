Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_master_detail_keep_state
    Inherits System.Web.UI.Page
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()
    Dim grid3 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ' Creating grid1
        grid1.ID = "Grid1"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "sds1"
        grid1.AllowMultiRecordSelection = False

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"
        oCol1.HeaderText = "CUSTOMER ID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)


        ' Creating grid2
        grid2.ID = "Grid2"
        grid2.AutoGenerateColumns = False
        grid2.AllowAddingRecords = False
        grid2.AllowPageSizeSelection = False
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "CustomerID"
        grid2.AllowMultiRecordSelection = False

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback

        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = False

        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = False
        oCol2_2.ReadOnly = True

        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "OrderDate"
        oCol2_3.HeaderText = "ORDER DATE"
        oCol2_3.Width = "225"
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}"

        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "ShippedDate"
        oCol2_4.HeaderText = "SHIPPED DATE"
        oCol2_4.DataFormatString = "{0:MM/dd/yyyy}"

        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "Freight"
        oCol2_5.HeaderText = "FREIGHT"
        oCol2_5.DataFormatString = "{0:C2}"
        oCol2_5.Width = "170"

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_4)
        grid2.Columns.Add(oCol2_5)


        ' Creating grid3
        grid3.ID = "Grid3"
        grid3.AutoGenerateColumns = False
        grid3.AllowAddingRecords = False
        grid3.AllowPageSizeSelection = False
        grid3.DataSourceID = "sds3"
        grid3.ForeignKeys = "OrderID"
        grid3.AllowMultiRecordSelection = False

        ' creating the columns
        Dim oCol3_1 As Column = New Column()
        oCol3_1.DataField = "OrderID"
        oCol3_1.HeaderText = "ORDER ID"
        oCol3_1.Visible = False
        oCol3_1.ReadOnly = True

        Dim oCol3_2 As Column = New Column()
        oCol3_2.DataField = "UnitPrice"
        oCol3_2.HeaderText = "UNIT PRICE"
        oCol3_2.Width = "185"
        oCol3_2.DataFormatString = "{0:C2}"

        Dim oCol3_3 As Column = New Column()
        oCol3_3.DataField = "Quantity"
        oCol3_3.HeaderText = "QUANTITY"
        oCol3_3.Width = "170"

        Dim oCol3_4 As Column = New Column()
        oCol3_4.DataField = "Discount"
        oCol3_4.HeaderText = "DISCOUNT"
        oCol3_4.DataFormatString = "{0:F2}%"
        oCol3_4.Width = "185"

        ' add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1)
        grid3.Columns.Add(oCol3_2)
        grid3.Columns.Add(oCol3_3)
        grid3.Columns.Add(oCol3_4)


        grid2.DetailGrids.Add(grid3)
        grid1.DetailGrids.Add(grid2)


        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub

End Class
