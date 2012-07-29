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
		<span class="tdText"><b>ASP.NET Grid - Export Groups</b></span>

        <br /><br />

        <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
        <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

        <br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowGrouping="true" ShowMultiPageGroupsInfo="false"		
			GroupBy="ShipCountry" DataSourceID="sds1" AllowAddingRecords="false">
			<Columns>
				<obout:Column ID="Column1" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
			    <obout:Column ID="Column2" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column3" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>
			</Columns>
            <ExportingSettings ExportAllPages="true" ExportGroupHeader="true" />					
		</obout:Grid>
		
		<br /><br />				
		
		<span class="tdText">
		    Using the exporting feature of the Grid you can export grouped records.<br /><br />
            By default, when exporting a grid, the group headers are not included in the generated excel / word file.<br />
            You need to set <b>ExportingSettings.ExportGroupHeader</b> to <span class="option2">true</span> in order to export the group headers.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM [Orders]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>