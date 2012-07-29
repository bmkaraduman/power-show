<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.DataSourceID = "sds1"
        grid1.PageSize = 10
        grid1.AllowAddingRecords = False
        
        Dim TemplateIDPrice As GridRuntimeTemplate = New GridRuntimeTemplate()
        TemplateIDPrice.ID = "PriceTemplate"
        TemplateIDPrice.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateIDPrice.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreatePriceTemplate
        TemplateIDPrice.UseQuotes = True

        grid1.Templates.Add(TemplateIDPrice)
        
        Dim TemplateCategory As GridRuntimeTemplate = New GridRuntimeTemplate()
        TemplateCategory.ID = "CategoryTemplate"
        TemplateCategory.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateCategory.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCategoryTemplate
        TemplateCategory.UseQuotes = True

        grid1.Templates.Add(TemplateCategory)
		
        grid1.ExportingSettings.ExportTemplates = True
        
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "ProductID"
        oCol1.Visible = False
        oCol1.ReadOnly = True
        oCol1.HeaderText = "PRODUCT ID"
        oCol1.Width = "150"
		
        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CategoryID"
        oCol2.Visible = False
        oCol2.ReadOnly = True
        oCol2.HeaderText = "CATEGORY ID"
        oCol2.Width = "150"
		
        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ProductName"
        oCol3.HeaderText = "PRODUCT NAME"
        oCol3.Width = "150"
        oCol3.TemplateSettings.TemplateId = "CategoryTemplate"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "UnitPrice"
        oCol4.HeaderText = "PRICE"
        oCol4.Width = "150"
        oCol4.TemplateSettings.TemplateId = "PriceTemplate"
 
		
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "UnitsInStock"
        oCol5.HeaderText = "UNITS IN STOCK"
        oCol5.Width = "150"
											
        Dim oCol6 As Column = New Column()
        oCol6.DataField = "UnitsOnOrder"
        oCol6.HeaderText = "UNITS ON ORDER"
        oCol6.Width = "150"

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        		
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
			
    End Sub
    Sub CreatePriceTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oPlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPlaceHolder)
        AddHandler CType(oPlaceHolder, PlaceHolder).DataBinding, AddressOf DataBindCreatePriceTemplate
        
    End Sub
    
    Sub CreateCategoryTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oPlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPlaceHolder)
        AddHandler CType(oPlaceHolder, PlaceHolder).DataBinding, AddressOf DataBindCreateCategoryTemplate

    End Sub
    Sub DataBindCreatePriceTemplate(ByVal sender As Object, ByVal e As EventArgs)

        Dim oPlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
        Dim container As Obout.Grid.TemplateContainer = CType(oPlaceHolder.NamingContainer, Obout.Grid.TemplateContainer)

        Dim priceTemplate As Literal = New Literal()
        priceTemplate.Text = "<b>$" + container.Value + "</b>"

        oPlaceHolder.Controls.Add(priceTemplate)
    End Sub
    
    Sub DataBindCreateCategoryTemplate(ByVal sender As Object, ByVal e As EventArgs)

        Dim oPlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
        Dim container As Obout.Grid.TemplateContainer = CType(oPlaceHolder.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim categoryTemplate As Literal = New Literal()
        categoryTemplate.Text = "<u><i>" + container.Value + "</i></u>"

        oPlaceHolder.Controls.Add(categoryTemplate)
    End Sub
    
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
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>