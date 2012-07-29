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
		<span class="tdText"><b>ASP.NET Grid - Binding to XmlDataSource</b></span>
		<br /><br />
				
		<asp:XmlDataSource runat="server" ID="XmlDataSource1" DataFile="~/App_Data/xml/Grid.xml" />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" AllowAddingRecords="false"
			FolderStyle="styles/grand_gray" AllowFiltering="true" DataSourceID="XmlDataSource1">
			<Columns>
				<obout:Column ID="Column1" DataField="ClientID" ReadOnly="true" HeaderText="CLIENT ID" Width="100" runat="server"/>
				<obout:Column ID="Column2" DataField="FirstName" HeaderText="FIRST NAME" Width="200" runat="server"/>				
				<obout:Column ID="Column3" DataField="LastName" HeaderText="LAST NAME" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="Email" HeaderText="EMAIL" Width="150" runat="server" />
				<obout:Column ID="Column5" DataField="Country" HeaderText="COUNTRY" Width="150" runat="server" />
			</Columns>					
		</obout:Grid>
        
		<br /><br /><br />
		
		<span class="tdText">
		    You can load XML documents into the Grid by using a XmlDataSource control.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>