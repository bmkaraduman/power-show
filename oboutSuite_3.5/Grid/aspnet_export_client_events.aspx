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
		        grid1.exportToExcel('test', false, false, true, true)
		    }
		    
		    function showLoadingMessage() {
		        document.getElementById('loadingContainer').style.display = '';
		    }

		    function hideLoadingMessage() {
		        window.setTimeout(finishHideLoadingMessage, 250);
		    }

		    function finishHideLoadingMessage() {
		        document.getElementById('loadingContainer').style.display = 'none';
		    }
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Using the OnClientExportStart / OnClientExportFinish client-side events</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/premiere_blue" AllowAddingRecords="false" DataSourceID="sds1">
			<ClientSideEvents OnClientExportStart="showLoadingMessage" OnClientExportFinish="hideLoadingMessage" />
			<Columns>				
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Width="150" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />								
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />				
			</Columns>
		</obout:Grid>
		
		<br />
		
		<input type="button" onclick="exportToExcel()" value="Export to Excel" class="tdText" />
		
		<span class="tdText" id="loadingContainer" style="display: none;">
		    &#160;&#160;&#160;&#160;&#160;
		    <img src="../AjaxPage/loading_icons/6.gif" alt=""/>
		</span>
		
		<br /><br />				
		
		<span class="tdText">
		    The loading indicator appears when the "Export to Excel" button is clicked and it dissappears when the file is available for download.<br /><br />
		    
		    The <b>OnClientExportStart</b> client-side event is raised when the exporting feature is started.<br />
		    The <b>OnClientExportFinish</b> client-side event is raised when the exported file is ready for download.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>