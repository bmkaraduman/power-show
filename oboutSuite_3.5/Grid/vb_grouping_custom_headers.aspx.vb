Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_grouping_custom_headers
    Inherits System.Web.UI.Page
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim lastGroupHeader As GridRow

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ' Creating grid1
        grid1.ID = "Grid1"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "SqlDataSource1"
        grid1.ShowMultiPageGroupsInfo = False
        AddHandler grid1.RowDataBound, AddressOf RowDataBound
        grid1.AllowGrouping = True
        grid1.GroupBy = "CategoryID"
        grid1.GroupingSettings.AllowChanges = False

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "ProductID"
        oCol1.HeaderText = "PRODUCT ID"
        oCol1.Visible = False
        oCol1.ReadOnly = True
        oCol1.Width = "150"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CategoryID"
        oCol2.HeaderText = "CATEGORY ID"
        oCol2.Visible = False
        oCol2.ReadOnly = True
        oCol2.Width = "150"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "CategoryName"
        oCol3.Visible = False

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ProductName"
        oCol4.HeaderText = "PRODUCT NAME"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "UnitPrice"
        oCol5.HeaderText = "PRICE"
        oCol5.Width = "150"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "UnitsInStock"
        oCol6.HeaderText = "UNITS IN STOCK"
        oCol6.Width = "150"

        Dim oCol7 As Column = New Column()
        oCol7.DataField = "UnitsOnOrder"
        oCol7.HeaderText = "UNITS ON ORDER"
        oCol7.Width = "150"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub

    Sub RowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)

        If e.Row.RowType = GridRowType.DataRow Then

            If lastGroupHeader IsNot Nothing Then

                Dim textContainer As Literal = CType(lastGroupHeader.Cells(0).Controls(0).Controls(lastGroupHeader.Cells(0).Controls(0).Controls.Count - 1).Controls(0), Literal)
                textContainer.Text = CType(e.Row.Cells(2), GridDataControlFieldCell).Text


                textContainer.Text += "&#160;&#187;&#160;"

                Dim link As HyperLink = New HyperLink()
                link.CssClass = "header-link"
                link.Attributes("onclick") = "alert('In a real application the category form should open.')"
                link.NavigateUrl = "aspnet_grouping_custom_headers.aspx?CategoryID=" + CType(e.Row.Cells(1), GridDataControlFieldCell).Text
                link.Text = "Edit Category"

                textContainer.Parent.Controls.Add(link)

                lastGroupHeader = Nothing

            End If


        ElseIf e.Row.RowType = GridRowType.GroupHeader Then

            If e.Row.GroupLevel = 0 Then

                lastGroupHeader = e.Row

            End If

        End If

    End Sub


End Class
