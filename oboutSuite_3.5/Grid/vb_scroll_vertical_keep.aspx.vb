Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_scroll_vertical_keep
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = False
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AllowAddingRecords = False
        grid1.PageSize = 50
        grid1.AutoPostBackOnSelect = True
        grid1.ScrollingSettings.ScrollHeight = 150

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "45"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"
        oCol2.Width = "250"

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

        Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        If grid1.SelectedRecords IsNot Nothing Then

            Dim sText As String = "These are the selected records (server-side):"

            For Each oRecord As System.Collections.Hashtable In grid1.SelectedRecords
                sText += "<br />" & Convert.ToString(oRecord("OrderID")) & " --- " & Convert.ToString(oRecord("ShipName")) & " --- " & Convert.ToString(oRecord("ShipCity")) & " --- " & Convert.ToString(oRecord("ShipCountry"))
            Next

            divSelectedRecords.Text = "<br />" & sText

        End If

    End Sub

End Class
