<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
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
		
        // setting the event handlers
		grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
		grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
		grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
		grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);
				
		
		// creating the Templates
		
		// creating the template for the Company name column (view mode)
		//------------------------------------------------------------------------
		GridRuntimeTemplate TemplateCompanyName = new GridRuntimeTemplate();
		TemplateCompanyName.ID = "TemplateCompanyName";				 
		TemplateCompanyName.Template = new Obout.Grid.RuntimeTemplate();
		TemplateCompanyName.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCompanyTemplate);
		//------------------------------------------------------------------------

		// creating the template for the Address column (edit mode)
		//------------------------------------------------------------------------
		GridRuntimeTemplate TemplateEditAddress = new GridRuntimeTemplate();
		TemplateEditAddress.ID = "TemplateEditAddress";
		TemplateEditAddress.Template = new Obout.Grid.RuntimeTemplate();
		TemplateEditAddress.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditAddressTemplate);
		TemplateEditAddress.ControlID = "txtAddress";
		TemplateEditAddress.ControlPropertyName = "value";
		TemplateEditAddress.UseQuotes = true;
		//------------------------------------------------------------------------

		// creating the template for the Has Website column (view mode)
		//------------------------------------------------------------------------
		GridRuntimeTemplate TemplateHasWebsite = new GridRuntimeTemplate();
		TemplateHasWebsite.ID = "TemplateHasWebsite";
		TemplateHasWebsite.Template = new Obout.Grid.RuntimeTemplate();
		TemplateHasWebsite.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateHasWebsiteTemplate);		
		//------------------------------------------------------------------------

		// creating the template for the Has Website column (edit mode)
		//------------------------------------------------------------------------
		GridRuntimeTemplate TemplateEditHasWebsite = new GridRuntimeTemplate();
		TemplateEditHasWebsite.ID = "TemplateEditHasWebsite";
		TemplateEditHasWebsite.Template = new Obout.Grid.RuntimeTemplate();
		TemplateEditHasWebsite.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditHasWebsiteTemplate);
		TemplateEditHasWebsite.ControlID = "chkHasWebsite";
		TemplateEditHasWebsite.ControlPropertyName = "checked";
		TemplateEditHasWebsite.UseQuotes = false;
		//------------------------------------------------------------------------

		// creating the template for the Country column (edit mode)
		//------------------------------------------------------------------------
		GridRuntimeTemplate TemplateEditCountry = new GridRuntimeTemplate();
		TemplateEditCountry.ID = "TemplateEditCountry";
		TemplateEditCountry.Template = new Obout.Grid.RuntimeTemplate();
		TemplateEditCountry.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditCountryTemplate);
		TemplateEditCountry.ControlID = "ddlCountries";
		TemplateEditCountry.ControlPropertyName = "value";
		TemplateEditCountry.UseQuotes = true;
		//------------------------------------------------------------------------
						
		
		// adding the templates to the Templates collection
		grid1.Templates.Add(TemplateCompanyName);
		grid1.Templates.Add(TemplateEditAddress);
		grid1.Templates.Add(TemplateHasWebsite);
		grid1.Templates.Add(TemplateEditHasWebsite);
		grid1.Templates.Add(TemplateEditCountry);
		
																						
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "SupplierID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ID";
		oCol1.Width = "45";

		Column oCol2 = new Column();
		oCol2.DataField = "CompanyName";
		oCol2.HeaderText = "Company Name";
		oCol2.Width = "250";
		oCol2.TemplateSettings.TemplateId = "TemplateCompanyName";
        oCol2.TemplateSettings.HeaderTemplateId = "TemplateCompanyName";
	
		Column oCol3 = new Column();
		oCol3.DataField = "Address";
		oCol3.HeaderText = "Address";
		oCol3.Width = "175";
        oCol3.TemplateSettings.EditTemplateId = "TemplateEditAddress";

		Column oCol4 = new Column();
		oCol4.DataField = "Country";
		oCol4.HeaderText = "Country";
		oCol4.Width = "115";
        oCol4.TemplateSettings.EditTemplateId = "TemplateEditCountry";
	
		Column oCol5 = new Column();
		oCol5.DataField = "HomePage";
		oCol5.HeaderText = "Has WebSite";
		oCol5.Width = "125";
        oCol5.TemplateSettings.TemplateId = "TemplateHasWebsite";
        oCol5.TemplateSettings.EditTemplateId = "TemplateEditHasWebsite";

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

	// Create the methods that will load the data into the templates
	//------------------------------------------------------------------------
	public void CreateCompanyTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();	
		e.Container.Controls.Add(oLiteral);		
		oLiteral.DataBinding += new EventHandler(DataBindCompanyTemplate);
	}
	protected void DataBindCompanyTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<b><u><i>" + oContainer.Value.ToString() + "</i></u></b>";
	}
	//------------------------------------------------------------------------

	//------------------------------------------------------------------------
	public void CreateEditAddressTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();		
		e.Container.Controls.Add(oLiteral);
		oLiteral.DataBinding += new EventHandler(DataBindEditAddressTemplate);
	}
	protected void DataBindEditAddressTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

		oLiteral.Text = "<textarea id=\"txtAddress\" rows=\"3\" class=\"ob_gEC\" style=\"overflow: auto;\"></textarea>";
	}
	//------------------------------------------------------------------------

	//------------------------------------------------------------------------
	public void CreateHasWebsiteTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();
		e.Container.Controls.Add(oLiteral);
		oLiteral.DataBinding += new EventHandler(DataBindHasWebsiteTemplate);
	}
	protected void DataBindHasWebsiteTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

		oLiteral.Text = (oContainer.Value == "true" ? "yes" : "no");
	}
	//------------------------------------------------------------------------

	//------------------------------------------------------------------------
	public void CreateEditHasWebsiteTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();
		e.Container.Controls.Add(oLiteral);
		oLiteral.DataBinding += new EventHandler(DataBindEditHasWebsiteTemplate);
	}
	protected void DataBindEditHasWebsiteTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

		oLiteral.Text = "<input type=\"checkbox\" id=\"chkHasWebsite\"/>";
	}
	//------------------------------------------------------------------------

	//------------------------------------------------------------------------
	public void CreateEditCountryTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
        PlaceHolder ph1 = new PlaceHolder();
        e.Container.Controls.Add(ph1);
        ph1.DataBinding += new EventHandler(DataBindEditCountryTemplate);
	}
	protected void DataBindEditCountryTemplate(Object sender, EventArgs e)
	{
        PlaceHolder ph1 = sender as PlaceHolder;
        Obout.Grid.TemplateContainer oContainer = ph1.NamingContainer as Obout.Grid.TemplateContainer;
        
        OboutDropDownList ddlCountries = new OboutDropDownList();
        ddlCountries.ID = "ddlCountries";
        ddlCountries.Width = Unit.Percentage(100);
        ddlCountries.Height = Unit.Pixel(200);
        ddlCountries.MenuWidth = Unit.Pixel(175);
        
        ddlCountries.DataSourceID = "sds1";
        ddlCountries.DataTextField = "Country";
        ddlCountries.DataValueField = "Country";

        ph1.Controls.Add(ddlCountries);
	}
	//------------------------------------------------------------------------


	void BindGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
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

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn);

        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record["SupplierID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country, HomePage=@HomePage WHERE SupplierID = @SupplierID", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@HomePage", OleDbType.VarChar).Value = e.Record["HomePage"];
        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record["SupplierID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country, HomePage) VALUES(@CompanyName, @Address, @Country, @HomePage)", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@HomePage", OleDbType.VarChar).Value = e.Record["HomePage"];

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
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Templates</b></span>
		<br /><br />			
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT Country FROM Suppliers ORDER BY Country ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

		<br /><br /><br />
		
		<span class="tdText">
		The displayed data can be formatted using templates. Grid also supports templates<br />
		for edit mode. These templates can contain any HTML/ASP.NET control.<br /><br />
		See the <a href="http://www.obout.com/grid/grid_tutorials_templates.aspx">Templates tutorial</a>
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>