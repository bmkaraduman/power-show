using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_grouping_custom_headers : System.Web.UI.Page
{
    Grid grid1 = new Grid();
    GridRow lastGroupHeader;

    void Page_load(object sender, EventArgs e)
    {
        // Creating grid1
        grid1.ID = "Grid1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "SqlDataSource1";
        grid1.ShowMultiPageGroupsInfo = false;
        grid1.RowDataBound += RowDataBound;
        grid1.AllowGrouping = true;
        grid1.GroupBy = "CategoryID";
        grid1.GroupingSettings.AllowChanges = false;

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "ProductID";
        oCol1.HeaderText = "PRODUCT ID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;
        oCol1.Width = "150";

        Column oCol2 = new Column();
        oCol2.DataField = "CategoryID";
        oCol2.HeaderText = "CATEGORY ID";
        oCol2.Visible = false;
        oCol2.ReadOnly = true;
        oCol2.Width = "150";

        Column oCol3 = new Column();
        oCol3.DataField = "CategoryName";
        oCol3.Visible = false;
        
        Column oCol4 = new Column();
        oCol4.DataField = "ProductName";
        oCol4.HeaderText = "PRODUCT NAME";
        oCol4.Width = "150";

        Column oCol5 = new Column();
        oCol5.DataField = "UnitPrice";
        oCol5.HeaderText = "PRICE";
        oCol5.Width = "150";

        Column oCol6 = new Column();
        oCol6.DataField = "UnitsInStock";
        oCol6.HeaderText = "UNITS IN STOCK";
        oCol6.Width = "150";

        Column oCol7 = new Column();
        oCol7.DataField = "UnitsOnOrder";
        oCol7.HeaderText = "UNITS ON ORDER";
        oCol7.Width = "150";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);
        grid1.Columns.Add(oCol7);
   
        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
    }
    public void RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.DataRow)
        {
            if (lastGroupHeader != null)
            {
                Literal textContainer = lastGroupHeader.Cells[0].Controls[0].Controls[lastGroupHeader.Cells[0].Controls[0].Controls.Count - 1].Controls[0] as Literal;
                textContainer.Text = ((GridDataControlFieldCell)e.Row.Cells[2]).Text;

                textContainer.Text += "&#160;&#187;&#160;";

                HyperLink link = new HyperLink();
                link.CssClass = "header-link";
                link.Attributes["onclick"] = "alert('In a real application the category form should open.')";
                link.NavigateUrl = "aspnet_grouping_custom_headers.aspx?CategoryID=" + ((GridDataControlFieldCell)e.Row.Cells[1]).Text;
                link.Text = "Edit Category";

                textContainer.Parent.Controls.Add(link);

                lastGroupHeader = null;
            }

        }
        else if (e.Row.RowType == GridRowType.GroupHeader)
        {
            if (e.Row.GroupLevel == 0)
            {
                lastGroupHeader = e.Row;
            }
        }

    }
}