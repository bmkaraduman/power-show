using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;
using System.Collections;
using System.Web.Services;

public partial class Grid_aspnet_rows_draganddrop_between_grids : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Products"] == null)
        {
            LoadProducts();
        }

        PopulateGrids();
    }

    protected void LoadProducts()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ProductID");
        dt.Columns.Add("RowPosition", typeof(int));
        dt.Columns.Add("ProductName");
        dt.Columns.Add("SKU");
        dt.Columns.Add("Price");

        dt.DefaultView.Sort = "RowPosition ASC";

        DataTable dtAll = new DataTable();
        dtAll.Columns.Add("ProductID");
        dtAll.Columns.Add("RowPosition", typeof(int));
        dtAll.Columns.Add("ProductName");
        dtAll.Columns.Add("SKU");
        dtAll.Columns.Add("Price");

        dtAll.DefaultView.Sort = "RowPosition ASC";

        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb");
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 15 ProductID, ProductName, UnitPrice FROM Products", myConn);
        OleDbDataReader reader = myComm.ExecuteReader();

        int i = 0;
        while(reader.Read())
        {
            DataRow row = dt.NewRow();
            row["ProductID"] = reader.GetInt32(0);
            row["RowPosition"] = i;
            row["ProductName"] = reader.GetString(1);
            row["SKU"] = "SKU" + i.ToString();
            row["Price"] = reader.GetDecimal(2);
            
            dt.Rows.Add(row);

            DataRow row2 = dtAll.NewRow();
            row2["ProductID"] = reader.GetInt32(0);
            row2["RowPosition"] = i;
            row2["ProductName"] = reader.GetString(1);
            row2["SKU"] = "SKU" + i.ToString();
            row2["Price"] = reader.GetDecimal(2);

            dtAll.Rows.Add(row2);

            i++;
        }

        reader.Close();
        myConn.Close();

        Session["Products"] = dt;
        Session["AllProducts"] = dtAll;

        DataTable dt2 = new DataTable();
        dt2.Columns.Add("ProductID");
        dt2.Columns.Add("RowPosition", typeof(int));
        dt2.Columns.Add("ProductName");
        dt2.Columns.Add("SKU");
        dt2.Columns.Add("Price");

        dt2.DefaultView.Sort = "RowPosition ASC";

        Session["PurchasedProducts"] = dt2;
    }

    protected void PopulateGrids()
    {
        Grid1.DataSource = (Session["Products"] as DataTable);
        Grid1.DataBind();

        Grid2.DataSource = (Session["PurchasedProducts"] as DataTable);
        Grid2.DataBind();
    }

    [WebMethod]
    public static void SaveRowsPosition(string data)
    {
        string[] gridsData = data.Split('|');

        UpdateRowPositions(gridsData[0], "Products");
        UpdateRowPositions(gridsData[1], "PurchasedProducts");       
    }

    protected static void UpdateRowPositions(string data, string tableName)
    {
        Dictionary<int, int> rowPositions = new Dictionary<int, int>();
        string[] items = data.Split(',');

        foreach (string item in items)
        {
            if (!string.IsNullOrEmpty(item))
            {
                string[] itemData = item.Split('*');
                rowPositions.Add(int.Parse(itemData[0]), int.Parse(itemData[1]));
            }
        }

        DataTable dt = HttpContext.Current.Session["AllProducts"] as DataTable;

        DataTable newDataTable = new DataTable();
        newDataTable.Columns.Add("ProductID");
        newDataTable.Columns.Add("RowPosition", typeof(int));
        newDataTable.Columns.Add("ProductName");
        newDataTable.Columns.Add("SKU");
        newDataTable.Columns.Add("Price");

        newDataTable.DefaultView.Sort = "RowPosition ASC";

        foreach (DataRow dr in dt.Rows)
        {
            int productId = int.Parse(dr["ProductID"].ToString());
            if (rowPositions.ContainsKey(productId))
            {
                DataRow row = newDataTable.NewRow();
                row["ProductID"] = dr["ProductID"];

                int rowPosition = rowPositions[productId];
                row["RowPosition"] = rowPosition;

                row["ProductName"] = dr["ProductName"];
                row["SKU"] = dr["SKU"];
                row["Price"] = dr["Price"];

                newDataTable.Rows.Add(row);
            }
        }

        HttpContext.Current.Session[tableName] = newDataTable;
    }
}