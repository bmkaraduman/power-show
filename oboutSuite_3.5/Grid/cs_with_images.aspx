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
		grid1.PageSize = 5;
		
		grid1.FolderStyle = "styles/grand_gray";
		
		
		// creating the template for the Image column (view mode)
		//------------------------------------------------------------------------
		GridRuntimeTemplate ImageTemplate = new GridRuntimeTemplate();
		ImageTemplate.ID = "ImageTemplate";
		ImageTemplate.Template = new Obout.Grid.RuntimeTemplate();
		ImageTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateImageTemplate);		
		//------------------------------------------------------------------------		

		// adding the template to the Templates collection
		grid1.Templates.Add(ImageTemplate);
		
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "ProductID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "PRODUCT ID";
		oCol1.Width = "125";

		Column oCol2 = new Column();
		oCol2.DataField = "ProductName";
		oCol2.HeaderText = "PRODUCT NAME";
		oCol2.Width = "225";
	
		Column oCol3 = new Column();
		oCol3.DataField = "UnitPrice";
		oCol3.HeaderText = "UNIT PRICE";
		oCol3.Width = "150";		

		Column oCol4 = new Column();
		oCol4.DataField = "Image";
		oCol4.HeaderText = "IMAGE";
		oCol4.Width = "125";
		oCol4.Align = "center";
        oCol4.TemplateSettings.TemplateId = "ImageTemplate";

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);		

		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
		
		if (!Page.IsPostBack)
		{
			BindGrid();			
		}		
	}

	// Create the methods that will load the data into the templates
	//------------------------------------------------------------------------
	public void CreateImageTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{		
		Literal oLiteral = new Literal();
		e.Container.Controls.Add(oLiteral);
		oLiteral.DataBinding += new EventHandler(DataBindImageTemplate);
	}
	protected void DataBindImageTemplate(Object sender, EventArgs e)
	{		
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

		oLiteral.Text = "<img src=\"resources/images/products/" + oContainer.Value + "\" alt=\"\" width=\"50\" height=\"50\" />";
		
	}
	//------------------------------------------------------------------------
	
	void BindGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 27 * FROM Products", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Products");*/
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
		<form id="Form1" runat="server">			
		<br />
		<span class="tdText"><b>ASP.NET Grid with Images</b></span>
		<br /><br />	
							
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />

		<span class="tdText">
			The data from the database can be easily converted to images using Templates.
			<br /><br />
			See the <a href="http://www.obout.com/grid/grid_tutorials_templates.aspx">Templates tutorial</a>.
		</span>

		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>
