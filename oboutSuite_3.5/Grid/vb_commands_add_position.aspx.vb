Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_commands_add_position
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.FolderStyle = "styles/black_glass"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = True
        grid1.Serialize = False

        grid1.PagingSettings.Position = GridElementPosition.TopAndBottom
        grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.TopAndBottom
        grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Dynamic

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"
        oCol2.Width = "150"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "SHIP CITY"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "SHIP COUNTRY"
        oCol5.Width = "150"

        Dim oCol6 As Column = New Column()
        oCol6.Width = "150"
        oCol6.AllowDelete = True
        oCol6.AllowEdit = True

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)

        phGrid1.Controls.Add(grid1)

        If AddLinksPosition_Bottom.Checked Then

            grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.Bottom

        ElseIf AddLinksPosition_Top.Checked Then

            grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.Top

        Else

            grid1.AddEditDeleteSettings.AddLinksPosition = GridElementPosition.TopAndBottom
        End If

        If NewRecordPosition_Bottom.Checked Then

            grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Bottom

        ElseIf NewRecordPosition_Top.Checked Then

            grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Top

        Else

            grid1.AddEditDeleteSettings.NewRecordPosition = GridDynamicElementPosition.Dynamic

        End If

    End Sub

End Class
