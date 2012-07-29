Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_export_csv
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "SqlDataSource1"

        'creating the columns
        Dim g1Col1 As Column = New Column()
        g1Col1.DataField = "OrderID"
        g1Col1.HeaderText = "ORDER ID"

        Dim g1Col2 As Column = New Column()
        g1Col2.DataField = "ShipName"
        g1Col2.HeaderText = "NAME"

        Dim g1Col3 As Column = New Column()
        g1Col3.DataField = "ShipCity"
        g1Col3.HeaderText = "CITY"

        Dim g1Col4 As Column = New Column()
        g1Col4.DataField = "ShipCountry"
        g1Col4.HeaderText = "COUNTRY"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(g1Col1)
        grid1.Columns.Add(g1Col2)
        grid1.Columns.Add(g1Col3)
        grid1.Columns.Add(g1Col4)
        phGrid1.Controls.Add(grid1)

    End Sub

    Protected Sub OboutButton1_Click(ByVal sender As Object, ByVal e As EventArgs)

        ' Export current page
        ExportGridToCSV()

    End Sub

    Protected Sub OboutButton2_Click(ByVal sender As Object, ByVal e As EventArgs)

        ' Export all pages
        grid1.PageSize = -1
        grid1.DataBind()
        ExportGridToCSV()

    End Sub

    Private Sub ExportGridToCSV()
        Response.Clear()

        Dim j As Integer = 0

        'Add headers of the csv table
        For Each col As Column In grid1.Columns
            If j > 0 Then
                Response.Write(",")
            End If

            Response.Write(col.HeaderText)

            j += 1
        Next

        'How add the data from the Grid to csv table
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
