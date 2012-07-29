Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid
Imports System.Collections

Partial Class Grid_vb_export_checkboxcolumn
    Inherits System.Web.UI.Page
    Dim Grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        Grid1.ID = "Grid1"
        Grid1.DataSourceID = "SqlDataSource1"
        Grid1.AutoGenerateColumns = False
        Grid1.AllowAddingRecords = False
        Grid1.Serialize = False
        Grid1.AllowColumnReordering = True
        AddHandler Grid1.RowExported, AddressOf Grid1_RowExported
        Grid1.ExportingSettings.ExportHiddenColumns = True


        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.HeaderText = "ORDER ID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "125"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "125"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "125"

        Dim oCol6 As CheckBoxColumn = New CheckBoxColumn()
        oCol6.DataField = "Sent"
        oCol6.HeaderText = "SENT"
        oCol6.Width = "95"
        oCol6.ShowHeader = True

        Grid1.Columns.Add(oCol1)
        Grid1.Columns.Add(oCol2)
        Grid1.Columns.Add(oCol3)
        Grid1.Columns.Add(oCol4)
        Grid1.Columns.Add(oCol5)
        Grid1.Columns.Add(oCol6)

        phGrid1.Controls.Add(Grid1)

    End Sub
    Sub Grid1_RowExported(ByVal sender As Object, ByVal e As GridRowExportEventArgs)

        If e.SourceRow.RowType = GridRowType.DataRow Then

            e.Row.Cells(5).Text = IIf(e.SourceRow.Cells(5).Text.ToLower() = "true", "yes", "no")

        End If

    End Sub


End Class
