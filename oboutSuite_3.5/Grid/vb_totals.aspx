<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script runat="server" Language="VB">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    
    Dim totalPrice As Double = 0
    Dim unitsInStock As Integer = 0
    Dim unitsOnOrder As Integer = 0
    	
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "sds1"
        grid1.ShowColumnsFooter = True

        ' setting the event handlers
        AddHandler CType(grid1, Grid).RowDataBound, AddressOf RowDataBound

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "ProductID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "PRODUCT ID"
        oCol1.Width = "150"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ProductName"
        oCol2.HeaderText = "PRODUCT NAME"
        oCol2.Width = "150"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "UnitPrice"
        oCol3.HeaderText = "PRICE"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "UnitsInStock"
        oCol4.HeaderText = "UNITS IN STOCK"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "UnitsOnOrder"
        oCol5.HeaderText = "UNITS ON ORDER"
        oCol5.Width = "150"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub
    
    Sub RowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)
        If e.Row.RowType = GridRowType.DataRow Then        
            totalPrice += Double.Parse(e.Row.Cells(2).Text)
            unitsInStock += Int32.Parse(e.Row.Cells(3).Text)
            unitsOnOrder += Int32.Parse(e.Row.Cells(4).Text)
        ElseIf e.Row.RowType = GridRowType.ColumnFooter Then
            e.Row.Cells(1).Text = "Total:"
            e.Row.Cells(2).Text = "$" + totalPrice.ToString()
            e.Row.Cells(3).Text = unitsInStock.ToString()
            e.Row.Cells(4).Text = unitsOnOrder.ToString()
        End If
    End Sub
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
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
		<span class="tdText"><b>ASP.NET Grid - Calculating totals in the footer of the columns</b></span>		
		
		<br /><br />
				
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		
		<br />
		<span class="tdText">
		    Set <b>ShowColumnsFooter</b> to <span class="option2">true</span> to show an extra line at the bottom of the grid, which may contain totals/averages etc.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>