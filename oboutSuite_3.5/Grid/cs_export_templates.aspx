<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	Grid grid1 = new Grid();
	
	void Page_load(object sender, EventArgs e)		
	{
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
        grid1.DataSourceID = "sds1";
        grid1.PageSize = 10;
        grid1.AllowAddingRecords = false;

        GridRuntimeTemplate TemplateIDPrice = new GridRuntimeTemplate();
        TemplateIDPrice.ID = "PriceTemplate";
        TemplateIDPrice.Template = new Obout.Grid.RuntimeTemplate();
        TemplateIDPrice.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreatePriceTemplate);
        TemplateIDPrice.UseQuotes = true;

        grid1.Templates.Add(TemplateIDPrice);

        GridRuntimeTemplate TemplateCategory = new GridRuntimeTemplate();
        TemplateCategory.ID = "CategoryTemplate";
        TemplateCategory.Template = new Obout.Grid.RuntimeTemplate();
        TemplateCategory.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCategoryTemplate);
        TemplateCategory.UseQuotes = true;

        grid1.Templates.Add(TemplateCategory);

        grid1.ExportingSettings.ExportTemplates = true;
        
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "ProductID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "PRODUCT ID";
        oCol1.Width = "150";
		
		Column oCol2 = new Column();
		oCol2.DataField = "CategoryID";
        oCol2.Visible = false;
        oCol2.ReadOnly = true;
        oCol2.HeaderText = "CATEGORY ID";
        oCol2.Width = "150";
		
		Column oCol3 = new Column();
		oCol3.DataField = "ProductName";
        oCol3.HeaderText = "PRODUCT NAME";
        oCol3.Width = "150";
        oCol3.TemplateSettings.TemplateId = "CategoryTemplate";

        Column oCol4 = new Column();
        oCol4.DataField = "UnitPrice";
        oCol4.HeaderText = "PRICE";
        oCol4.Width = "150";
        oCol4.TemplateSettings.TemplateId = "PriceTemplate";
		
		Column oCol5 = new Column();
		 oCol5.DataField = "UnitsInStock";
        oCol5.HeaderText = "UNITS IN STOCK";
        oCol5.Width = "150";
											
		Column oCol6 = new Column();
       oCol6.DataField = "UnitsOnOrder";
        oCol6.HeaderText = "UNITS ON ORDER";
        oCol6.Width = "150";

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		grid1.Columns.Add(oCol6);


		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
	}	
     public void CreatePriceTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(oPlaceHolder);
        oPlaceHolder.DataBinding += new EventHandler(DataBindCreatePriceTemplate);
    }


    protected void DataBindCreatePriceTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPlaceHolder = sender as PlaceHolder;
        Obout.Grid.TemplateContainer container = oPlaceHolder.NamingContainer as Obout.Grid.TemplateContainer;

        Literal priceTemplate = new Literal();
        priceTemplate.Text = "<b>$" + container.Value + "</b>";
        
        oPlaceHolder.Controls.Add(priceTemplate);
    }
     public void CreateCategoryTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(oPlaceHolder);
        oPlaceHolder.DataBinding += new EventHandler(DataBindCreateCategoryTemplate);
    }


    protected void DataBindCreateCategoryTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPlaceHolder = sender as PlaceHolder;
        Obout.Grid.TemplateContainer container = oPlaceHolder.NamingContainer as Obout.Grid.TemplateContainer;


        Literal priceTemplate = new Literal();
        priceTemplate.Text = "<u><i>" + container.Value + "</i></u>";
        
        oPlaceHolder.Controls.Add(priceTemplate);
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
		    function exportToExcel() {
		        grid1.exportToExcel();
		    }

		    function exportToWord() {
		        grid1.exportToWord();
		    }
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />

		<span class="tdText"><b>ASP.NET Grid - Export Templates</b></span>
		
		<br /><br />

        <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
        <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

        <br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		
		<span class="tdText">
		    Using the exporting feature of the Grid you can export the data formatted using templates.<br /><br />
            By default, when exporting a grid, the data formatted using templates is not included in the generated excel / word file.<br />
            You need to set <b>ExportingSettings.ExportTemplates</b> to <span class="option2">true</span> in order to export the templates.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>