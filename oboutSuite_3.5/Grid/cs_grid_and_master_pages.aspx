<%@ Page Language="C#" MasterPageFile="cs_grid.master" Title="obout ASP.NET Grid examples" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	Grid grid1 = new Grid();
	
	void Page_load(object sender, EventArgs e)		
	{
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
		
		grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowFiltering = true;
        grid1.ShowLoadingMessage = false;

		// setting the event handlers
		grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
		grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
		grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
		grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);
		
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ORDER ID";
		oCol1.Width = "100";
		
		Column oCol2 = new Column();
		oCol2.DataField = "ShipName";		
		oCol2.HeaderText = "NAME";
		oCol2.Width = "200";
		
		Column oCol3 = new Column();
		oCol3.DataField = "ShipCity";		
		oCol3.HeaderText = "CITY";
		oCol3.Width = "150";
		
		Column oCol4 = new Column();
		oCol4.DataField = "ShipPostalCode";		
		oCol4.HeaderText = "POSTAL CODE";
		oCol4.Width = "150";
											
		Column oCol5 = new Column();
		oCol5.DataField = "ShipCountry";		
		oCol5.HeaderText = "COUNTRY";
		oCol5.Width = "150";

		Column oCol6 = new Column();		
		oCol6.HeaderText = "EDIT";
		oCol6.Width = "125";
        oCol6.AllowEdit = true;
        oCol6.AllowDelete = true;

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		grid1.Columns.Add(oCol6);
		
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
		
		if (!Page.IsPostBack)
		{
			BindGrid();			
		}		
	}	

	void BindGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
		myConn.Open();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Orders");*/
		OleDbDataReader myReader = myComm.ExecuteReader();


		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}	
		
	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
		OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = " + e.Record["OrderID"].ToString(), myConn);
		myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
		OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName='" + e.Record["ShipName"].ToString().Replace("'", "''") + "', ShipCity='" + e.Record["ShipCity"].ToString().Replace("'", "''") + "', ShipPostalCode='" + e.Record["ShipPostalCode"].ToString().Replace("'", "''") + "', ShipCountry='" + e.Record["ShipCountry"].ToString().Replace("'", "''") + "' WHERE OrderID = " + e.Record["OrderID"].ToString(), myConn);
		myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
		OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES('" + e.Record["ShipName"].ToString().Replace("'", "''") + "', '" + e.Record["ShipCity"].ToString().Replace("'", "''") + "', '" + e.Record["ShipPostalCode"].ToString().Replace("'", "''") + "', '" + e.Record["ShipCountry"].ToString().Replace("'", "''") + "')", myConn);
		myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void RebindGrid(object sender, EventArgs e)
	{
		BindGrid();
	}
	</script>

<asp:Content runat="server" ContentPlaceHolderID="cs_contentplaceholder">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Using the Grid with MasterPages</b></span>
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		The Grid can be placed inside a <b>Content</b> page of a <b>MasterPage</b>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
</asp:Content>