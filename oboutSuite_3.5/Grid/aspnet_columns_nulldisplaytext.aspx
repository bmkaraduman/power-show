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
		<span class="tdText"><b>ASP.NET Grid - Using the NullDisplayText property</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowAddingRecords="false" DataSourceID="sds1">
			<Columns>				
			    <obout:Column DataField="SupplierID" HeaderText="SUPPLIER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="200" runat="server" />
				<obout:Column DataField="ContactName" HeaderText="CONTACT NAME" Width="175" runat="server" />
				<obout:Column DataField="Phone" HeaderText="PHONE" Width="125" runat="server" />
				<obout:Column DataField="Fax" HeaderText="FAX" Width="125" NullDisplayText="N/A" runat="server" />
			</Columns>
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    Use the <b>NullDisplayText</b> property of the <b>Column</b> class to replace the NULL values from the database with a specific text.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Suppliers"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>