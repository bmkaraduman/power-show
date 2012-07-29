using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_cs_totals_groups_headers : System.Web.UI.Page
{
    Grid grid1 = new Grid();


    double tempTotalPrice = 0;
    int tempUnitsInStock = 0;
    int tempUnitsOnOrder = 0;
    int tempRowCounter = 0;

    Dictionary<int, double> totalPrices = new Dictionary<int, double>();
    Dictionary<int, int> unitsInStock = new Dictionary<int, int>();
    Dictionary<int, int> unitsOnOrder = new Dictionary<int, int>();
    Dictionary<int, int> rowCounter = new Dictionary<int, int>();
    Dictionary<int, GridRow> lastGroupHeaders = new Dictionary<int, GridRow>();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.DataSourceID = "sds1";
        grid1.FolderStyle = "styles/black_glass";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.Serialize = true;
        grid1.CallbackMode = true; 
        grid1.PageSize = 10;
	    grid1.ShowMultiPageGroupsInfo = false;
		grid1.ShowColumnsFooter = false;
        grid1.ShowGroupFooter = true;
        grid1.RowDataBound += RowDataBound;
        grid1.AllowGrouping = true;
        grid1.GroupBy = "CategoryID";
        grid1.AllowColumnResizing = true;

        grid1.ClientSideEvents.OnClientCallback = "updateGroupTotalsWidths";
     

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "ProductID";
        oCol1.HeaderText = "PRODUCT ID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;
        oCol1.Width="150"; 

        Column oCol2 = new Column();
        oCol2.DataField = "CategoryID";
        oCol2.HeaderText = "CATEGORY ID";
        oCol2.Visible = false;
        oCol2.ReadOnly = true;
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
        oCol6.Width = "150";
        oCol6.DataField = "UnitsOnOrder";
        oCol6.HeaderText = "UNITS ON ORDER";

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
        else if (e.Row.RowType == GridRowType.GroupHeader)
        {
            //Literal textContainer = e.Row.Cells[0].Controls[0].Controls[1].Controls[0] as Literal;
            if (!lastGroupHeaders.ContainsKey(e.Row.GroupLevel))
            {
                lastGroupHeaders.Add(e.Row.GroupLevel, null);
            }

            lastGroupHeaders[e.Row.GroupLevel] = e.Row;
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

            // Display information in Group header
            Literal textContainer = lastGroupHeaders[e.Row.GroupLevel].Cells[0].Controls[0].Controls[lastGroupHeaders[e.Row.GroupLevel].Cells[0].Controls[0].Controls.Count - 1].Controls[0] as Literal;
            textContainer.Text = "<div class='group-total'>" + textContainer.Text + "</div>";
            textContainer.Text += "<div class='group-total' style='margin-left: " + (147 - (23 * e.Row.GroupLevel)).ToString() + "px;'>Price: $" + priceToDisplay.ToString() + "</div>";
            textContainer.Text += "<div class='group-total' style='margin-left: " + (297 - (23 * e.Row.GroupLevel)).ToString() + "px;'>Units in Stock:  $" + unitsInStockToDisplay.ToString() + "</div>";
            textContainer.Text += "<div class='group-total' style='margin-left: " + (447 - (23 * e.Row.GroupLevel)).ToString() + "px;'>Units on Order:  $" + unitsOnOrderToDisplay.ToString() + "</div>";


            // Display information in Group footer            
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
}