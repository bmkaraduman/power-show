using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_totals_groups_headers : System.Web.UI.Page
{
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