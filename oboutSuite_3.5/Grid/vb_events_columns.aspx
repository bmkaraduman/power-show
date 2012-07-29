<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="VB" runat="server">	
    Dim grid1 As Obout.Grid.Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = True
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "sds1"
        
        AddHandler CType(grid1, Grid).ColumnsCreated, AddressOf OnColumnsCreated

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub
    
    Sub OnColumnsCreated(ByVal sender As Object, ByVal args As EventArgs)    
        ' hide first column
        grid1.Columns(0).Visible = false
        
        ' configure the other columns
        grid1.Columns(1).HeaderText = "SHIP NAME"
        grid1.Columns(1).Width = "150"

        grid1.Columns(2).HeaderText = "SHIP ADDRESS"
        grid1.Columns(2).Width = "200"

        grid1.Columns(3).HeaderText = "SHIP CITY"
        grid1.Columns(4).HeaderText = "SHIP COUNTRY"
    End Sub
</script>

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
		
		<span class="tdText"><b>ASP.NET Grid - Using the OnColumnsCreated event</b></span>
		
		<br /><br />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 OrderID, ShipName, ShipAddress, ShipCity, ShipCountry FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br /><br />
		
		<span class="tdText">
		    You can use the <b>OnColumnsCreated</b> event to configure the properties of the columns, when <b>AutoGenerateColumns</b> is set to <span class="option2">true</span>.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>