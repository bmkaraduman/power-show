using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_commands_excel_style_autosave : OboutInc.oboutAJAXPage
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = false;
        grid1.AutoGenerateColumns = false;
        grid1.AllowRecordSelection = false;
        grid1.AllowAddingRecords = false;
        grid1.FolderStyle = "styles/premiere_blue";

        // creating the Templates
        //------------------------------------------------------------------------
        GridRuntimeTemplate PlainEditTemplate = new GridRuntimeTemplate();
        PlainEditTemplate.ID = "PlainEditTemplate";
        PlainEditTemplate.Template = new Obout.Grid.RuntimeTemplate();
        PlainEditTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreatePlainEditTemplate);
        
        
        GridRuntimeTemplate CheckBoxEditTemplate = new GridRuntimeTemplate();
        CheckBoxEditTemplate.ID = "CheckBoxEditTemplate";
        CheckBoxEditTemplate.Template = new Obout.Grid.RuntimeTemplate();
        CheckBoxEditTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCheckBoxEditTemplate);
        //------------------------------------------------------------------------

         // adding the templates to the Templates collection
        grid1.Templates.Add(PlainEditTemplate);
        grid1.Templates.Add(CheckBoxEditTemplate);


        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

        Column oCol2 = new Column();
        oCol2.DataField = "OrderDate";
        oCol2.HeaderText = "DATE";
        oCol2.Width = "100";
        oCol2.DataFormatString = "{0:MM/dd/yyyy}";
        oCol2.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipName";
        oCol3.HeaderText = "NAME";
        oCol3.Width = "200";
        oCol3.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipCity";
        oCol4.HeaderText = "CITY";
        oCol4.Width = "150";
        oCol4.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipPostalCode";
        oCol5.HeaderText = "POSTAL CODE";
        oCol5.Width = "150";
        oCol5.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol6 = new Column();
        oCol6.DataField = "ShipRegion";
        oCol6.HeaderText = "REGION";
        oCol6.Width = "150";
        oCol6.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol7 = new Column();
        oCol7.DataField = "ShipCountry";
        oCol7.HeaderText = "COUNTRY";
        oCol7.Width = "150";
        oCol7.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol8 = new Column();
        oCol8.DataField = "Sent";
        oCol8.HeaderText = "SENT";
        oCol8.Width = "100";
        oCol8.TemplateSettings.TemplateId = "CheckBoxEditTemplate";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);
        grid1.Columns.Add(oCol7);
        grid1.Columns.Add(oCol8);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        PopulateGrid();
    }

    public void CreatePlainEditTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();		
		e.Container.Controls.Add(oLiteral);
		oLiteral.DataBinding += new EventHandler(DataBindPlainEditTemplate);
	}
	protected void DataBindPlainEditTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"text\" class=\"excel-textbox\" value=\"" + oContainer.Value.ToString() + "\" " + "onfocus=\"markAsFocused(this)\" onblur=\"markAsBlured(this, '" + grid1.Columns[oContainer.ColumnIndex].DataField + "', " + oContainer.PageRecordIndex + ")\" />";
        
    }
    
   
    public void CreateCheckBoxEditTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();		
		e.Container.Controls.Add(oLiteral);
		oLiteral.DataBinding += new EventHandler(DataBindCreateCheckBoxEditTemplate);
	}
    protected void DataBindCreateCheckBoxEditTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<div onmousedown=\"editCheckBox(this, " + oContainer.PageRecordIndex + ")\" class=\"excel-checkbox\"> " + (oContainer.Value.ToString() == "True" ? "yes" : "no") + "</div><div style=\"display: none;\"><input type=\"checkbox\" onblur=\"saveCheckBoxChanges(this, " + oContainer.PageRecordIndex  + ")\" /></div>";
        
    }

    protected void PopulateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb");

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Orders");

        grid1.DataSource = ds;
        grid1.DataBind();

        myConn.Close();
    }

    public void UpdateOrder(string OrderDate, string ShipName, string ShipCity, string ShipPostalCode, string ShipRegion, string ShipCountry, string Sent, string OrderID)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;");

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET OrderDate=@OrderDate, ShipName=@ShipName, ShipCity=@ShipCity, ShipPostalCode=@ShipPostalCode, ShipRegion=@ShipRegion, Sent=@Sent WHERE OrderID=@OrderID", myConn);
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = OrderDate;
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = ShipName;
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = ShipCity;
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = ShipPostalCode;
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = ShipRegion;
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = Sent;
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = OrderID;

        myConn.Open();
        myComm.ExecuteNonQuery();
        myConn.Close();
    }
}