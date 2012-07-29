<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Collections.Generic" %>

<script runat="server" Language="VB">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    
    Dim tempTotalPrice As Double = 0
    Dim tempUnitsInStock As Integer = 0
    Dim tempUnitsOnOrder As Integer = 0
    Dim tempRowCounter As Integer = 0

    Dim totalPrices As New Dictionary(Of Integer, Double)()
    Dim unitsInStock As New Dictionary(Of Integer, Integer)()
    Dim unitsOnOrder As New Dictionary(Of Integer, Integer)()
    Dim rowCounter As New Dictionary(Of Integer, Integer)()
  	
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)			
		grid1.ID = "grid1"
		grid1.CallbackMode = true
		grid1.Serialize = true
		grid1.AutoGenerateColumns = false
        grid1.FolderStyle = "styles/black_glass"
        grid1.AllowAddingRecords = false
        grid1.DataSourceID = "sds1"
        grid1.AllowGrouping = true
        grid1.ShowMultiPageGroupsInfo = false
        grid1.GroupBy = "CategoryID"
        grid1.ShowColumnsFooter = false
        grid1.ShowGroupFooter = true

		' setting the event handlers
        AddHandler CType(grid1, Grid).RowDataBound, AddressOf RowDataBound

		' creating the columns
        Dim oCol1 As Column = New Column()
		oCol1.DataField = "ProductID"
		oCol1.ReadOnly = true
		oCol1.HeaderText = "PRODUCT ID"
		oCol1.Width = "150"
        oCol1.Visible = false

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CategoryID"
        oCol2.ReadOnly = true
        oCol2.HeaderText = "CATEGORY ID"
        oCol2.Width = "150"
        oCol2.Visible = false

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
        oCol6.DataField = "UnitsOnOrder"
        oCol6.HeaderText = "UNITS ON ORDER"
        oCol6.Width = "150"

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)

		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
    End Sub
    
    Sub RowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)
        If e.Row.RowType = GridRowType.DataRow Then
            tempTotalPrice += Double.Parse(e.Row.Cells(3).Text)
            tempUnitsInStock += Integer.Parse(e.Row.Cells(4).Text)
            tempUnitsOnOrder += Integer.Parse(e.Row.Cells(5).Text)
            tempRowCounter += 1
    
        ElseIf e.Row.RowType = GridRowType.GroupFooter Then
 
            If e.Row.GroupLevel > 0 Then
                Dim level As Integer
                For level = e.Row.GroupLevel - 1 To 0 Step -1
              
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
                Next level
            
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
            e.Row.Cells(2).Text = "Total (" + rowCounterToDisplay.ToString() & " item" & (IIf(rowCounterToDisplay > 1, "s", "")) & "):"
            e.Row.Cells(3).Text = "$" + priceToDisplay.ToString()
            e.Row.Cells(4).Text = unitsInStockToDisplay.ToString()
            e.Row.Cells(5).Text = unitsOnOrderToDisplay.ToString()

            tempTotalPrice = 0
            tempUnitsInStock = 0
            tempUnitsOnOrder = 0
            tempRowCounter = 0
        End If
    End Sub
</script>
<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>
			
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Sub-Totals in Group Footers</b></span>		
		
		<br /><br />
				
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		
		<br />
		<span class="tdText">
		    Set <b>ShowGroupFooter</b> to <span class="option2">true</span> to show an extra line at the bottom of each group, which may contain sub-totals.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>