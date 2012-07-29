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
        
        grid1.AllowAddingRecords = false;
        grid1.AllowRecordSelection = false;
        grid1.ShowLoadingMessage = false;

        grid1.FolderStyle = "styles/grand_gray";

        // setting the event handlers
		grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
		grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
		grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
		grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);
				
		
		// creating the Templates
		
		// creating the template for the Country column (view mode)
		//------------------------------------------------------------------------
        GridRuntimeTemplate TemplateCountry = new GridRuntimeTemplate();
        TemplateCountry.ID = "tplCountry";
        TemplateCountry.Template = new Obout.Grid.RuntimeTemplate();
        TemplateCountry.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCountryTemplate);
		//------------------------------------------------------------------------

		// creating the template for the Sent column (view mode)
		//------------------------------------------------------------------------
        GridRuntimeTemplate TemplateSent = new GridRuntimeTemplate();
        TemplateSent.ID = "tplSent";
        TemplateSent.Template = new Obout.Grid.RuntimeTemplate();
        TemplateSent.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateSentTemplate);		
		//------------------------------------------------------------------------

		// adding the templates to the Templates collection
		grid1.Templates.Add(TemplateCountry);
		grid1.Templates.Add(TemplateSent);
		
																						
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
        oCol5.TemplateSettings.TemplateId = "tplCountry";

		Column oCol6 = new Column();
        oCol6.DataField = "Sent";
        oCol6.HeaderText = "SENT";
        oCol6.Width = "100";
        oCol6.TemplateSettings.TemplateId = "tplSent";

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

	// Create the methods that will load the data into the templates
	//------------------------------------------------------------------------
	public void CreateSentTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();	
		e.Container.Controls.Add(oLiteral);		
		oLiteral.DataBinding += new EventHandler(DataBindSentTemplate);
	}
    protected void DataBindSentTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"checkbox\" onclick=\"updateSent(this.checked, " + oContainer.PageRecordIndex.ToString() + ")\"" + (oContainer.Value == "True" ? " checked='checked'" : "") + "/>";
	}
	//------------------------------------------------------------------------


	//------------------------------------------------------------------------
    public void CreateCountryTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();
		e.Container.Controls.Add(oLiteral);
		oLiteral.DataBinding += new EventHandler(DataBindEditCountryTemplate);
	}
    protected void DataBindEditCountryTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<select class=\"ob_gEC\" onchange=\"updateCountry(this.value, " + oContainer.PageRecordIndex.ToString() + ")\">" +
			                "<option value=\"\"></option>" +
                            "<option value=\"Argentina\"" + (oContainer.Value == "Argentina" ? " selected='selected'" : "") + ">Argentina</option>" +
                            "<option value=\"Austria\"" + (oContainer.Value == "Austria" ? "selected='selected'" : "") + ">Austria</option>" +
                            "<option value=\"Brazil\"" + (oContainer.Value == "Brazil" ? "selected='selected'" : "") + ">Brazil</option>" +
                            "<option value=\"Denmark\"" + (oContainer.Value == "Denmark" ? "selected='selected'" : "") + ">Denmark</option>" +
                            "<option value=\"France\"" + (oContainer.Value == "France" ? "selected='selected'" : "") + ">France</option>" +
                            "<option value=\"Germany\"" + (oContainer.Value == "Germany" ? "selected='selected'" : "") + ">Germany</option>" +
                            "<option value=\"Ireland\"" + (oContainer.Value == "Ireland" ? "selected='selected'" : "") + ">Ireland</option>" +
                            "<option value=\"Italy\"" + (oContainer.Value == "Italy" ? "selected='selected'" : "") + ">Italy</option>" +
                            "<option value=\"Mexico\"" + (oContainer.Value == "Mexico" ? "selected='selected'" : "") + ">Mexico</option>" +
                            "<option value=\"Switzerland\"" + (oContainer.Value == "Switzerland" ? "selected='selected'" : "") + ">Switzerland</option>" +
                            "<option value=\"UK\"" + (oContainer.Value == "UK" ? "selected='selected'" : "") + ">UK</option>" +
                            "<option value=\"USA\"" + (oContainer.Value == "USA" ? "selected='selected'" : "") + ">USA</option>" +
                            "<option value=\"Venezuela\"" + (oContainer.Value == "Venezuela" ? "selected='selected'" : "") + ">Venezuela</option>" +
			            "</select>";
	}
	//------------------------------------------------------------------------


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

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, Sent=@Sent WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry, Sent) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry, @Sent)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];

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
		<script type="text/javascript">
		    function updateCountry(sCountry, iRowIndex) {
		        var oRecord = new Object();
		        
		        oRecord.OrderID = grid1.Rows[iRowIndex].Cells[0].Value;
		        oRecord.ShipName = grid1.Rows[iRowIndex].Cells[1].Value;
		        oRecord.ShipCity = grid1.Rows[iRowIndex].Cells[2].Value;
		        oRecord.ShipPostalCode = grid1.Rows[iRowIndex].Cells[3].Value;
		        oRecord.ShipCountry = sCountry;
		        oRecord.Sent = grid1.Rows[iRowIndex].Cells[5].Value;
		        
		        grid1.executeUpdate(oRecord);
		    }
		    
		    function updateSent(bSent, iRowIndex) {
		        var oRecord = new Object();
		        
		        oRecord.OrderID = grid1.Rows[iRowIndex].Cells[0].Value;
		        oRecord.ShipName = grid1.Rows[iRowIndex].Cells[1].Value;
		        oRecord.ShipCity = grid1.Rows[iRowIndex].Cells[2].Value;
		        oRecord.ShipPostalCode = grid1.Rows[iRowIndex].Cells[3].Value;
		        oRecord.ShipCountry = grid1.Rows[iRowIndex].Cells[4].Value;
		        oRecord.Sent = bSent;
		        
		        grid1.executeUpdate(oRecord);
		    }
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Automatic Updates</b></span>
		
		<br /><br />
		
		<span class="tdText">
		    Change the countries using the drop-down lists, check/uncheck the "SENT" checkboxes - <br />
		    the changes will be updated automatically in the database, without pressing any link/button.
		</span>
			
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		
		<span class="tdText">
		You can use the new <b>executeInsert</b>, <b>executeUpdate</b> and <b>executeDelete</b> client-side methods<br />
		to insert, update and delete records from the Grid without pressing any link/button.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>