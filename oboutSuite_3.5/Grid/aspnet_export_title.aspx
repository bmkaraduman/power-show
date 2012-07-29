<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" type="text/C#">
    protected void grid1_Exporting(object sender, GridExportEventArgs e)
    {
        TableRow row = new TableRow();
        TableCell cell = new TableCell();

        cell.ColumnSpan = 4;
        cell.Text = "Report ran on " + DateTime.Now.ToString("MM/dd/yyyy");

        cell.HorizontalAlign = HorizontalAlign.Right;
        cell.Font.Bold = true;

        row.Cells.Add(cell);
        e.Table.Rows.Add(row);
    }

    protected void grid1_Exported(object sender, GridExportEventArgs e)
    {
        TableRow row = new TableRow();
        TableCell cell = new TableCell();

        cell.ColumnSpan = 4;
        cell.Text = (e.Table.Rows.Count - 2).ToString() + " records in the report";

        cell.HorizontalAlign = HorizontalAlign.Right;
        cell.Font.Bold = true;

        row.Cells.Add(cell);
        e.Table.Rows.Add(row);
    }
</script>

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
		<span class="tdText"><b>ASP.NET Grid - Title / Footer for the Exported Files</b></span>		
		
		<br /><br />

        <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
        <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

        <br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" PageSize="10"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1"
            OnExporting="grid1_Exporting" OnExported="grid1_Exported">
			<Columns>
			    <obout:Column DataField="ProductID" HeaderText="PRODUCT ID" Visible="false" ReadOnly="true" Width="150" />
			    <obout:Column DataField="CategoryID" HeaderText="CATEGORY ID" Visible="false" ReadOnly="true" Width="150" />
				<obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" Width="150" />				
				<obout:Column DataField="UnitPrice" HeaderText="PRICE" Width="150" />
				<obout:Column DataField="UnitsInStock" HeaderText="UNITS IN STOCK" Width="150" />
				<obout:Column DataField="UnitsOnOrder" HeaderText="UNITS ON ORDER" Width="150" />
			</Columns>
		</obout:Grid>
		
		<br />
		
        <span class="tdText">
		    When exporting a Grid to Excel / Word you can add extra rows to the exported file. <br />
            This example showcases the use of two extra rows - a title row and a footer row.<br />
            
            <br /><br />

            The Grid exposes two server-side events that assist you in adding extra rows to the exported files:
            <ul>
                <li><b>Exporting</b> - raised before any other row is added to the exported table. This should be used to add rows at the top of the file.</li>
                <li><b>Exported</b> - raised after all rows have been added to the exported table. This should be used to add rows at the bottom of the file.</li>
            </ul>
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>