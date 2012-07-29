using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Web.Services;
using System.Collections;

public partial class Grid_cs_rows_reorder : System.Web.UI.Page
{
    Grid grid1 = new Grid();

   protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;
        grid1.ShowLoadingMessage = false;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.UpdateCommand += Grid1_UpdateCommand;
        grid1.AllowMultiRecordSelection = false;
        grid1.AllowSorting = false;

        //------------------------------------------------------------------------
        GridRuntimeTemplate Template1 = new GridRuntimeTemplate();
        Template1.ID = "Template1";
        Template1.Template = new Obout.Grid.RuntimeTemplate();
        Template1.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateTemplate1);
        //------------------------------------------------------------------------

        grid1.Templates.Add(Template1);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "RowPosition";
        oCol2.Visible = false;

        Column oCol3 = new Column();
        oCol3.DataField = "ShipName";
        oCol3.HeaderText = "SHIP NAME";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipCity";
        oCol4.HeaderText = "SHIP CITY";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipPostalCode";
        oCol5.HeaderText = "POSTAL CODE";

        Column oCol6 = new Column();
        oCol6.DataField = "ShipCountry";
        oCol6.HeaderText = "SHIP COUNTRY";

        Column oCol7 = new Column();
        oCol7.Width = "90";
        oCol7.TemplateSettings.TemplateId = "Template1";

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
   public void CreateTemplate1(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
   {
       PlaceHolder ph1 = new PlaceHolder();
       e.Container.Controls.Add(ph1);
       ph1.DataBinding += new EventHandler(DataBindTemplate1);
   }
   protected void DataBindTemplate1(Object sender, EventArgs e)
   {
       PlaceHolder ph1 = sender as PlaceHolder;
       Obout.Grid.TemplateContainer oContainer = ph1.NamingContainer as Obout.Grid.TemplateContainer;

       Literal oLiteral1 = new Literal();
       oLiteral1.Text = "<a href=\"javascript: //\" onclick=\"moveUp(" + oContainer.PageRecordIndex.ToString() + "," + oContainer.RecordIndex.ToString() + ")\"><img src=\"styles/black_glass/asc.gif\" alt=\"Move up\" border=\"0\" /></a>";
       
       Literal oLiteral2 = new Literal();
       oLiteral2.Text = "<a href=\"javascript: //\" onclick=\"moveDown(" + oContainer.PageRecordIndex.ToString() + "," + oContainer.RecordIndex.ToString() + ")\"><img src=\"styles/black_glass/desc.gif\" alt=\"Move down\" border=\"0\" /></a>";

       ph1.Controls.Add(oLiteral1);
       ph1.Controls.Add(oLiteral2);

   }
   protected void Grid1_UpdateCommand(object sender, GridRecordEventArgs e)
   {
       string[] rowPosition = e.Record["RowPosition"].ToString().Split('_');

       OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"));
       myConn.Open();

       string selectQuery = "";
       if (rowPosition[1] == "-1")
       {
           selectQuery = "SELECT TOP 1 OrderID, RowPosition FROM Orders_2 WHERE RowPosition <= @RowPosition AND OrderID <> @OrderID ORDER BY RowPosition DESC";
       }
       else
       {
           selectQuery = "SELECT TOP 1 OrderID, RowPosition FROM Orders_2 WHERE RowPosition >= @RowPosition AND OrderID <> @OrderID ORDER BY RowPosition ASC";
       }

       OleDbCommand myComm = new OleDbCommand(selectQuery, myConn);
       myComm.Parameters.Add("@RowPosition", OleDbType.Integer).Value = rowPosition[0];
       myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

       OleDbDataReader reader = myComm.ExecuteReader();

       if (reader.Read())
       {
           int toggeledOrderId = reader.GetInt32(0);
           int toggeledRowPosition = reader.GetInt32(1);

           int orderId = int.Parse(e.Record["OrderID"].ToString());
           int oldRowPosition = int.Parse(rowPosition[0]);

           OleDbCommand myComm2 = new OleDbCommand("UPDATE Orders_2 SET RowPosition=@RowPosition WHERE OrderID = @OrderID", myConn);
           myComm2.Parameters.Add("@RowPosition", OleDbType.Integer).Value = toggeledRowPosition;
           myComm2.Parameters.Add("@OrderID", OleDbType.Integer).Value = orderId;
           myComm2.ExecuteNonQuery();

           OleDbCommand myComm3 = new OleDbCommand("UPDATE Orders_2 SET RowPosition=@RowPosition WHERE OrderID = @OrderID", myConn);
           myComm3.Parameters.Add("@RowPosition", OleDbType.Integer).Value = oldRowPosition;
           myComm3.Parameters.Add("@OrderID", OleDbType.Integer).Value = toggeledOrderId;
           myComm3.ExecuteNonQuery();

           Hashtable record = new Hashtable();
           record.Add("OrderID", orderId);
           record.Add("RowPosition", toggeledRowPosition);
           record.Add("ShipName", e.Record["ShipName"].ToString());
           record.Add("ShipCity", e.Record["ShipCity"].ToString());
           record.Add("ShipPostalCode", e.Record["ShipPostalCode"].ToString());
           record.Add("ShipCountry", e.Record["ShipCountry"].ToString());
           grid1.SelectedRecords.Add(record);
       }


       myConn.Close();
   }
}