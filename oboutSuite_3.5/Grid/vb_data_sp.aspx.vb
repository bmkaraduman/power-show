Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_data_sp
    Inherits System.Web.UI.Page
    Dim grid1 As Obout.Grid.Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ' Creating grid1
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = False
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "sds1"
        grid1.PageSize = 5
        grid1.AllowFiltering = False


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


        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)


        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub

End Class
