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
        grid1.EnableTypeValidation = true;
		
		grid1.FolderStyle = "styles/grand_gray";

		// setting the event handlers
		grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
		grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
		grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
		grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);
		
		// creating the columns
		Column oCol1 = new Column();
        oCol1.DataField = "ProductID";
		oCol1.ReadOnly = true;
        oCol1.HeaderText = "PRODUCT ID";
		oCol1.Width = "125";
		
		Column oCol2 = new Column();
        oCol2.DataField = "ProductName";
        oCol2.HeaderText = "PRODUCT NAME";
		oCol2.Width = "200";
		
		Column oCol3 = new Column();
        oCol3.DataField = "UnitsInStock";
        oCol3.HeaderText = "UNITS IN STOCK";
		oCol3.Width = "150";
		
		Column oCol4 = new Column();
        oCol4.DataField = "UnitsOnOrder";
        oCol4.HeaderText = "UNITS ON ORDER";
		oCol4.Width = "150";
											
		Column oCol5 = new Column();
        oCol5.DataField = "ReorderLevel";
        oCol5.HeaderText = "REORDER LEVEL";
		oCol5.Width = "150";

        Column oCol6 = new Column();
        oCol6.DataField = "Discontinued";
        oCol6.HeaderText = "DISCONTINUED";
        oCol6.Width = "150";

		Column oCol7 = new Column();
		oCol7.HeaderText = "EDIT";
		oCol7.Width = "125";
        oCol7.AllowEdit = true;
        oCol7.AllowDelete = true;

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
		
		if (!Page.IsPostBack)
		{
			BindGrid();			
		}		
	}	

	void BindGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Products ORDER BY ProductID DESC", myConn);
		myConn.Open();

        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;

        // This line is needed in order to use the MaxLength and AllowNulls properties
        da.FillSchema(ds, SchemaType.Mapped, "Products");
        da.Fill(ds, "Products");

        grid1.DataSource = ds;
        grid1.DataBind();

		myConn.Close();	
	}

    void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Products WHERE ProductID = @ProductID", myConn);

        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record["ProductID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();
        
        OleDbCommand myComm = new OleDbCommand("UPDATE Products SET ProductName = @ProductName, UnitsInStock = @UnitsInStock, UnitsOnOrder=@UnitsOnOrder, ReorderLevel=@ReorderLevel, Discontinued=@Discontinued WHERE ProductID = @ProductID", myConn);

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record["ProductName"];
        myComm.Parameters.Add("@UnitsInStock", OleDbType.VarChar).Value = e.Record["UnitsInStock"];
        myComm.Parameters.Add("@UnitsOnOrder", OleDbType.VarChar).Value = e.Record["UnitsOnOrder"];
        myComm.Parameters.Add("@ReorderLevel", OleDbType.VarChar).Value = e.Record["ReorderLevel"];
        myComm.Parameters.Add("@Discontinued", OleDbType.Boolean).Value = e.Record["Discontinued"];
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record["ProductID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();        

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Products (ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES(@ProductName, @UnitsInStock, @UnitsOnOrder, @ReorderLevel, @Discontinued)", myConn);

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record["ProductName"];
        myComm.Parameters.Add("@UnitsInStock", OleDbType.VarChar).Value = e.Record["UnitsInStock"];
        myComm.Parameters.Add("@UnitsOnOrder", OleDbType.VarChar).Value = e.Record["UnitsOnOrder"];
        myComm.Parameters.Add("@ReorderLevel", OleDbType.VarChar).Value = e.Record["ReorderLevel"];
        myComm.Parameters.Add("@Discontinued", OleDbType.Boolean).Value = e.Record["Discontinued"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
	void RebindGrid(object sender, EventArgs e)
	{
		BindGrid();
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
		<span class="tdText"><b>ASP.NET Grid - Type Validation</b></span>
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		    To enable the Type Validation feature, just set <b>EnableTypeValidation</b>=<span class="option2">true</span><br />
		    When you Add/Edit records, the values you enter will be validated (they need to have the same type like in the database).<br />
		    Also, the values will be checked against the MaxLength and AllowNulls properties of the columns in the database.
		    <br /><br />
		    In this example, the "UNITS IN STOCK", "UNITS ON ORDER", "REORDER LEVEL" columns must be integers.<br />
		    The "DISCONTINUED" column can have only the true/false values.<br />
		    The "PRODUCT NAME" column has a maximum length of 40 characters, if this limit is exceeded, a message will pop-up.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>