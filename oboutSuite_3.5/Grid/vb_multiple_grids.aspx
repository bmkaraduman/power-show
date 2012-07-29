<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">	
	Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.Grid = New Grid()
    Dim grid3 As Obout.Grid.Grid = New Grid()
    
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
		grid1.AutoGenerateColumns = False
		grid1.AllowAddingRecords = False
		grid1.PageSize = 5		 
        grid1.AllowPageSizeSelection = False
        grid1.DataSourceID = "sds2"
        grid1.FolderStyle = "_"
		
        grid1.CssSettings.CSSFolderImages = "resources/custom-styles/black_glass"
		
		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "SupplierID"
		oCol1.ReadOnly = True
		oCol1.HeaderText = "ID"
        oCol1.Width = "100"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "CompanyName"
		oCol2.HeaderText = "COMPANY NAME"
		oCol2.Width = "250"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "Address"
		oCol3.HeaderText = "ADDRESS"
        oCol3.Width = "250"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "Country"
		oCol4.HeaderText = "COUNTRY"
        oCol4.Width = "150"
			
		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)							
		
		' creating the second grid
		grid2.ID = "grid2"
		grid2.CallbackMode = True
		grid2.Serialize = True		
		grid2.AutoGenerateColumns = False		
		grid2.AllowAddingRecords = False		
		grid2.PageSize = 5
        grid2.AllowPageSizeSelection = False
        grid2.DataSourceID = "sds1"
        grid2.FolderStyle = "_"
		
        grid2.CssSettings.CSSFolderImages = "resources/custom-styles/grand_gray"

		' creating the columns
        Dim oCol21 As Column = New Column()
        oCol21.DataField = "OrderID"
        oCol21.ReadOnly = True
        oCol21.HeaderText = "ORDER ID"
        oCol21.Width = "100"

        Dim oCol22 As Column = New Column()
        oCol22.DataField = "ShipName"
        oCol22.HeaderText = "NAME"
        oCol22.Width = "200"

        Dim oCol23 As Column = New Column()
        oCol23.DataField = "ShipCity"
        oCol23.HeaderText = "CITY"
        oCol23.Width = "150"

        Dim oCol24 As Column = New Column()
        oCol24.DataField = "ShipPostalCode"
        oCol24.HeaderText = "POSTAL CODE"
        oCol24.Width = "150"

        Dim oCol25 As Column = New Column()
        oCol25.DataField = "ShipCountry"
        oCol25.HeaderText = "COUNTRY"
        oCol25.Width = "150"
		
		' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol21)
        grid2.Columns.Add(oCol22)
        grid2.Columns.Add(oCol23)
        grid2.Columns.Add(oCol24)
        grid2.Columns.Add(oCol25)
        
        ' creating the second grid
        grid3.ID = "grid3"
        grid3.CallbackMode = True
        grid3.Serialize = True
        grid3.AutoGenerateColumns = False
        grid3.AllowAddingRecords = False
        grid3.PageSize = 5
        grid3.AllowPageSizeSelection = False
        grid3.DataSourceID = "sds1"
        grid3.FolderStyle = "_"

        grid3.CssSettings.CSSFolderImages = "resources/custom-styles/premiere_blue"

        'creating the columns
        Dim oCol31 As Column = New Column()
        oCol31.DataField = "OrderID"
        oCol31.ReadOnly = True
        oCol31.HeaderText = "ORDER ID"
        oCol31.Width = "100"

        Dim oCol32 As Column = New Column()
        oCol32.DataField = "ShipName"
        oCol32.HeaderText = "NAME"
        oCol32.Width = "200"

        Dim oCol33 As Column = New Column()
        oCol33.DataField = "ShipCity"
        oCol33.HeaderText = "CITY"
        oCol33.Width = "150"

        Dim oCol34 As Column = New Column()
        oCol34.DataField = "ShipPostalCode"
        oCol34.HeaderText = "POSTAL CODE"
        oCol34.Width = "150"

        Dim oCol35 As Column = New Column()
        oCol35.DataField = "ShipCountry"
        oCol35.HeaderText = "COUNTRY"
        oCol35.Width = "150"

        ' add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol31)
        grid3.Columns.Add(oCol32)
        grid3.Columns.Add(oCol33)
        grid3.Columns.Add(oCol34)
        grid3.Columns.Add(oCol35)

		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
		phGrid2.Controls.Add(grid2)
        phGrid3.Controls.Add(grid3)
        
	End Sub

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
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>
