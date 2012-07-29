<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">	
	Grid grid1 = new Grid();
	Grid grid2 = new Grid();
    Grid grid3 = new Grid();

	void Page_load(object sender, EventArgs e)
	{	
		grid1.ID = "grid1";
		grid1.CallbackMode = true;
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
		grid1.AllowAddingRecords = false;
		grid1.PageSize = 5;
        grid1.AllowPageSizeSelection = false;
        grid1.DataSourceID = "sds2";
        grid1.FolderStyle = "_";

        grid1.CssSettings.CSSFolderImages = "resources/custom-styles/black_glass";
		
		
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "SupplierID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ID";
		oCol1.Width = "100";

		Column oCol2 = new Column();
		oCol2.DataField = "CompanyName";
		oCol2.HeaderText = "COMPANY NAME";
		oCol2.Width = "250";

		Column oCol3 = new Column();
		oCol3.DataField = "Address";
		oCol3.HeaderText = "ADDRESS";
		oCol3.Width = "250";

		Column oCol4 = new Column();
		oCol4.DataField = "Country";
		oCol4.HeaderText = "COUNTRY";
		oCol4.Width = "150";
			
		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);

		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
																	
		
		// creating the second grid
		grid2.ID = "grid2";
		grid2.CallbackMode = true;
		grid2.Serialize = true;
		grid2.AutoGenerateColumns = false;
		grid2.AllowAddingRecords = false;
		grid2.PageSize = 5;
        grid2.AllowPageSizeSelection = false;
        grid2.DataSourceID = "sds1";
        grid2.FolderStyle = "_";
		
		
		grid2.CssSettings.CSSFolderImages = "resources/custom-styles/grand_gray";	

		// creating the columns
        Column oCol21 = new Column();
		oCol21.DataField = "OrderID";
		oCol21.ReadOnly = true;
		oCol21.HeaderText = "ORDER ID";
		oCol21.Width = "100";

        Column oCol22 = new Column();
		oCol22.DataField = "ShipName";
		oCol22.HeaderText = "NAME";
		oCol22.Width = "200";

        Column oCol23 = new Column();
		oCol23.DataField = "ShipCity";
		oCol23.HeaderText = "CITY";
		oCol23.Width = "150";

        Column oCol24 = new Column();
		oCol24.DataField = "ShipPostalCode";
		oCol24.HeaderText = "POSTAL CODE";
		oCol24.Width = "150";

		Column oCol25 = new Column();
		oCol25.DataField = "ShipCountry";
		oCol25.HeaderText = "COUNTRY";
		oCol25.Width = "150";		

		// add the columns to the Columns collection of the grid
		grid2.Columns.Add(oCol21);
		grid2.Columns.Add(oCol22);
		grid2.Columns.Add(oCol23);
		grid2.Columns.Add(oCol24);
		grid2.Columns.Add(oCol25);

        // creating the second grid
        grid3.ID = "grid3";
        grid3.CallbackMode = true;
        grid3.Serialize = true;
        grid3.AutoGenerateColumns = false;
        grid3.AllowAddingRecords = false;
        grid3.PageSize = 5;
        grid3.AllowPageSizeSelection = false;
        grid3.DataSourceID = "sds1";
        grid3.FolderStyle = "_";


        grid3.CssSettings.CSSFolderImages = "resources/custom-styles/premiere_blue";

        // creating the columns
        Column oCol31 = new Column();
        oCol31.DataField = "OrderID";
        oCol31.ReadOnly = true;
        oCol31.HeaderText = "ORDER ID";
        oCol31.Width = "100";

        Column oCol32 = new Column();
        oCol32.DataField = "ShipName";
        oCol32.HeaderText = "NAME";
        oCol32.Width = "200";

        Column oCol33 = new Column();
        oCol33.DataField = "ShipCity";
        oCol33.HeaderText = "CITY";
        oCol33.Width = "150";

        Column oCol34 = new Column();
        oCol34.DataField = "ShipPostalCode";
        oCol34.HeaderText = "POSTAL CODE";
        oCol34.Width = "150";

        Column oCol35 = new Column();
        oCol35.DataField = "ShipCountry";
        oCol35.HeaderText = "COUNTRY";
        oCol35.Width = "150";

        // add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol31);
        grid3.Columns.Add(oCol32);
        grid3.Columns.Add(oCol33);
        grid3.Columns.Add(oCol34);
        grid3.Columns.Add(oCol35);

       
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
		phGrid2.Controls.Add(grid2);
        phGrid3.Controls.Add(grid3);
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
        <link href="resources/custom-styles/black_glass/style.css" rel="Stylesheet" type="text/css" />	
		<link href="resources/custom-styles/grand_gray/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom-styles/premiere_blue/style.css" rel="Stylesheet" type="text/css" />
	</head>
	<body>
		<form id="Form1" runat="server">	

		<br />
		<span class="tdText"><b>Multiple ASP.NET Grids on the same page</b></span>
		<br /><br /><br />	
		<div class="master">
		    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
		</div>
		<br /><br /><br />
		<div class="ob_gDGCCT" style="background-color: Transparent; padding-left: 0px;">
		    <div class="ob_gDGCCT" style="background-color: Transparent; padding-left: 0px;">	    
		        <asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>
		    </div>		
	    </div>	
		<br /><br /><br />
		<div class="ob_gDGCCT" style="background-color: Transparent; padding-left: 0px;">
		    <asp:PlaceHolder ID="phGrid3" runat="server"></asp:PlaceHolder>	
		</div>
		<br /><br />
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>		
		 
		 <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT TOP 25 * FROM Suppliers ORDER BY SupplierID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>						
		<span class="tdText">
		You can have multiple Grid controls with different styles on the same page, by using the CssSettings property <br />or by using custom stylesheets.
        <br /><br />
        CssSettings should be used for minor customizations, custom stylesheets should be used when using many <br />controls with different styles on the same page (as in this example).

		<br /><br />
		See the <a href="http://www.obout.com/grid/grid_tutorials_styles_advanced.aspx">Advanced Styles Tutorial</a>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>
