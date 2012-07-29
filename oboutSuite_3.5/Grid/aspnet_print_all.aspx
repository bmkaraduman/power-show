<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

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
		<script type="text/javascript">
		    var printGridOnCallback = false;
		    var currentPageSize = 10;

		    function printGrid(printAll) {
		        if (printAll) {
		            printGridOnCallback = true;
		            currentPageSize = grid1.getPageSize();
		            ob_grid1PageSizeSelector.value(-1);
		        } else {
		            grid1.print();
		        }

		        return false;
		    }

		    function grid1_Callback() {
		        if (printGridOnCallback) {
		            grid1.print();
		            printGridOnCallback = false;
		            ob_grid1PageSizeSelector.value(currentPageSize);
		        }
		    }
		</script>
		<style type="text/css" media="print">
		    .ob_gPSTT
			{
			    display: none !important;
			}
		</style>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Printing all the pages of the Grid</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			AllowAddingRecords="false" DataSourceID="sds1" PageSizeOptions="-1,10,50,100"
			FolderStyle="styles/premiere_blue">
			<ClientSideEvents OnClientCallback="grid1_Callback" />
			<Columns>				
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Width="125" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="150" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="125" runat="server" />								
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />				
			</Columns>
		</obout:Grid>
		
		<br />
		
		<obout:OboutButton ID="OboutButton1" runat="server" Text="Print Current Page" OnClientClick="return printGrid(false);" FolderStyle="../Interface/styles/premiere_blue/OboutButton" />
		
		<obout:OboutButton ID="OboutButton2" runat="server" Text="Print All Pages" OnClientClick="return printGrid(true);" FolderStyle="../Interface/styles/premiere_blue/OboutButton" />
		
		<br /><br />
		
		<span class="tdText">
		    Use the <b>print</b> client-side method to print the pages of the grid.<br />
		    In this sample we use a small JavaScript trick to print all the pages from the grid.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>