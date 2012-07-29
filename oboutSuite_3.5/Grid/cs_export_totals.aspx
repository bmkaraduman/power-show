<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	Grid grid1 = new Grid();
    double totalPrice = 0;
    int unitsInStock = 0;
    int unitsOnOrder = 0;

    double grandTotalPrice = 0;
    int grandUnitsInStock = 0;
    int grandUnitsOnOrder = 0;
    
	void Page_load(object sender, EventArgs e)		
	{
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
        grid1.DataSourceID = "sds1";
		grid1.AutoGenerateColumns = false;
        grid1.PageSize = 10;
        grid1.ShowColumnsFooter = true;
        grid1.ShowGroupFooter = true;
        grid1.RowDataBound += RowDataBound;
        grid1.AllowGrouping = true;
        grid1.GroupBy = "CategoryID";
        grid1.ShowMultiPageGroupsInfo = false;
        grid1.AllowAddingRecords = false;
       

        grid1.ExportingSettings.ExportGroupFooter = true;
        grid1.ExportingSettings.ExportColumnsFooter = true;
        grid1.ExportingSettings.ExportGroupHeader = true; 
        		
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
    public void RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.DataRow)
        {
            totalPrice += double.Parse(e.Row.Cells[3].Text);
            unitsInStock += int.Parse(e.Row.Cells[4].Text);
            unitsOnOrder += int.Parse(e.Row.Cells[5].Text);

            grandTotalPrice += double.Parse(e.Row.Cells[3].Text);
            grandUnitsInStock += int.Parse(e.Row.Cells[4].Text);
            grandUnitsOnOrder += int.Parse(e.Row.Cells[5].Text);
        }
        else if (e.Row.RowType == GridRowType.GroupFooter)
        {
            e.Row.Cells[2].Text = "Total:";
            e.Row.Cells[3].Text = "$" + totalPrice.ToString();
            e.Row.Cells[4].Text = unitsInStock.ToString();
            e.Row.Cells[5].Text = unitsOnOrder.ToString();

            totalPrice = 0;
            unitsInStock = 0;
            unitsOnOrder = 0;
        }
        else if (e.Row.RowType == GridRowType.ColumnFooter)
        {
            e.Row.Cells[2].Text = "Total:";
            e.Row.Cells[3].Text = "$" + grandTotalPrice.ToString();
            e.Row.Cells[4].Text = grandUnitsInStock.ToString();
            e.Row.Cells[5].Text = grandUnitsOnOrder.ToString();
        }
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

		<span class="tdText"><b>ASP.NET Grid - Export Totals / Subtotals</b></span>
		
		<br /><br />

        <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
        <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

        <br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br />
		
		 <span class="tdText">
		    Using the exporting feature of the Grid you can export the rows containing the totals (column footer row) / subtotals (group footer row).<br /><br />
            By default, when exporting a grid, the totals / subtotals are not included in the generated excel / word file.<br />
            You need to set <b>ExportingSettings.ExportColumnsFooter</b> and <b>ExportingSettings.ExportGroupFooter</b> to <span class="option2">true</span> in order to export the totals / subtotals.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>