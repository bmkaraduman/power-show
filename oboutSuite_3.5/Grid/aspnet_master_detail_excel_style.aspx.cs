using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_master_detail_excel_style : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    System.Collections.Generic.Dictionary<string, Grid> details = new System.Collections.Generic.Dictionary<string, Grid>();

    public void SaveChanges(object sender, EventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        for (int i = 0; i < Grid1.RowsInViewState.Count; i++)
        {
            string customerID = ((TextBox)((GridDataControlFieldCell)Grid1.RowsInViewState[i].Cells[0]).FindControl("TextBox1")).Text;
            string companyName = ((TextBox)((GridDataControlFieldCell)Grid1.RowsInViewState[i].Cells[1]).FindControl("TextBox1")).Text;
            string address = ((TextBox)((GridDataControlFieldCell)Grid1.RowsInViewState[i].Cells[2]).FindControl("TextBox1")).Text;
            string city = ((TextBox)((GridDataControlFieldCell)Grid1.RowsInViewState[i].Cells[3]).FindControl("TextBox1")).Text;
            string country = ((TextBox)((GridDataControlFieldCell)Grid1.RowsInViewState[i].Cells[4]).FindControl("TextBox1")).Text;

            OleDbCommand myComm = new OleDbCommand("UPDATE CUSTOMERS SET CompanyName = @CompanyName, Address = @Address, City = @City, Country=@Country WHERE CustomerID = @CustomerID", myConn);

            myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = companyName;
            myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = address;
            myComm.Parameters.Add("@City", OleDbType.VarChar).Value = city;
            myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = country;
            myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = customerID;

            myComm.ExecuteNonQuery();
        }

        foreach (System.Collections.Generic.KeyValuePair<string, Grid> detail in details)
        {
            Grid detailGrid = detail.Value;

            for (int i = 0; i < detailGrid.RowsInViewState.Count; i++)
            {
                string orderId = ((TextBox)((GridDataControlFieldCell)detailGrid.RowsInViewState[i].Cells[0]).FindControl("TextBox1")).Text;
                string shipName = ((TextBox)((GridDataControlFieldCell)detailGrid.RowsInViewState[i].Cells[1]).FindControl("TextBox1")).Text;
                string orderDate = ((TextBox)((GridDataControlFieldCell)detailGrid.RowsInViewState[i].Cells[2]).FindControl("TextBox1")).Text;
                string shipCity = ((TextBox)((GridDataControlFieldCell)detailGrid.RowsInViewState[i].Cells[3]).FindControl("TextBox1")).Text;
                string shipCountry = ((TextBox)((GridDataControlFieldCell)detailGrid.RowsInViewState[i].Cells[4]).FindControl("TextBox1")).Text;

                OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, OrderDate = @OrderDate, ShipCity = @ShipCity, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn);

                myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = shipName;
                myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = orderDate;
                myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = shipCity;
                myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = shipCountry;
                myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = orderId;

                myComm.ExecuteNonQuery();
            }

            detailGrid.DataBind();
        }

        myConn.Close();

        Grid1.DataBind();
    }

    public void grid1_RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.DataRow && Grid1.RowsInViewState.Count > 0)
        {
            if (Grid1.RowsInViewState.Count > e.Row.RowIndex)
            {
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    GridDataControlFieldCell cell = e.Row.Cells[i] as GridDataControlFieldCell;
                    TextBox textBox = cell.FindControl("TextBox1") as TextBox;

                    GridDataControlFieldCell cellInViewState = Grid1.RowsInViewState[e.Row.RowIndex].Cells[i] as GridDataControlFieldCell;
                    TextBox textBoxInViewState = cellInViewState.FindControl("TextBox1") as TextBox;

                    textBox.Text = textBoxInViewState.Text;
                }
            }
        }
    }

    public void grid2_RowDataBound(object sender, GridRowEventArgs e)
    {
        Grid detail = sender as Grid;

        if (!details.ContainsKey(detail.ID))
        {
            details.Add(detail.ID, detail);
        }

        if (e.Row.RowType == GridRowType.DataRow && detail.RowsInViewState.Count > 0)
        {
            if (detail.RowsInViewState.Count > e.Row.RowIndex)
            {
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    GridDataControlFieldCell cell = e.Row.Cells[i] as GridDataControlFieldCell;
                    TextBox textBox = cell.FindControl("TextBox1") as TextBox;

                    GridDataControlFieldCell cellInViewState = detail.RowsInViewState[e.Row.RowIndex].Cells[i] as GridDataControlFieldCell;
                    TextBox textBoxInViewState = cellInViewState.FindControl("TextBox1") as TextBox;

                    textBox.Text = textBoxInViewState.Text;
                }
            }
        }
    }
}