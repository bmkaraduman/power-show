<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)			
		grid1.ID = "grid1"
		grid1.CallbackMode = true
		grid1.Serialize = true
		grid1.AutoGenerateColumns = false
		grid1.AllowAddingRecords = false
		grid1.PageSize = 5
		
		grid1.FolderStyle = "styles/grand_gray"
		
		
		' creating the template for the Image column (view mode)
		'------------------------------------------------------------------------
		Dim ImageTemplate As GridRuntimeTemplate 
		ImageTemplate = new GridRuntimeTemplate()
		ImageTemplate.ID = "ImageTemplate"
		ImageTemplate.Template = new Obout.Grid.RuntimeTemplate()
		AddHandler CType(ImageTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateImageTemplate
		'------------------------------------------------------------------------		

		' adding the template to the Templates collection
		grid1.Templates.Add(ImageTemplate)
		
		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "ProductID"
		oCol1.ReadOnly = true
		oCol1.HeaderText = "PRODUCT ID"
		oCol1.Width = "125"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ProductName"
		oCol2.HeaderText = "PRODUCT NAME"
		oCol2.Width = "225"
	
		Dim oCol3 As Column = new Column()
		oCol3.DataField = "UnitPrice"
		oCol3.HeaderText = "UNIT PRICE"
		oCol3.Width = "150"		

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "Image"
		oCol4.HeaderText = "IMAGE"
		oCol4.Width = "125"
		oCol4.Align = "center"
		oCol4.TemplateSettings.TemplateId = "ImageTemplate"

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)		

		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
		
		If Not Page.IsPostBack Then		
			BindGrid()			
		End If		
	End Sub

	' Create the methods that will load the data into the templates
	'------------------------------------------------------------------------
	Sub CreateImageTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)			
		Dim oLiteral As Literal = New Literal()
		e.Container.Controls.Add(oLiteral)
		AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindImageTemplate		
	End Sub
	
	Sub DataBindImageTemplate(ByVal sender As Object, ByVal e As EventArgs)			
		Dim oLiteral As Literal = CType(sender, Literal)
		Dim oContainer As Obout.Grid.TemplateContainer
		oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)


		oLiteral.Text = "<img src=""resources/images/products/" + oContainer.Value + """ alt="""" width=""50"" height=""50"" />"
		
	End Sub
	'------------------------------------------------------------------------
	
	Sub BindGrid()	
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

		Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 27 * FROM Products", myConn)
		myConn.Open()
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()
		'Dim da = new OleDbDataAdapter()
		'Dim ds = new DataSet()
		'da.SelectCommand = myComm
		'da.Fill(ds, "Products")
		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()
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
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>
