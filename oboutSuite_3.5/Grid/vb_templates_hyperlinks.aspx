<%@ Page Language="VB"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowAddingRecords = False
        grid1.AllowRecordSelection = False
        grid1.AllowMultiRecordSelection = False
		
        ' creating the Templates
		
        ' creating the template for the Company name column (view mode)
        '------------------------------------------------------------------------
        Dim TemplateCompanyName As Obout.Grid.GridRuntimeTemplate
        TemplateCompanyName = New GridRuntimeTemplate()
        TemplateCompanyName.ID = "TemplateCompanyName"
        TemplateCompanyName.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateCompanyName.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCompanyTemplate
        '------------------------------------------------------------------------
			
		
        ' adding the templates to the Templates collection
        grid1.Templates.Add(TemplateCompanyName)       
		
																						
        ' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = true
        oCol1.HeaderText = "ID"
        oCol1.Width = "60"
        oCol1.Visible = false

        Dim oCol2 As Column = new Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "Company Name"
        oCol2.Width = "350"
        oCol2.TemplateSettings.TemplateId = "TemplateCompanyName"        

        Dim oCol3 As Column = new Column()
        oCol3.DataField = "Address"
        oCol3.HeaderText = "Address"
        oCol3.Width = "175"        

        Dim oCol4 As Column = new Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "Country"
        oCol4.Width = "115"        
        
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
	Sub CreateCompanyTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)	
		Dim oLiteral As Literal = New Literal()
		e.Container.Controls.Add(oLiteral)
		AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindCompanyTemplate
	End Sub
	Sub DataBindCompanyTemplate(ByVal sender As Object, ByVal e As EventArgs)
		Dim oLiteral As Literal = CType(sender, Literal)
		Dim oContainer As Obout.Grid.TemplateContainer
		oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<a href=""http://www.test.com/test.aspx?id=" + oContainer.DataItem("SupplierID") + """>" + oContainer.DataItem("CompanyName") + "</a>"
	End Sub
	'------------------------------------------------------------------------	

	Sub BindGrid()	
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

		Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Suppliers", myConn)
		myConn.Open()
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()

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
		<span class="tdText"><b>ASP.NET Grid - Hyperlinks inside the Grid</b></span>
		<br /><br />			
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>			

		<br /><br /><br />
		
		<span class="tdText">
		    You can use Templates to insert hyperlinks in the cells of the Grid.<br /><br />
		    See the <a href="http://www.obout.com/grid/grid_tutorials_templates.aspx">Templates tutorial</a>
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>