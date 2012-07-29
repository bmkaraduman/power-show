Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_totals_groups_headers
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()
    Dim tempTotalPrice As Double = 0
    Dim tempUnitsInStock As Integer = 0
    Dim tempUnitsOnOrder As Integer = 0
    Dim tempRowCounter As Integer = 0

    Dim totalPrices As New Dictionary(Of Integer, Double)()
    Dim unitsInStock As New Dictionary(Of Integer, Double)()
    Dim unitsOnOrder As New Dictionary(Of Integer, Double)()
    Dim rowCounter As New Dictionary(Of Integer, Double)()
    Dim lastGroupHeaders As New Dictionary(Of Integer, GridRow)()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "grid1"
        grid1.DataSourceID = "sds1"
        grid1.FolderStyle = "styles/black_glass"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.Serialize = True
        grid1.CallbackMode = True
        grid1.PageSize = 10
        grid1.ShowMultiPageGroupsInfo = False
        grid1.AllowColumnResizing = False
        grid1.ShowColumnsFooter = False
        grid1.ShowGroupFooter = True
        AddHandler grid1.RowDataBound, AddressOf RowDataBound
        grid1.AllowGrouping = True
        grid1.GroupBy = "CategoryID"

        grid1.AllowColumnResizing = True

        grid1.ClientSideEvents.OnClientCallback = "updateGroupTotalsWidths"

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
        oCol3.DataField = "ProductName"
        oCol3.HeaderText = "PRODUCT NAME"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "UnitPrice"
        oCol4.HeaderText = "PRICE"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "UnitsInStock"
        oCol5.HeaderText = "UNITS IN STOCK"
        oCol5.Width = "150"

        Dim oCol6 As Column = New Column()
        oCol6.Width = "150"
        oCol6.DataField = "UnitsOnOrder"
        oCol6.HeaderText = "UNITS ON ORDER"

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)

        phGrid1.Controls.Add(grid1)

    End Sub
    Sub RowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)

        If e.Row.RowType = GridRowType.DataRow Then

            tempTotalPrice += Double.Parse(e.Row.Cells(3).Text)
            tempUnitsInStock += Integer.Parse(e.Row.Cells(4).Text)
            tempUnitsOnOrder += Integer.Parse(e.Row.Cells(5).Text)
            tempRowCounter += 1

        ElseIf e.Row.RowType = GridRowType.GroupHeader Then

            'Literal textContainer = e.Row.Cells[0].Controls[0].Controls[1].Controls[0] as Literal
            If Not lastGroupHeaders.ContainsKey(e.Row.GroupLevel) Then

                lastGroupHeaders.Add(e.Row.GroupLevel, Nothing)

            End If

            lastGroupHeaders(e.Row.GroupLevel) = e.Row

        ElseIf e.Row.RowType = GridRowType.GroupFooter Then

            If e.Row.GroupLevel > 0 Then

                For level As Integer = e.Row.GroupLevel - 1 To 0 Step -1
                    If Not totalPrices.ContainsKey(level) Then
                        totalPrices.Add(level, 0)
                        unitsInStock.Add(level, 0)
                        unitsOnOrder.Add(level, 0)
                        rowCounter.Add(level, 0)
                    End If

                    totalPrices(level) += tempTotalPrice
                    unitsInStock(level) += tempUnitsInStock
                    unitsOnOrder(level) += tempUnitsOnOrder
                    rowCounter(level) += tempRowCounter
                Next

            End If

            Dim priceToDisplay As Double = 0
            Dim unitsInStockToDisplay As Integer = 0
            Dim unitsOnOrderToDisplay As Integer = 0
            Dim rowCounterToDisplay As Integer = 0

            If totalPrices.ContainsKey(e.Row.GroupLevel) Then

                priceToDisplay = totalPrices(e.Row.GroupLevel)
                unitsInStockToDisplay = unitsInStock(e.Row.GroupLevel)
                unitsOnOrderToDisplay = unitsOnOrder(e.Row.GroupLevel)
                rowCounterToDisplay = rowCounter(e.Row.GroupLevel)

                totalPrices(e.Row.GroupLevel) = 0
                unitsInStock(e.Row.GroupLevel) = 0
                unitsOnOrder(e.Row.GroupLevel) = 0
                rowCounter(e.Row.GroupLevel) = 0

            Else

                priceToDisplay = tempTotalPrice
                unitsInStockToDisplay = tempUnitsInStock
                unitsOnOrderToDisplay = tempUnitsOnOrder
                rowCounterToDisplay = tempRowCounter
            End If


            ' Display information in Group header
            Dim textContainer As Literal = CType(lastGroupHeaders(e.Row.GroupLevel).Cells(0).Controls(0).Controls(lastGroupHeaders(e.Row.GroupLevel).Cells(0).Controls(0).Controls.Count - 1).Controls(0), Literal)
            textContainer.Text = "<div class='group-total'>" + textContainer.Text + "</div>"
            textContainer.Text += "<div class='group-total' style='margin-left: " + (147 - (23 * e.Row.GroupLevel)).ToString() + "px;'>Price: $" + priceToDisplay.ToString() + "</div>"
            textContainer.Text += "<div class='group-total' style='margin-left: " + (297 - (23 * e.Row.GroupLevel)).ToString() + "px;'>Units in Stock:  $" + unitsInStockToDisplay.ToString() + "</div>"
            textContainer.Text += "<div class='group-total' style='margin-left: " + (447 - (23 * e.Row.GroupLevel)).ToString() + "px;'>Units on Order:  $" + unitsOnOrderToDisplay.ToString() + "</div>"


            ' Display information in Group footer            
            e.Row.Cells(2).Text = "Total (" & rowCounterToDisplay.ToString() & " item" & (IIf(rowCounterToDisplay > 1, "s", "")) & "):"
            e.Row.Cells(3).Text = "$" + priceToDisplay.ToString()
            e.Row.Cells(4).Text = unitsInStockToDisplay.ToString()
            e.Row.Cells(5).Text = unitsOnOrderToDisplay.ToString()

            tempTotalPrice = 0
            tempUnitsInStock = 0
            tempUnitsOnOrder = 0
            tempRowCounter = 0
            End If
    End Sub
End Class
