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
        
        grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowAddingRecords = false;


        // creating the template for the USD column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate usdTemplate = new GridRuntimeTemplate();
        usdTemplate.ID = "usdTemplate";
        usdTemplate.Template = new Obout.Grid.RuntimeTemplate();
        usdTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateUSDTemplate);
        //------------------------------------------------------------------------

        // creating the template for the JPY column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate jpyTemplate = new GridRuntimeTemplate();
        jpyTemplate.ID = "jpyTemplate";
        jpyTemplate.Template = new Obout.Grid.RuntimeTemplate();
        jpyTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateJPYTemplate);
        //------------------------------------------------------------------------

        // creating the template for the GBP column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate gbpTemplate = new GridRuntimeTemplate();
        gbpTemplate.ID = "gbpTemplate";
        gbpTemplate.Template = new Obout.Grid.RuntimeTemplate();
        gbpTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateGBPTemplate);
        //------------------------------------------------------------------------

        // adding the templates to the Templates collection
        grid1.Templates.Add(usdTemplate);
        grid1.Templates.Add(jpyTemplate);
        grid1.Templates.Add(gbpTemplate);
        
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

        Column oCol2 = new Column();
        oCol2.DataField = "Freight";
        oCol2.HeaderText = "Freight in USD";
        oCol2.Width = "250";
        oCol2.TemplateSettings.TemplateId = "usdTemplate";        

        Column oCol3 = new Column();
        oCol3.DataField = "";
        oCol3.HeaderText = "Freight in JPY";
        oCol3.Width = "150";
        oCol3.TemplateSettings.TemplateId = "jpyTemplate";

        Column oCol4 = new Column();
        oCol4.DataField = "";
        oCol4.HeaderText = "Freight in GBP";
        oCol4.Width = "150";
        oCol4.TemplateSettings.TemplateId = "gbpTemplate";

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
    public void CreateUSDTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindUSDTemplate);
    }
    protected void DataBindUSDTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = (oContainer.Value != String.Empty && oContainer.Value != "&#160;" ? String.Format("{0:C}", Convert.ToDecimal( oContainer.Value )) : "");
    }
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    public void CreateJPYTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindJPYTemplate);
    }
    protected void DataBindJPYTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

		String value = ( Convert.ToDouble ( oContainer.DataItem["Freight"]  ) * 118.19  ) + "" ;
        oLiteral.Text = ( value != String.Empty && value != "&#160;" ? Convert.ToDecimal( value ).ToString("¥#,##0.00;(¥#,##0.00);Zero") : "");
    }
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    public void CreateGBPTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindGBPTemplate);
    }
    protected void DataBindGBPTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

		String value = ( Convert.ToDouble ( oContainer.DataItem["Freight"] ) / 1.9565 ) + "";
        oLiteral.Text = ( value != String.Empty && value != "&#160;" ? Convert.ToDecimal( value ).ToString("£#,##0.00;(£#,##0.00);Zero") : "");
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
		<span class="tdText"><b>ASP.NET Grid - Formatting Currencies</b></span>
		<br /><br />			
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

		<br /><br /><br />
		
		<span class="tdText">
		    Templates can be used also to format currencies.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>