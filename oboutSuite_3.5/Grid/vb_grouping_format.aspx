<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = true
        grid1.AutoGenerateColumns = false
        grid1.FolderStyle = "styles/grand_gray"
        grid1.DataSourceID = "sds1"
        grid1.AllowAddingRecords = false
        grid1.AllowGrouping = true
        grid1.GroupBy = "OrderDate"

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = true
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "150"
        oCol1.Visible = false

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "OrderDate"
        oCol3.HeaderText = "ORDER DATE"
        oCol3.DataFormatString_GroupHeader = "{0:MMMM dd, yyyy}"
        oCol3.DataFormatString = "{0:MM/dd/yyyy}"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShippedDate"
        oCol4.HeaderText = "SHIPPED DATE"
        oCol4.DataFormatString_GroupHeader = "{0:MMMM dd, yyyy}"
        oCol4.DataFormatString = "{0:MM/dd/yyyy}"
        oCol4.Width = "150"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "RequiredDate"
        oCol5.HeaderText = "REQUIRED DATE"
        oCol5.DataFormatString = "{0:MM/dd/yyyy}"
        oCol5.Width = "150"
        
        Dim oCol6 As Column = New Column()
        oCol6.DataField = "Freight"
        oCol6.HeaderText = "FREIGHT"
        oCol6.DataFormatString = "{0:C2}"
        oCol6.Width = "150"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)

        phGrid1.Controls.Add(grid1)
    End Sub
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

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
		<span class="tdText"><b>ASP.NET Grid - Formatting the Group Headers</b></span>		
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">
		    Use the <b>DataFormatString_GroupHeader</b> property of the <b>Column</b> class to format the data in the group headers.<br />
		    If <b>DataFormatString_GroupHeader</b> is not specified, the value of the <b>DataFormatString</b> property will be used instead.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>