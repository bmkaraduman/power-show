<%@ Page Language="C#" Theme="GridTheme"%>
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
		<span class="tdText"><b>ASP.NET Grid - Customize using ASP.NET Themes/Skins</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 DataSourceID="sds1">
			<Columns>				
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="SHIP NAME" Width="200" runat="server" />
				<obout:Column DataField="ShipAddress" HeaderText="ADDRESS"  Width="200" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE"  Width="150" runat="server" />
				<obout:Column DataField="ShipCity" HeaderText="CITY"  Width="150" runat="server" />
			</Columns>
		</obout:Grid>
		
		<br />
		<span class="tdText">
		 The ASP.NET Grid control can be customized using ASP.NET Themes/Skins.
It is recommended to use this approach, so that you keep the common <br />settings for all the grids in your project in a single location 
(in the .skin file). Thus, each time you need to propagate a change related <br />to the Grid in all the pages of your project, 
you need to modify a single file, which saves time and prevents you from generating bugs.   
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>