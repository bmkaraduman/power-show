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
		<span class="tdText"><b>ASP.NET Grid - Insert/Update/Delete using ObjectDataSource</b></span>
		<br /><br />
				
		<asp:ObjectDataSource runat="server" ID="ods1" SelectMethod="GetOrders" TypeName="OrdersData"
		    InsertMethod="InsertOrder" UpdateMethod="UpdateOrder" DeleteMethod="DeleteOrder">		    
		</asp:ObjectDataSource>
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowFiltering="true" DataSourceID="ods1">
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
				<obout:Column ID="Column6" HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>					
		</obout:Grid>
					
		<br /><br />
		
		<span class="tdText">
		    You can use the <b>InsertMethod</b>, <b>UpdateMethod</b> and <b>DeleteMethod</b> properties <br />
		    of the <b>ObjectDataSource</b> control to insert / update / delete records.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>