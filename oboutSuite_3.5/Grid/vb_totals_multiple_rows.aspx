<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Collections.Generic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="VB">
    Dim ordersPerCountries As Dictionary(Of String, Integer) = New Dictionary(Of String, Integer)
    Dim ordersPerCustomers As Dictionary(Of String, Integer) = New Dictionary(Of String, Integer)
    Dim ordersPerDates As Dictionary(Of String, Integer) = New Dictionary(Of String, Integer)
    Dim ordersPerMonths As Dictionary(Of String, Integer) = New Dictionary(Of String, Integer)
    Dim ordersPerYears As Dictionary(Of String, Integer) = New Dictionary(Of String, Integer)
   
    Dim grid1 As Obout.Grid.Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.AllowPageSizeSelection = False
        grid1.AllowPaging = False
        grid1.DataSourceID = "sds1"
        grid1.PageSize = -1
        grid1.ShowColumnsFooter = True
        AddHandler grid1.RowDataBound, AddressOf RowDataBound

        grid1.ScrollingSettings.ScrollHeight = 150

        'creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "150"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"
        oCol2.Width = "250"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShippedDate"
        oCol3.DataFormatString = "{0:MM/dd/yyyy}"
        oCol3.HeaderText = "SHIPPED DATE"
        oCol3.Width = "250"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCountry"
        oCol4.HeaderText = "SHIP COUNTRY"
        oCol4.Width = "250"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub
    
    
    Sub RowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)

        If (e.Row.RowType = GridRowType.DataRow) Then
       
            AddToCollection(ordersPerCustomers, e.Row.Cells(1).Text)
            AddToCollection(ordersPerDates, e.Row.Cells(2).Text)
            AddToCollection(ordersPerMonths, Convert.ToDateTime(e.Row.Cells(2).Text).ToString("MMMM"))
            AddToCollection(ordersPerYears, Convert.ToDateTime(e.Row.Cells(2).Text).ToString("yyyy"))
            AddToCollection(ordersPerCountries, e.Row.Cells(3).Text)
        
        ElseIf (e.Row.RowType = GridRowType.ColumnFooter) Then
        
            Dim customerWithMostOrders As KeyValuePair(Of String, Integer) = GetCollectionMaxItem(ordersPerCustomers)
            Dim customerWithFewestOrders As KeyValuePair(Of String, Integer) = GetCollectionMinItem(ordersPerCustomers)

            Dim dateWithMostOrders As KeyValuePair(Of String, Integer) = GetCollectionMaxItem(ordersPerDates)
            Dim dateWithFewestOrders As KeyValuePair(Of String, Integer) = GetCollectionMinItem(ordersPerDates)

            Dim monthWithMostOrders As KeyValuePair(Of String, Integer) = GetCollectionMaxItem(ordersPerMonths)
            Dim monthWithFewestOrders As KeyValuePair(Of String, Integer) = GetCollectionMinItem(ordersPerMonths)

            Dim yearWithMostOrders As KeyValuePair(Of String, Integer) = GetCollectionMaxItem(ordersPerYears)
            Dim yearWithFewestOrders As KeyValuePair(Of String, Integer) = GetCollectionMinItem(ordersPerYears)

            Dim countryWithMostOrders As KeyValuePair(Of String, Integer) = GetCollectionMaxItem(ordersPerCountries)
            Dim countryWithFewestOrders As KeyValuePair(Of String, Integer) = GetCollectionMinItem(ordersPerCountries)

            Dim customersAggregate As String = ""
            customersAggregate += "Most Orders: " + customerWithMostOrders.Key
            customersAggregate += "<br />"
            customersAggregate += "Fewest Orders: " + customerWithFewestOrders.Key

            Dim datesAggregate As String = ""
            datesAggregate += "Day with Most Orders: " + Convert.ToDateTime(dateWithMostOrders.Key).ToString("MM/dd/yyyy")
            datesAggregate += "<br />"
            datesAggregate += "Day with Fewest Orders: " + Convert.ToDateTime(dateWithFewestOrders.Key).ToString("MM/dd/yyyy")
            datesAggregate += "<br />"
            datesAggregate += "Month with Most Orders: " + monthWithMostOrders.Key
            datesAggregate += "<br />"
            datesAggregate += "Month with Fewest Orders: " + monthWithFewestOrders.Key
            datesAggregate += "<br />"
            datesAggregate += "Year with Most Orders: " + yearWithMostOrders.Key
            datesAggregate += "<br />"
            datesAggregate += "Year with Fewest Orders: " + yearWithFewestOrders.Key
            
            Dim countriesAggregate As String = ""
            countriesAggregate += "Most Orders: " + countryWithMostOrders.Key
            countriesAggregate += "<br />"
            countriesAggregate += "Fewest Orders: " + countryWithFewestOrders.Key

            e.Row.Cells(1).Text = customersAggregate
            e.Row.Cells(2).Text = datesAggregate
            e.Row.Cells(3).Text = countriesAggregate
        End If
        
    End Sub
    

    ' Get the item containing the maximum value in a collection
    Function GetCollectionMaxItem(ByVal collection As Dictionary(Of String, Integer)) As KeyValuePair(Of String, Integer)
  
        Dim maxValue As Integer = 0
        Dim maxItem As KeyValuePair(Of String, Integer) = New KeyValuePair(Of String, Integer)()

        For Each Item As KeyValuePair(Of String, Integer) In collection
       
            If (Item.Value > maxValue) Then
            
                maxValue = Item.Value
                maxItem = Item
            End If
            
        Next
        

        Return maxItem
    End Function
    

    ' Get the item containing the minimum value in a collection
    Function GetCollectionMinItem(ByVal collection As Dictionary(Of String, Integer)) As KeyValuePair(Of String, Integer)
  
        Dim minValue As Integer = -1
        Dim minItem As KeyValuePair(Of String, Integer) = New KeyValuePair(Of String, Integer)()

        For Each item As KeyValuePair(Of String, Integer) In collection
       
            If (minValue = -1) Then
            
                ' Initially, load the value of the first item in the minValue variable
                minValue = item.Value
                minItem = item
            End If
        

            If (item.Value < minValue) Then
            
                minValue = item.Value
                minItem = item
            End If
            
        Next
        
        Return minItem
    End Function
    

    ' Increments the value of the specified key in the current collection
    Sub AddToCollection(ByVal collection As Dictionary(Of String, Integer), ByVal key As String)
 
        If Not (collection.ContainsKey(key)) Then
        
            collection.Add(key, 0)
        End If
        collection(key) = collection(key) + 1
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
			
			.ob_gCFR .ob_gC, .ob_gCFR .ob_gCW
			{
			    height: 80px !important;
			    background-image: none !important;
			    background-color: #FACDB8;
			}
		</style>
			
	</head>
	<body>	
		<form id="Form1" runat="server">					
		    <br />
		    <span class="tdText"><b>ASP.NET Grid - Summary Row</b></span>		
		    <br /><br />
		
		    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		
		    <br />
		    <span class="tdText">
		        You can easily display a summary row in the footer of the Grid using the <b>RowDataBound</b> event and the <b>ShowColumnsFooter</b> 
		        property. <br />You can have as much data in the footer row as you wish. As you can see in this example, you can make it look as if the Grid has multiple footer rows.
		    </span>
				
		    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 150 * FROM Orders"
		        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    </asp:SqlDataSource>
		
		    <br /><br /><br />
		
		    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>