Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_select_using_checkbox
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = False
        grid1.AllowColumnReordering = True
        grid1.AllowAddingRecords = True

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As CheckBoxSelectColumn = New CheckBoxSelectColumn()
        oCol2.ShowHeaderCheckBox = True
        oCol2.ControlType = GridControlType.Standard

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipName"
        oCol3.HeaderText = "SHIP NAME"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCity"
        oCol4.HeaderText = "SHIP CITY"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipPostalCode"
        oCol5.HeaderText = "POSTAL CODE"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipCountry"
        oCol6.HeaderText = "SHIP COUNTRY"

        Dim oCol7 As Column = New Column()
        oCol7.AllowDelete = True
        oCol7.AllowEdit = True

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)

        phGrid1.Controls.Add(grid1)

    End Sub

End Class
