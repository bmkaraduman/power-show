Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_grouping_checkboxes
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()


    Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.FolderStyle = "styles/black_glass"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.AllowGrouping = True

        grid1.GroupingSettings.AllowChanges = False
        grid1.LocalizationSettings.Grouping_GroupingAreaText = "Check the above checkboxes to group by those columns."

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipCountry"
        oCol2.HeaderText = "SHIP COUNTRY"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "SHIP CITY"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipName"
        oCol5.HeaderText = "SHIP NAME"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

    End Sub

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Dim groupBy As String = ""

        If ChkGroupByCountry.Checked Then

            groupBy += "ShipCountry"

        End If


        If ChkGroupByCity.Checked Then

            If groupBy <> String.Empty Then

                groupBy += ","

            End If

            groupBy += "ShipCity"

        End If

        grid1.GroupBy = groupBy

    End Sub
End Class
