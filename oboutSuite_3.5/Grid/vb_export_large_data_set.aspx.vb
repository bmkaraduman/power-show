Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports Obout.Grid
Imports System.Data.OleDb
Imports System.IO
Imports System.Collections
Imports System

Partial Class Grid_vb_export_large_data_set
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.AllowPageSizeSelection = False
        grid1.AllowAddingRecords = False
        grid1.ScrollingSettings.ScrollWidth = 625

        phGrid1.Controls.Add(grid1)

        PopulateGrid()

    End Sub

   Protected Sub PopulateGrid()
        Dim dt As New DataTable()
        For i As Integer = 1 To 10
            dt.Columns.Add("Col" & i.ToString())
        Next

        For i As Integer = 1 To 25000
            Dim row As DataRow = dt.NewRow()

            For j As Integer = 0 To dt.Columns.Count - 1
                row(dt.Columns(j).ColumnName) = "Item " & i.ToString() & "-" & (j + 1).ToString()
            Next

            dt.Rows.Add(row)
        Next

        grid1.DataSource = dt
        grid1.DataBind()
    End Sub

    Sub OboutButton1_Click(ByVal sender As Object, ByVal e As EventArgs)

        ' Export current page
        ExportGrid()
    End Sub

    Sub OboutButton2_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Export all pages
        grid1.PageSize = -1
        grid1.DataBind()
        ExportGrid()
    End Sub

    Private Sub ExportGrid()
        Response.Clear()

        Dim j As Integer = 0

        'Add headers of the exported file
        For Each col As Column In grid1.Columns
            If j > 0 Then
                Response.Write(",")
            End If

            Response.Write(col.HeaderText)

            j += 1
        Next

        'How add the data from the Grid to exported file
        For i As Integer = 0 To grid1.Rows.Count - 1
            Dim dataItem As Hashtable = grid1.Rows(i).ToHashtable()
            j = 0

            Response.Write(vbLf)

            For Each col As Column In grid1.Columns
                If j > 0 Then
                    Response.Write(",")
                End If

                Response.Write(dataItem(col.DataField).ToString())

                j += 1
            Next
        Next

        ' Send the data and the appropriate headers to the browser        
        Response.AddHeader("content-disposition", "attachment;filename=oboutGrid.csv")
        Response.ContentType = "text/csv"
        Response.[End]()
    End Sub
End Class
