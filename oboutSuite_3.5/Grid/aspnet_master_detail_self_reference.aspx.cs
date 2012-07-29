using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_master_detail_self_reference : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected int level = 0;

    protected void Grid1_DataSourceNeeded(object sender, GridDataSourceNeededEventArgs e)
    {
        level++;

        e.HandledFiltering = false;
        e.HandledPaging = false;
        e.HandledSorting = false;

        Grid grid = (Grid)sender;

        AddDetailGrid(grid);

        if (!(grid is DetailGrid))
        {
            PopulateGrid(grid, "");
        }
        else
        {
            PopulateGrid(grid, e.ForeignKeysValues["CategoryID"]);
        }
    }

    protected void AddDetailGrid(Grid grid)
    {
        DetailGrid detail = new DetailGrid();
        detail.ID = "grid" + level.ToString();
        detail.AutoGenerateColumns = false;
        detail.Serialize = false;
        detail.AllowPageSizeSelection = false;
        detail.AllowPaging = false;
        detail.PageSize = -1;
        detail.AllowAddingRecords = true;
        detail.Width = Unit.Percentage(97);

        detail.ForeignKeys = "CategoryID";

        detail.ClientSideEvents.ExposeSender = true;
        detail.ClientSideEvents.OnClientPopulateControls = "onPopulateControls";
        detail.ClientSideEvents.OnBeforeClientDelete = "onBeforeClientDelete";

        foreach (Column column in grid.Columns)
        {
            Column newColumn = column.Clone() as Column;
            newColumn.SortOrder = SortOrderType.None;
            detail.Columns.Add(newColumn);
        }

        detail.MasterDetailSettings = grid.MasterDetailSettings;

        detail.DataSourceNeeded += Grid1_DataSourceNeeded;
        detail.InsertCommand += Grid1_InsertCommand;
        detail.UpdateCommand += Grid1_UpdateCommand;
        detail.DeleteCommand += Grid1_DeleteCommand;

        grid.DetailGrids.Add(detail);
    }

    protected void PopulateGrid(Grid grid, string parentId)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/categories.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT CategoryID, ParentID, CategoryText, Description, DateAdded, PriceRange FROM Categories WHERE ParentID" + (parentId == "" ? " = 0" : "=" + parentId) + " ORDER BY CategoryText", myConn);
        myConn.Open();

        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Categories");

        grid.DataSource = ds.Tables[0].DefaultView;
        grid.DataBind();

        myConn.Close();
    }

    protected void Grid1_InsertCommand(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/categories.mdb"));

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Categories(ParentID, CategoryText, Description, DateAdded, PriceRange) VALUES(@ParentID, @CategoryText, @Description, @DateAdded, @PriceRange)", myConn);
        myComm.Parameters.Add("@ParentID", OleDbType.Integer).Value = e.Record["ParentID"];
        myComm.Parameters.Add("@CategoryText", OleDbType.VarChar).Value = e.Record["CategoryText"];
        myComm.Parameters.Add("@Description", OleDbType.VarChar).Value = e.Record["Description"];
        myComm.Parameters.Add("@DateAdded", OleDbType.Date).Value = e.Record["DateAdded"];
        myComm.Parameters.Add("@PriceRange", OleDbType.VarChar).Value = e.Record["PriceRange"];        

        myConn.Open();

        myComm.ExecuteNonQuery();

        myConn.Close();
    }

    protected void Grid1_UpdateCommand(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/categories.mdb"));

        OleDbCommand myComm = new OleDbCommand("UPDATE Categories SET CategoryText=@CategoryText, Description=@Description, DateAdded=@DateAdded, PriceRange=@PriceRange WHERE CategoryID=@CategoryID", myConn);
        myComm.Parameters.Add("@CategoryText", OleDbType.VarChar).Value = e.Record["CategoryText"];
        myComm.Parameters.Add("@Description", OleDbType.VarChar).Value = e.Record["Description"];
        myComm.Parameters.Add("@DateAdded", OleDbType.Date).Value = e.Record["DateAdded"];
        myComm.Parameters.Add("@PriceRange", OleDbType.VarChar).Value = e.Record["PriceRange"];
        myComm.Parameters.Add("@CategoryID", OleDbType.Integer).Value = e.Record["CategoryID"];
        
        myConn.Open();

        myComm.ExecuteNonQuery();

        myConn.Close();
    }

    protected void Grid1_DeleteCommand(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/categories.mdb"));

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Categories WHERE CategoryID = @CategoryID", myConn);
        myComm.Parameters.Add("@CategoryID", OleDbType.Integer).Value = e.Record["CategoryID"];

        myConn.Open();

        myComm.ExecuteNonQuery();

        myConn.Close();
    }
}