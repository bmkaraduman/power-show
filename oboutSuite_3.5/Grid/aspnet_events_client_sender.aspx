<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

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
		    function onSelect(sender, records) {
		        alert("A record from " + sender.ID + " was selected.");
		    }
		</script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Exposing the sender for client-side events</b></span>
		
		<br /><br />
		
		<span class="tdText">Please select some records from the following grids.</span>
		
		<br /><br />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 10 OrderID, ShipName, ShipAddress, ShipCity, ShipCountry FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" DataSourceID="sds1" AllowAddingRecords="false" PageSize="5">
			<ClientSideEvents ExposeSender="true" OnClientSelect="onSelect" />
			<Columns>				
			    <obout:Column ID="Column1" DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="SHIP NAME" runat="server" />				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="SHIP CITY" runat="server" />
				<obout:Column ID="Column4" DataField="ShipCountry" HeaderText="SHIP COUNTRY" runat="server" />
			</Columns>
		</obout:Grid>
					
		<br /><br /><br />
		
		<obout:Grid id="grid2" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" DataSourceID="sds1" AllowAddingRecords="false" PageSize="5">
			<ClientSideEvents ExposeSender="true" OnClientSelect="onSelect" />
			<Columns>				
			    <obout:Column ID="Column5" DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column ID="Column6" DataField="ShipName" HeaderText="SHIP NAME" runat="server" />				
				<obout:Column ID="Column7" DataField="ShipCity" HeaderText="SHIP CITY" runat="server" />
				<obout:Column ID="Column8" DataField="ShipCountry" HeaderText="SHIP COUNTRY" runat="server" />
			</Columns>
		</obout:Grid>
		
		<br /><br /><br />
		
		<obout:Grid id="grid3" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" DataSourceID="sds1" AllowAddingRecords="false" PageSize="5">
			<ClientSideEvents ExposeSender="true" OnClientSelect="onSelect" />
			<Columns>				
			    <obout:Column ID="Column10" DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column ID="Column11" DataField="ShipName" HeaderText="SHIP NAME" runat="server" />				
				<obout:Column ID="Column12" DataField="ShipCity" HeaderText="SHIP CITY" runat="server" />
				<obout:Column ID="Column13" DataField="ShipCountry" HeaderText="SHIP COUNTRY" runat="server" />				    
			</Columns>
		</obout:Grid>
		
		<br /><br />
		
		<span class="tdText">
		    By setting the <b>ClientSideEvents.ExposeSender</b> property to <span class="option2">true</span>, the client-side grid object<br />
		    that raised the event will be available in the client-side event handlers.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>