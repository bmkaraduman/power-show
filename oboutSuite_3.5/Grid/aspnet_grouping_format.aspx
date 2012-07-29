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
		<span class="tdText"><b>ASP.NET Grid - Formatting the Group Headers</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowAddingRecords="false" AllowGrouping="true" GroupBy="OrderDate" DataSourceID="sds1">
			<Columns>				
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="SHIP NAME" Width="200" runat="server" />
				<obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString_GroupHeader="{0:MMMM dd, yyyy}" DataFormatString="{0:MM/dd/yyyy}" Width="150" runat="server" />
				<obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString_GroupHeader="{0:MMMM dd, yyyy}" DataFormatString="{0:MM/dd/yyyy}" Width="150" runat="server" />
				<obout:Column DataField="RequiredDate" HeaderText="REQUIRED DATE" DataFormatString="{0:MM/dd/yyyy}" Width="150" runat="server" />
				<obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}" Width="150" runat="server" />
			</Columns>
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    Use the <b>DataFormatString_GroupHeader</b> property of the <b>Column</b> class to format the data in the group headers.<br />
		    If <b>DataFormatString_GroupHeader</b> is not specified, the value of the <b>DataFormatString</b> property will be used instead.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>