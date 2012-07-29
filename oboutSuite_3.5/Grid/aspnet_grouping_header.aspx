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
		<span class="tdText"><b>ASP.NET Grid - Customize the Group Headers</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowAddingRecords="false" AllowGrouping="true" GroupBy="ShipCountry" DataSourceID="sds1">
			<TemplateSettings GroupHeaderTemplateId="GroupTemplate" />
			<Columns>				
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="SHIP NAME" Width="200" runat="server" />
				<obout:Column DataField="ShipCity" HeaderText="SHIP CITY" Width="125" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" Width="150" runat="server" />
				<obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="150" runat="server" />
			</Columns>
			<Templates>
			    <obout:GridTemplate runat="server" ID="GroupTemplate">
			        <Template>
			            <u><%# Container.Column.HeaderText %></u> : <i><%# Container.Value %></i> (<%# Container.Group.PageRecordsCount %> <%# Container.Group.PageRecordsCount > 1 ? "records" : "record" %>)
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    Use the <b>TemplateSettings.GroupHeaderTemplateId</b> property of the <b>Grid</b> class to customize the group headers.<br />
		    Beside the row data, the <b>Container</b> object of the template exposes two objects - <b>Group</b> and <b>Column</b> <br />
		    which can be used to retrieve information about the group and the column used in the grouping.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>