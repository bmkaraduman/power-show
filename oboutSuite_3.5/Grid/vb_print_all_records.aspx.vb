Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_print_all_records
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "grid1"
        grid1.DataSourceID = "sds1"
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.Serialize = True
        grid1.CallbackMode = True
        grid1.AllowPaging = False
        grid1.AllowPageSizeSelection = False
        grid1.PageSize = -1

        grid1.ScrollingSettings.ScrollHeight = 250


        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.HeaderText = "Order ID"
        oCol1.ReadOnly = True
        oCol1.Width = "150"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"
        oCol2.Width = "200"

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

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        phGrid1.Controls.Add(grid1)

    End Sub

End Class
