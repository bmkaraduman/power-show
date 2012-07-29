<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Collections.Generic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="C#">
    double tempTotalPrice = 0;
    int tempUnitsInStock = 0;
    int tempUnitsOnOrder = 0;
    int tempRowCounter = 0;
    
    Dictionary<int, double> totalPrices = new Dictionary<int, double>();
    Dictionary<int, int> unitsInStock = new Dictionary<int, int>();
    Dictionary<int, int> unitsOnOrder = new Dictionary<int, int>();
    Dictionary<int, int> rowCounter = new Dictionary<int, int>();
    
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
            if(e.Row.GroupLevel > 0)
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
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" PageSize="10"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" ShowMultiPageGroupsInfo="false"
			ShowColumnsFooter="false" ShowGroupFooter="true" OnRowDataBound="RowDataBound" AllowGrouping="true" GroupBy="CategoryID">
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
		    Set <b>ShowGroupFooter</b> to <span class="option2">true</span> to show an extra line at the bottom of each group, which may contain sub-totals.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>