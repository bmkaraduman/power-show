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
			
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Showing ALL the records</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowAddingRecords="false" DataSourceID="sds1"
			PageSize="-1" PageSizeOptions="1,2,3,4,5,6,7,8,9,10,-1">
			<Columns>				
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Width="150" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />								
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />				
			</Columns>
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    To show all the records of the grid set the <b>PageSize</b> property to <span class="option2">-1</span>
		    <br /><br />
		    To add the <b>ALL</b> option to the page size selector, you need to append <span class="option2">-1</span> to the value of the <b>PageSizeOptions</b> property:<br />
		    <span class="option2">PageSizeOptions="1,2,3,4,5,6,7,8,9,10,<b>-1</b>"</span>
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 15 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>