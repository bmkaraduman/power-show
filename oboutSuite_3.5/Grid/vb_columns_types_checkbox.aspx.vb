Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_columns_types_checkbox
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = False
        grid1.AllowColumnReordering = True
        grid1.AllowAddingRecords = True
        grid1.Serialize = False

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "SHIP CITY"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "SHIP COUNTRY"

        Dim oCol6 As CheckBoxColumn = New CheckBoxColumn()
        oCol6.DataField = "Sent"
        oCol6.HeaderText = "SENT"
        oCol6.Width = "75"
        oCol6.ShowHeader = True

        Dim oCol7 As Column = New Column()
        oCol7.AllowEdit = True
        oCol7.AllowDelete = True

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)

        phGrid1.Controls.Add(grid1)

        DirectCast(grid1.Columns(5), CheckBoxColumn).ControlType = IIf(RbtnStandard.Checked, GridControlType.Standard, GridControlType.Obout)

    End Sub

End Class
