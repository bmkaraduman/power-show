<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	Grid grid1 = new Grid();
    OboutInc.Calendar2.Calendar cal1 = new OboutInc.Calendar2.Calendar();
    OboutTextBox oTextBox = new OboutTextBox();
    
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
				
		
		// creating the Templates
		//------------------------------------------------------------------------
        GridRuntimeTemplate tplDatePicker = new GridRuntimeTemplate();
        tplDatePicker.ID = "tplDatePicker";
        tplDatePicker.Template = new Obout.Grid.RuntimeTemplate();
        tplDatePicker.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateDatePickerTemplate);
        tplDatePicker.ControlID = "txtOrderDate";
        tplDatePicker.ControlPropertyName = "value";
        tplDatePicker.UseQuotes = true;
		//------------------------------------------------------------------------
						
		
		// adding the templates to the Templates collection
        grid1.Templates.Add(tplDatePicker);
		
																						
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
        oCol3.Width = "125";

		Column oCol4 = new Column();
        oCol4.DataField = "ShipCountry";
        oCol4.HeaderText = "COUNTRY";
        oCol4.Width = "150";
	
		Column oCol5 = new Column();
        oCol5.DataField = "ShipPostalCode";
        oCol5.HeaderText = "POSTAL CODE";
        oCol5.Width = "150";

        Column oCol6 = new Column();
        oCol6.DataField = "OrderDateValue";
        oCol6.HeaderText = "ORDER DATE";
        oCol6.Width = "175";
        oCol6.TemplateSettings.EditTemplateId = "tplDatePicker";

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
        phGrid1.Controls.Add(cal1);
		
		if (!Page.IsPostBack)
		{
			BindGrid();			
		}			
	}

    protected override void OnPreRender(EventArgs e)
    {
        cal1.TextBoxId = oTextBox.ClientID;

        base.OnPreRender(e);
    }

	// Create the methods that will load the data into the templates		

	//------------------------------------------------------------------------
    public void CreateDatePickerTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		PlaceHolder oPlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(oPlaceHolder);
        oPlaceHolder.DataBinding += new EventHandler(DataBindDatePickerTemplate);
	}
    protected void DataBindDatePickerTemplate(Object sender, EventArgs e)
	{
        PlaceHolder oPlaceHolder = sender as PlaceHolder;
        Obout.Grid.TemplateContainer oContainer = oPlaceHolder.NamingContainer as Obout.Grid.TemplateContainer;

        Table oTable = new Table();
        oTable.CellPadding = 0;
        oTable.CellSpacing = 0;
        oTable.Attributes["width"] = "100%";

        TableRow oRow = new TableRow();

        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();
        oCell2.Attributes["width"] = "30";

        oTextBox = new OboutTextBox();
        oTextBox.ID = "txtOrderDate";
        oTextBox.FolderStyle = "styles/premiere_blue/interface/OboutTextBox";
        oTextBox.Width = Unit.Percentage(100);
        
        oCell1.Controls.Add(oTextBox);


        cal1.ID = "cal1";
        cal1.StyleFolder = "../calendar/styles/default";
        cal1.DatePickerMode = true;
        cal1.ShowYearSelector = false;
        cal1.DatePickerImagePath = "../calendar/styles/icon2.gif";
        
        oCell2.Controls.Add(cal1);
        
        oRow.Cells.Add(oCell1);        
        oRow.Cells.Add(oCell2);

        oTable.Rows.Add(oRow);       

        oPlaceHolder.Controls.Add(oTable);

        
	}
	//------------------------------------------------------------------------


    void BindGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 OrderID, ShipName, ShipCity, ShipPostalCode, ShipCountry, OrderDate, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateValue FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry, OrderDate=@OrderDate WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderDate", OleDbType.VarChar).Value = e.Record["OrderDateValue"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry, OrderDate) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry, @OrderDate)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderDate", OleDbType.VarChar).Value = e.Record["OrderDateValue"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void RebindGrid(object sender, EventArgs e)
    {
        BindGrid();
    }
	</script>		

<html>
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
				background-color___:#f6f9fc;
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
		<span class="tdText"><b>ASP.NET Grid - Using the DatePicker inside the Grid</b></span>
		<br /><br />			
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		
		<span class="tdText">
		You can easily add a DatePicker control into the Grid using Templates for edit.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>