<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim totalPrice As Double = 0
    Dim unitsInStock As Integer = 0
    Dim unitsOnOrder As Integer = 0

    Dim grandTotalPrice As Double = 0
    Dim grandUnitsInStock As Integer = 0
    Dim grandUnitsOnOrder As Integer = 0
    
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.DataSourceID = "sds1"
        grid1.PageSize = 10
        grid1.AllowAddingRecords = False
        grid1.ShowMultiPageGroupsInfo = False
        grid1.ShowColumnsFooter = True
        grid1.ShowGroupFooter = True
        grid1.AllowGrouping = True
        grid1.GroupBy = "CategoryID"
        AddHandler grid1.DataBinding, AddressOf grid1_DataBinding
        AddHandler grid1.RowDataBound, AddressOf RowDataBound
        AddHandler grid1.RowExported, AddressOf grid1_RowExported
        
        grid1.ExportingSettings.ExportColumnsFooter = True
        grid1.ExportingSettings.ExportGroupFooter = True
        grid1.ExportingSettings.ExportGroupHeader = True
        
		' creating the columns
		Dim oCol1 As Column = new Column()
        oCol1.DataField = "ProductID"
        oCol1.Visible = False
        oCol1.ReadOnly = True
        oCol1.HeaderText = "PRODUCT ID"
        oCol1.Width = "150"

		Dim oCol2 As Column = new Column()
        oCol2.DataField = "CategoryID"
        oCol2.Visible = False
        oCol2.ReadOnly = True
        oCol2.HeaderText = "CATEGORY ID"
        oCol2.Width = "150"

		Dim oCol3 As Column = new Column()
        oCol3.DataField = "ProductName"
        oCol3.HeaderText = "PRODUCT NAME"
        oCol3.Width = "150"

		Dim oCol4 As Column = new Column()
        oCol4.DataField = "UnitPrice"
        oCol4.HeaderText = "PRICE"
        oCol4.Width = "150"
        oCol4.DataFormatString = "{0:C2}"

		Dim oCol5 As Column = new Column()
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
   
        If (e.Row.RowType = GridRowType.DataRow) Then
        
            totalPrice += Double.Parse(e.Row.Cells(3).Text)
            unitsInStock += Integer.Parse(e.Row.Cells(4).Text)
            unitsOnOrder += Integer.Parse(e.Row.Cells(5).Text)

            grandTotalPrice += Double.Parse(e.Row.Cells(3).Text)
            grandUnitsInStock += Integer.Parse(e.Row.Cells(4).Text)
            grandUnitsOnOrder += Integer.Parse(e.Row.Cells(5).Text)
        
        ElseIf (e.Row.RowType = GridRowType.GroupFooter) Then
            e.Row.Cells(2).Text = "Total:"
            e.Row.Cells(3).Text = "$" + totalPrice.ToString()
            e.Row.Cells(4).Text = unitsInStock.ToString()
            e.Row.Cells(5).Text = unitsOnOrder.ToString()

            totalPrice = 0
            unitsInStock = 0
            unitsOnOrder = 0
       
        ElseIf (e.Row.RowType = GridRowType.ColumnFooter) Then
            e.Row.Cells(2).Text = "Total:"
            e.Row.Cells(3).Text = "$" + grandTotalPrice.ToString()
            e.Row.Cells(4).Text = grandUnitsInStock.ToString()
            e.Row.Cells(5).Text = grandUnitsOnOrder.ToString()
        End If
        
    End Sub

    Sub grid1_RowExported(ByVal sender As Object, ByVal e As GridRowExportEventArgs)

        Dim backColor As System.Drawing.Color = System.Drawing.Color.White

        Select Case e.SourceRow.RowType
      
            Case GridRowType.Header
                backColor = System.Drawing.Color.LightBlue
    
            Case GridRowType.DataRow
                backColor = System.Drawing.Color.LightGray
              
            Case GridRowType.GroupHeader
                backColor = System.Drawing.Color.DarkGray
                
            Case GridRowType.GroupFooter
                backColor = System.Drawing.Color.Yellow
              
            Case GridRowType.ColumnFooter
                backColor = System.Drawing.Color.Orange
              
        End Select
        

        For Each cell As TableCell In e.Row.Cells
       
            cell.BackColor = backColor
        Next
    End Sub
    
    Sub grid1_DataBinding(ByVal sender As Object, ByVal e As EventArgs)
    
        grandTotalPrice = 0
        grandUnitsInStock = 0
        grandUnitsOnOrder = 0
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
		<script type="text/javascript">
		    function exportToExcel() {
		        grid1.exportToExcel();
		    }

		    function exportToWord() {
		        grid1.exportToWord();
		    }
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />

		<span class="tdText"><b>ASP.NET Grid - Export with Customized Individual Rows</b></span>
		
		<br /><br />

        <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
        <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

        <br /><br />
		
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<span class="tdText">
		    The Grid exposes the <b>RowExported</b> event which allows you to manipulate each individual row from the Grid<br />
            (header, data, group header, group footer, column footer etc.). Using this event you can apply styles to the rows <br />
            from the exported files, to make them more user friendly. <br /><br />

            In this example we applied different background colors for each type of row.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>