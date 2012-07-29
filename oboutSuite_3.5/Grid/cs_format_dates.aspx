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


        // creating the template for the ORDER DATE column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate dateTemplate1 = new GridRuntimeTemplate();
        dateTemplate1.ID = "dateTemplate1";
        dateTemplate1.Template = new Obout.Grid.RuntimeTemplate();
        dateTemplate1.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateDateTemplate1);
        //------------------------------------------------------------------------

        // creating the template for the REQUIRED DATE column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate dateTemplate2 = new GridRuntimeTemplate();
        dateTemplate2.ID = "dateTemplate2";
        dateTemplate2.Template = new Obout.Grid.RuntimeTemplate();
        dateTemplate2.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateDateTemplate2);
        //------------------------------------------------------------------------

        // creating the template for the SHIPPED DATE column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate dateTemplate3 = new GridRuntimeTemplate();
        dateTemplate3.ID = "dateTemplate3";
        dateTemplate3.Template = new Obout.Grid.RuntimeTemplate();
        dateTemplate3.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateDateTemplate3);
        //------------------------------------------------------------------------

        // adding the templates to the Templates collection
        grid1.Templates.Add(dateTemplate1);
        grid1.Templates.Add(dateTemplate2);
        grid1.Templates.Add(dateTemplate3);
        
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

        Column oCol2 = new Column();
        oCol2.DataField = "OrderDate";
        oCol2.HeaderText = "ORDER DATE";
        oCol2.Width = "250";
        oCol2.TemplateSettings.TemplateId = "dateTemplate1";        

        Column oCol3 = new Column();
        oCol3.DataField = "RequiredDate";
        oCol3.HeaderText = "REQUIRED DATE";
        oCol3.Width = "150";
        oCol3.TemplateSettings.TemplateId = "dateTemplate2";

        Column oCol4 = new Column();
        oCol4.DataField = "ShippedDate";
        oCol4.HeaderText = "SHIPPED DATE";
        oCol4.Width = "150";
        oCol4.TemplateSettings.TemplateId = "dateTemplate3";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}

    
    // Create the methods that will load the data into the templates
    //------------------------------------------------------------------------
    public void CreateDateTemplate1(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindDateTemplate1);
    }
    protected void DataBindDateTemplate1(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = (oContainer.Value != String.Empty && oContainer.Value != "&#160;" ? Convert.ToDateTime(oContainer.Value.Replace("&#160;", " ")).ToString("MM/dd/yy") : "");
    }
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    public void CreateDateTemplate2(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindDateTemplate2);
    }
    protected void DataBindDateTemplate2(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = (oContainer.Value != String.Empty && oContainer.Value != "&#160;" ? Convert.ToDateTime(oContainer.Value.Replace("&#160;", " ")).ToString("MM/dd/yyyy") : "");
    }
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    public void CreateDateTemplate3(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindDateTemplate3);
    }
    protected void DataBindDateTemplate3(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = (oContainer.Value != String.Empty && oContainer.Value != "&#160;" ? Convert.ToDateTime(oContainer.Value.Replace("&#160;", " ")).ToString("MMMM dd, yyyy") : "");
    }
    //------------------------------------------------------------------------
    
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders", myConn);
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
		<span class="tdText"><b>ASP.NET Grid - Formatting Dates</b></span>
		<br /><br />			
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

		<br /><br /><br />
		
		<span class="tdText">
		    Templates can be used also to format dates.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>