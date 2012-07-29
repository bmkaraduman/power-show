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
		    function exportToExcel() {
		        grid1.exportToExcel();
		    }

		    function exportToWord() {
		        grid1.exportToWord();
		    }
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Export Templates</b></span>		
		
		<br /><br />

        <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
        <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

        <br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" PageSize="10"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1">
			<Columns>
			    <obout:Column DataField="ProductID" HeaderText="PRODUCT ID" Visible="false" ReadOnly="true" Width="150" />
			    <obout:Column DataField="CategoryID" HeaderText="CATEGORY ID" Visible="false" ReadOnly="true" Width="150" />
				<obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" Width="150">
                    <TemplateSettings TemplateId="CategoryTemplate" />
                </obout:Column>			
				<obout:Column DataField="UnitPrice" HeaderText="PRICE" Width="150">
                    <TemplateSettings TemplateId="PriceTemplate" />
                </obout:Column>
				<obout:Column DataField="UnitsInStock" HeaderText="UNITS IN STOCK" Width="150" />
				<obout:Column DataField="UnitsOnOrder" HeaderText="UNITS ON ORDER" Width="150" />
			</Columns>
            <ExportingSettings ExportTemplates="true" />
            <Templates>
                <obout:GridTemplate runat="server" ID="CategoryTemplate">
                    <Template>
                        <u><i><%# Container.Value %></i></u>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="PriceTemplate">
                    <Template>
                        <b>$<%# Container.Value %></b>
                    </Template>
                </obout:GridTemplate>
            </Templates>
		</obout:Grid>
		
		<br />
		
        <span class="tdText">
		    Using the exporting feature of the Grid you can export the data formatted using templates.<br /><br />
            By default, when exporting a grid, the data formatted using templates is not included in the generated excel / word file.<br />
            You need to set <b>ExportingSettings.ExportTemplates</b> to <span class="option2">true</span> in order to export the templates.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>