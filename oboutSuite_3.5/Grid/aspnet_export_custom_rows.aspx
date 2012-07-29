<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="C#">
    double totalPrice = 0;
    int unitsInStock = 0;
    int unitsOnOrder = 0;

    double grandTotalPrice = 0;
    int grandUnitsInStock = 0;
    int grandUnitsOnOrder = 0;
    
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

    protected void grid1_RowExported(object sender, GridRowExportEventArgs e)
    {
        System.Drawing.Color backColor = System.Drawing.Color.White;
        
        switch (e.SourceRow.RowType)
        {
            case GridRowType.Header:
                backColor = System.Drawing.Color.LightBlue;
                break;
            case GridRowType.DataRow:
                backColor = System.Drawing.Color.LightGray;
                break;
            case GridRowType.GroupHeader:
                backColor = System.Drawing.Color.DarkGray;
                break;
            case GridRowType.GroupFooter:
                backColor = System.Drawing.Color.Yellow;
                break;
            case GridRowType.ColumnFooter:
                backColor = System.Drawing.Color.Orange;
                break;
        }

        foreach (TableCell cell in e.Row.Cells)
        {
            cell.BackColor = backColor;
        }
    }

    protected void grid1_DataBinding(object sender, EventArgs e)
    {
        grandTotalPrice = 0;
        grandUnitsInStock = 0;
        grandUnitsOnOrder = 0;
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
		<span class="tdText"><b>ASP.NET Grid - Export with Customized Individual Rows</b></span>		
		
		<br /><br />

        <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
        <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

        <br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" PageSize="10"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" ShowMultiPageGroupsInfo="false"
			ShowColumnsFooter="true" ShowGroupFooter="true" OnRowDataBound="RowDataBound" AllowGrouping="true" GroupBy="CategoryID"
            OnRowExported="grid1_RowExported" OnDataBinding="grid1_DataBinding">
			<Columns>
			    <obout:Column DataField="ProductID" HeaderText="PRODUCT ID" Visible="false" ReadOnly="true" Width="150" />
			    <obout:Column DataField="CategoryID" HeaderText="CATEGORY ID" Visible="false" ReadOnly="true" Width="150" />
				<obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" Width="150" />				
				<obout:Column DataField="UnitPrice" HeaderText="PRICE" Width="150" DataFormatString="{0:C2}" />
				<obout:Column DataField="UnitsInStock" HeaderText="UNITS IN STOCK" Width="150" />
				<obout:Column DataField="UnitsOnOrder" HeaderText="UNITS ON ORDER" Width="150" />
			</Columns>
            <ExportingSettings ExportColumnsFooter="true" ExportGroupFooter="true" ExportGroupHeader="true" />
		</obout:Grid>
		
		<br />
		
        <span class="tdText">
		    The Grid exposes the <b>RowExported</b> event which allows you to manipulate each individual row from the Grid<br />
            (header, data, group header, group footer, column footer etc.). Using this event you can apply styles to the rows <br />
            from the exported files, to make them more user friendly. <br /><br />

            In this example we applied different background colors for each type of row.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>