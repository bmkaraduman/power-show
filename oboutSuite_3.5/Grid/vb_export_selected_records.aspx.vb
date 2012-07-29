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

Partial Class Grid_vb_export_selected_records
    Inherits System.Web.UI.Page
    Dim Grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        Grid1.ID = "Grid1"
        Grid1.DataSourceID = "sds1"
        Grid1.AutoGenerateColumns = False
        Grid1.AllowAddingRecords = False
        AddHandler Grid1.RowExported, AddressOf Grid1_RowExported


        Dim oCol1 As CheckBoxSelectColumn = New CheckBoxSelectColumn()

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "OrderID"
        oCol2.HeaderText = "ORDER ID"
        oCol2.Visible = False
        oCol2.ReadOnly = True
        oCol2.Width = "100"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipName"
        oCol3.HeaderText = "NAME"
        oCol3.Width = "250"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCity"
        oCol4.HeaderText = "CITY"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipPostalCode"
        oCol5.HeaderText = "POSTAL CODE"
        oCol5.Width = "150"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipCountry"
        oCol6.HeaderText = "COUNTRY"
        oCol6.Width = "150"

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)

        phGrid1.Controls.Add(grid1)

    End Sub
    Sub Grid1_RowExported(ByVal sender As Object, ByVal e As GridRowExportEventArgs)

        If e.SourceRow.RowType = GridRowType.DataRow Then

            Dim exportCurrentRow As Boolean = True

            If Grid1.SelectedRecords IsNot Nothing Then

                Dim currentRecord As Hashtable = e.SourceRow.ToHashtable()

                For Each selectedRecord As Hashtable In Grid1.SelectedRecords
                    exportCurrentRow = True

                    For Each entry As DictionaryEntry In selectedRecord
                        If currentRecord(entry.Key).ToString() <> selectedRecord(entry.Key).ToString() Then
                            exportCurrentRow = False
                            Exit For
                        End If
                    Next

                    If exportCurrentRow Then
                        Exit For
                    End If
                Next

            Else
                exportCurrentRow = False
            End If

            If Not exportCurrentRow Then

                e.Row.Parent.Controls.Remove(e.Row)
            End If
        End If

    End Sub

   
End Class
