<%@ Page Language="C#"%>
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
        grid1.AllowAddingRecords = false;

        
        // creating the Templates
        // creating the template for the Has Website column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateHasWebsite = new GridRuntimeTemplate();
        TemplateHasWebsite.ID = "TemplateHasWebsite";
        TemplateHasWebsite.Template = new Obout.Grid.RuntimeTemplate();
        TemplateHasWebsite.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateHasWebsiteTemplate);
        //------------------------------------------------------------------------
        
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateCombined = new GridRuntimeTemplate();
        TemplateCombined.ID = "TemplateCombined";
        TemplateCombined.Template = new Obout.Grid.RuntimeTemplate();
        TemplateCombined.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateTemplateCombined);
        //------------------------------------------------------------------------


        
        // adding the templates to the Templates collection
        grid1.Templates.Add(TemplateHasWebsite);
        grid1.Templates.Add(TemplateCombined);         
        
        
        // creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "SupplierID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ID";
		oCol1.Width = "60";

		Column oCol2 = new Column();
		oCol2.DataField = "CompanyName";
		oCol2.HeaderText = "COMPANY NAME";
		oCol2.Width = "250";
	
		Column oCol3 = new Column();
		oCol3.DataField = "Address";
		oCol3.HeaderText = "COMPANY ADDRESS";
		oCol3.Width = "500";
		oCol3.TemplateSettings.TemplateId = "TemplateCombined";

		Column oCol4 = new Column();
		oCol4.DataField = "City";
		oCol4.HeaderText = "CITY";
		oCol4.Width = "250";
		oCol4.Visible = false;
	
		Column oCol5 = new Column();
		oCol5.DataField = "Country";
		oCol5.HeaderText = "COUNTRY";
		oCol5.Width = "115";
		oCol5.Visible = false;		

		Column oCol6 = new Column();
        oCol6.DataField = "HomePage";
		oCol6.HeaderText = "HAS WEBSITE";		
		oCol6.Width = "125";
        oCol6.TemplateSettings.TemplateId = "TemplateHasWebsite";
		

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
	public void CreateTemplateCombined(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();
		e.Container.Controls.Add(oLiteral);
		oLiteral.DataBinding += new EventHandler(DataBindTemplateCombined);
	}
	protected void DataBindTemplateCombined(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = oContainer.DataItem["Address"] + ", " + oContainer.DataItem["City"] + ", " + oContainer.DataItem["Country"];
	}
	//------------------------------------------------------------------------
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
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
		<span class="tdText"><b>ASP.NET Grid - Using more columns in the same Template</b></span>
		<br /><br />			
		
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>Container.DataItem</b> object to access the values from more columns in the same Template.<br /><br />
		    In this example, the "COMPANY ADDRESS" column contains the values from the "Address", "City" and "Country" columns.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>