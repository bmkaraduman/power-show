Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_columns_reordering
    Inherits System.Web.UI.Page
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()
    Dim grid3 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ' Creating grid1
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.AutoGenerateColumns = False
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "sds1"

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnLoad
        grid1.MasterDetailSettings.ShowEmptyDetails = False

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "EmployeeID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "FirstName"
        oCol2.HeaderText = "FIRST NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "LastName"
        oCol3.HeaderText = "LAST NAME"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "City"
        oCol4.HeaderText = "CITY"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "Country"
        oCol5.HeaderText = "COUNTRY"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ReportsTo"
        oCol6.Visible = False

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)


        ' Creating grid2
        grid2.ID = "grid2"
        grid2.CallbackMode = True
        grid2.AutoGenerateColumns = False
        grid2.FolderStyle = "styles/grand_gray"
        grid2.AllowAddingRecords = False
        grid2.ShowFooter = True
        grid2.AllowPageSizeSelection = False
        grid2.AllowPaging = False
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "EmployeeID"

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnLoad
        grid2.MasterDetailSettings.ShowEmptyDetails = False

        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "EmployeeID"
        oCol2_1.Visible = False

        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "FirstName"
        oCol2_2.HeaderText = "FIRST NAME"

        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "LastName"
        oCol2_3.HeaderText = "LAST NAME"

        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "City"
        oCol2_4.HeaderText = "CITY"

        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "Country"
        oCol2_5.HeaderText = "COUNTRY"

        Dim oCol2_6 As Column = New Column()
        oCol2_6.DataField = "ReportsTo"
        oCol2_6.Visible = False

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_4)
        grid2.Columns.Add(oCol2_5)
        grid2.Columns.Add(oCol2_6)


        ' Creating grid3
        grid3.ID = "grid3"
        grid3.CallbackMode = True
        grid3.AutoGenerateColumns = False
        grid3.FolderStyle = "styles/grand_gray"
        grid3.AllowAddingRecords = False
        grid3.ShowFooter = True
        grid3.AllowPageSizeSelection = False
        grid3.AllowPaging = False
        grid3.DataSourceID = "sds2"
        grid3.ForeignKeys = "EmployeeID"

        ' creating the columns
        Dim oCol3_1 As Column = New Column()
        oCol3_1.DataField = "EmployeeID"
        oCol3_1.Visible = False

        Dim oCol3_2 As Column = New Column()
        oCol3_2.DataField = "FirstName"
        oCol3_2.HeaderText = "FIRST NAME"

        Dim oCol3_3 As Column = New Column()
        oCol3_3.DataField = "LastName"
        oCol3_3.HeaderText = "LAST NAME"

        Dim oCol3_4 As Column = New Column()
        oCol3_4.DataField = "City"
        oCol3_4.HeaderText = "CITY"

        Dim oCol3_5 As Column = New Column()
        oCol3_5.DataField = "Country"
        oCol3_5.HeaderText = "COUNTRY"
        oCol3_5.Width = "150"

        Dim oCol3_6 As Column = New Column()
        oCol3_6.DataField = "ReportsTo"
        oCol3_6.Visible = False

        ' add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1)
        grid3.Columns.Add(oCol3_2)
        grid3.Columns.Add(oCol3_3)
        grid3.Columns.Add(oCol3_4)
        grid3.Columns.Add(oCol3_5)
        grid3.Columns.Add(oCol3_6)


        grid2.DetailGrids.Add(grid3)
        grid1.DetailGrids.Add(grid2)


        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

        grid1.MasterDetailSettings.ShowEmptyDetails = ChkShowEmptyDetails.Checked
        grid2.MasterDetailSettings.ShowEmptyDetails = ChkShowEmptyDetails.Checked
    End Sub

End Class
