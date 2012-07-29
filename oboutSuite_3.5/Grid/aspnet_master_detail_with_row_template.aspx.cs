using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;
using Obout.Interface;

public partial class Grid_aspnet_master_detail_with_row_template : System.Web.UI.Page
{
    protected void grid2_RowCreated(object sender, GridRowEventArgs e)
    {
        DetailGrid detailGrid = sender as DetailGrid;
        detailGrid.DataBound += new EventHandler(grid2_DataBound);
    }

    void grid2_DataBound(object sender, EventArgs e)
    {
        DetailGrid detailGrid = sender as DetailGrid;

        OboutTextBox txtShipName = detailGrid.Templates[0].Container.FindControl("txtShipName") as OboutTextBox;
        OboutTextBox txtShipCity = detailGrid.Templates[0].Container.FindControl("txtShipCity") as OboutTextBox;
        OboutDropDownList ddlShipCountries = detailGrid.Templates[0].Container.FindControl("ddlShipCountries") as OboutDropDownList;

        if (txtShipName != null && txtShipCity != null && ddlShipCountries != null)
        {
            txtShipName.ID = detailGrid.ID + "_txtShipName";
            txtShipCity.ID = detailGrid.ID + "_txtShipCity";
            ddlShipCountries.ID = detailGrid.ID + "_ddlShipCountries";

            detailGrid.Columns[2].TemplateSettings.RowEditTemplateControlId = txtShipName.ID;
            detailGrid.Columns[3].TemplateSettings.RowEditTemplateControlId = txtShipCity.ID;
            detailGrid.Columns[4].TemplateSettings.RowEditTemplateControlId = ddlShipCountries.ID;
        }
    }
}