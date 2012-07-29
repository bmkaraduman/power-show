using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;
using Obout.Interface;

public partial class Grid_aspnet_master_detail_with_inline_template : System.Web.UI.Page
{
    protected void Grid2_RowCreated(object sender, GridRowEventArgs e)
    {
        DetailGrid detailGrid = sender as DetailGrid;
        detailGrid.DataBound += new EventHandler(Grid2_DataBound);
    }

    void Grid2_DataBound(object sender, EventArgs e)
    {
        DetailGrid detailGrid = sender as DetailGrid;

        OboutDropDownList OrderCountry = detailGrid.Templates[0].Container.FindControl("OrderCountry") as OboutDropDownList;
        OboutTextBox OrderAddress = detailGrid.Templates[1].Container.FindControl("OrderAddress") as OboutTextBox;

        if (OrderCountry != null && OrderAddress != null)
        {
            OrderCountry.ID = detailGrid.ID + "_OrderCountry";
            OrderAddress.ID = detailGrid.ID + "_OrderAddress";

            detailGrid.Templates[0].ControlID = OrderCountry.ID;
            detailGrid.Templates[1].ControlID = OrderAddress.ID;
        }
    }
}