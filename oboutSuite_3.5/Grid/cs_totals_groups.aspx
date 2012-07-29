<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Collections.Generic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="C#">
    Grid grid1 = new Grid();

    double tempTotalPrice = 0;
    int tempUnitsInStock = 0;
    int tempUnitsOnOrder = 0;
    int tempRowCounter = 0;

    Dictionary<int, double> totalPrices = new Dictionary<int, double>();
    Dictionary<int, int> unitsInStock = new Dictionary<int, int>();
    Dictionary<int, int> unitsOnOrder = new Dictionary<int, int>();
    Dictionary<int, int> rowCounter = new Dictionary<int, int>();
    	
    void Page_load(object sender, EventArgs e)		
	{			
		grid1.ID = "grid1";
		grid1.CallbackMode = true;
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "styles/black_glass";
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "sds1";
        grid1.AllowGrouping = true;
        grid1.ShowMultiPageGroupsInfo = false;
        grid1.GroupBy = "CategoryID";
        grid1.ShowColumnsFooter = false;
        grid1.ShowGroupFooter = true;

		// setting the event handlers
        grid1.RowDataBound += new Obout.Grid.GridRowEventHandler(RowDataBound);		

		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "ProductID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "PRODUCT ID";
		oCol1.Width = "150";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "CategoryID";
        oCol2.ReadOnly = true;
        oCol2.HeaderText = "CATEGORY ID";
        oCol2.Width = "150";
        oCol2.Visible = false;

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
            tempTotalPrice += double.Parse(e.Row.Cells[3].Text);
            tempUnitsInStock += int.Parse(e.Row.Cells[4].Text);
            tempUnitsOnOrder += int.Parse(e.Row.Cells[5].Text);
            tempRowCounter++;
        }
        else if (e.Row.RowType == GridRowType.GroupFooter)
        {
            if (e.Row.GroupLevel > 0)
            {
                for (int level = e.Row.GroupLevel - 1; level >= 0; level--)
                {
                    if (!totalPrices.ContainsKey(level))
                    {
                        totalPrices.Add(level, 0);
                        unitsInStock.Add(level, 0);
                        unitsOnOrder.Add(level, 0);
                        rowCounter.Add(level, 0);
                    }

                    totalPrices[level] += tempTotalPrice;
                    unitsInStock[level] += tempUnitsInStock;
                    unitsOnOrder[level] += tempUnitsOnOrder;
                    rowCounter[level] += tempRowCounter;
                }
            }

            double priceToDisplay = 0;
            int unitsInStockToDisplay = 0;
            int unitsOnOrderToDisplay = 0;
            int rowCounterToDisplay = 0;

            if (totalPrices.ContainsKey(e.Row.GroupLevel))
            {
                priceToDisplay = totalPrices[e.Row.GroupLevel];
                unitsInStockToDisplay = unitsInStock[e.Row.GroupLevel];
                unitsOnOrderToDisplay = unitsOnOrder[e.Row.GroupLevel];
                rowCounterToDisplay = rowCounter[e.Row.GroupLevel];

                totalPrices[e.Row.GroupLevel] = 0;
                unitsInStock[e.Row.GroupLevel] = 0;
                unitsOnOrder[e.Row.GroupLevel] = 0;
                rowCounter[e.Row.GroupLevel] = 0;
            }
            else
            {
                priceToDisplay = tempTotalPrice;
                unitsInStockToDisplay = tempUnitsInStock;
                unitsOnOrderToDisplay = tempUnitsOnOrder;
                rowCounterToDisplay = tempRowCounter;
            }

            e.Row.Cells[2].Text = "Total (" + rowCounterToDisplay.ToString() + " item" + (rowCounterToDisplay > 1 ? "s" : "") + "):";
            e.Row.Cells[3].Text = "$" + priceToDisplay.ToString();
            e.Row.Cells[4].Text = unitsInStockToDisplay.ToString();
            e.Row.Cells[5].Text = unitsOnOrderToDisplay.ToString();

            tempTotalPrice = 0;
            tempUnitsInStock = 0;
            tempUnitsOnOrder = 0;
            tempRowCounter = 0;
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
			
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Sub-Totals in Group Footers</b></span>		
		
		<br /><br />
				
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		
		<br />
		<span class="tdText">
		    Set <b>ShowGroupFooter</b> to <span class="option2">true</span> to show an extra line at the bottom of each group, which may contain sub-totals.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>