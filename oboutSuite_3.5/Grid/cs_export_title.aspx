<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	Grid grid1 = new Grid();
	
	void Page_load(object sender, EventArgs e)		
	{
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
        grid1.DataSourceID = "sds1";
        grid1.PageSize = 10;
        grid1.AllowAddingRecords = false;

        grid1.Exporting += grid1_Exporting;
        grid1.Exported += grid1_Exported;
        
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "ProductID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "PRODUCT ID";
        oCol1.Width = "150";

        Column oCol2 = new Column();
        oCol2.DataField = "CategoryID";
        oCol2.Visible = false;
        oCol2.ReadOnly = true;
        oCol2.HeaderText = "CATEGORY ID";
        oCol2.Width = "150";

        Column oCol3 = new Column();
        oCol3.DataField = "ProductName";
        oCol3.HeaderText = "PRODUCT NAME";
        oCol3.Width = "150";

        Column oCol4 = new Column();
        oCol4.DataField = "UnitPrice";
        oCol4.HeaderText = "PRICE";
        oCol4.Width = "150";

        Column oCol5 = new Column();
        oCol5.DataField = "UnitsInStock";
        oCol5.HeaderText = "UNITS IN STOCK";
        oCol5.Width = "150";

        Column oCol6 = new Column();
        oCol6.DataField = "UnitsOnOrder";
        oCol6.HeaderText = "UNITS ON ORDER";
        oCol6.Width = "150";

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		grid1.Columns.Add(oCol6);

        
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
	}
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
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
				
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
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>