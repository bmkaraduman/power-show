Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_filtering_position
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.FolderStyle = "styles/black_glass"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.Serialize = False
        grid1.AllowFiltering = True
        grid1.AllowPageSizeSelection = False

        grid1.PagingSettings.Position = GridElementPosition.TopAndBottom
        grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.TopAndBottom
        grid1.FilteringSettings.FilterPosition = GridFilterPosition.Bottom
        grid1.FilteringSettings.InitialState = GridFilterState.Visible

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"
        oCol2.Width = "200"
        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "SHIP CITY"
        oCol3.Width = "180"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "180"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "SHIP COUNTRY"
        oCol5.Width = "180"

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        phGrid1.Controls.Add(grid1)

        If NewFilterRow_PositionTop.Checked Then

            grid1.FilteringSettings.FilterPosition = GridFilterPosition.Top

        ElseIf NewFilterRow_PositionBottom.Checked Then

            grid1.FilteringSettings.FilterPosition = GridFilterPosition.Bottom

        End If

        If PositionTop.Checked Then

            grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.Top

        ElseIf PositionBottom.Checked Then

            grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.Bottom

        Else

            grid1.FilteringSettings.FilterLinksPosition = GridElementPosition.TopAndBottom

        End If

    End Sub

End Class
