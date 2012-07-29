Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_master_detail_full_declarative
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()
    Dim grid2 As DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        'Creating grid1
        grid1.ID = "grid1"
        grid1.AutoGenerateColumns = False
        grid1.PageSize = 5
        grid1.DataSourceID = "sds1"
        grid1.FolderStyle = "styles/black_glass"
        grid1.AllowAddingRecords = True

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

        Dim oCol5 As Column = New Column()
        oCol5.DataField = ""
        oCol5.AllowEdit = True
        oCol5.AllowDelete = True

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' Creating grid2
        grid2.ID = "grid2"
        grid2.AutoGenerateColumns = False
        grid2.FolderStyle = "styles/black_glass"
        grid2.AllowAddingRecords = True
        grid2.ShowFooter = True
        grid2.AllowPageSizeSelection = False
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "CustomerID"
        grid2.PageSize = 5

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback

        grid2.ClientSideEvents.ExposeSender = True
        grid2.ClientSideEvents.OnClientPopulateControls = "onPopulateControls"


        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = False
        oCol2_1.ReadOnly = True

        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = False
        oCol2_1.ReadOnly = True

        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "ShipName"
        oCol2_3.HeaderText = "SHIP NAME"
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}"

        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "ShipCity"
        oCol2_4.HeaderText = "SHIP CITY"

        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "ShipCountry"
        oCol2_5.HeaderText = "SHIP COUNTRY"
        oCol2_5.DataFormatString = "{0:C2}"

        Dim oCol2_6 As Column = New Column()
        oCol2_6.DataField = ""
        oCol2_6.AllowEdit = True
        oCol2_6.AllowDelete = True
        oCol2_6.Width = "170"

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

End Class
