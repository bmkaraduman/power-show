<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = False
        grid1.AutoGenerateColumns = False
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "sds1"
        
        grid1.ClientSideEvents.OnClientExportStart = "showLoadingMessage"
        grid1.ClientSideEvents.OnClientExportFinish = "hideLoadingMessage"

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "150"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "150"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
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
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
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
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>