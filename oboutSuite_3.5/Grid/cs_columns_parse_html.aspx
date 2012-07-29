<%@ Page Language="C#" %>
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
        
        grid1.FolderStyle = "styles/premiere_blue";

        // setting the event handlers
        grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
        grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
        grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
        grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);
		
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "ShipperID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "SHIPPER ID";
        oCol1.Width = "100";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "200";

        Column oCol3 = new Column();
        oCol3.DataField = "Phone";
        oCol3.HeaderText = "PHONE";
        oCol3.Width = "150";

        Column oCol4 = new Column();
        oCol4.DataField = "Website";
        oCol4.HeaderText = "WEBSITE";
        oCol4.Width = "350";
        oCol4.ParseHTML = true;

        Column oCol5 = new Column();
        oCol5.DataField = "HasEmail";
        oCol5.HeaderText = "HAS EMAIL";
        oCol5.Width = "350";
        oCol5.ParseHTML = true;

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
			CreateGrid();			
		}
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Shippers ORDER BY ShipperID DESC", myConn);
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

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Shippers WHERE ShipperID = @ShipperID", myConn);

        myComm.Parameters.Add("@ShipperID", OleDbType.Integer).Value = e.Record["ShipperID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Shippers SET CompanyName = @CompanyName, Phone = @Phone, Website=@Website, HasEmail=@HasEmail WHERE ShipperID = @ShipperID", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Phone", OleDbType.VarChar).Value = e.Record["Phone"];
        myComm.Parameters.Add("@Website", OleDbType.VarChar).Value = e.Record["Website"];
        myComm.Parameters.Add("@HasEmail", OleDbType.VarChar).Value = e.Record["HasEmail"];
        myComm.Parameters.Add("@ShipperID", OleDbType.Integer).Value = e.Record["ShipperID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Shippers (CompanyName, Phone, Website, HasEmail) VALUES(@CompanyName, @Phone, @Website, @HasEmail)", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Phone", OleDbType.VarChar).Value = e.Record["Phone"];
        myComm.Parameters.Add("@Website", OleDbType.VarChar).Value = e.Record["Website"];
        myComm.Parameters.Add("@HasEmail", OleDbType.VarChar).Value = e.Record["HasEmail"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
	}
	</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - ParseHTML property for the Columns</b></span>
		<br /><br />
				
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>ParseHTML</b> property of the Column class if you have HTML content in your database and<br />
		    you want to show the HTML elements in the Grid (not the HTML text).
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>