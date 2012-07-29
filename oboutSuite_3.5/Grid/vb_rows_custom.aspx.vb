Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_rows_custom
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False

        grid1.DataSourceID = "sds1"
        grid1.EmbedFilterInSortExpression = True

        grid1.FolderStyle = "styles/grand_gray"
        grid1.FolderLocalization = "localization"
        grid1.AllowFiltering = True

        ' setting the event handlers
        AddHandler CType(grid1, Grid).RowCreated, AddressOf OnGridRowCreated
        AddHandler CType(grid1, Grid).RowDataBound, AddressOf OnGridRowDataBound

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "150"


        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

    End Sub

    Protected Sub OnGridRowCreated(ByVal sender As Object, ByVal args As GridRowEventArgs)
        ' modify the row structure here
    End Sub
    Protected Sub OnGridRowDataBound(ByVal sender As Object, ByVal args As GridRowEventArgs)
        args.Row.Cells.Item(0).ForeColor = System.Drawing.Color.Red
        args.Row.Cells.Item(0).BackColor = System.Drawing.Color.LightGray

        If args.Row.Cells.Item(4).Text = "USA" Or args.Row.Cells.Item(4).Text = "Denmark" Or args.Row.Cells.Item(4).Text = "Germany" Then
            Dim i As Integer = 2
            For i = 1 To args.Row.Cells.Count - 1
                args.Row.Cells.Item(i).BackColor = System.Drawing.Color.DarkGray
            Next i

        End If

    End Sub
End Class
