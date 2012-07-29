<%@ Page Language="VB" %>
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
        grid1.AllowAddingRecords = False
        grid1.AllowGrouping = True
        grid1.GroupBy = "Country"
        
        grid1.FolderStyle = "styles/premiere_blue"
				
		
        ' creating the Templates
		
        ' creating the template for the Country column (view mode)
        '------------------------------------------------------------------------
        Dim TemplateCountry As Obout.Grid.GridRuntimeTemplate
        TemplateCountry = New GridRuntimeTemplate()
        TemplateCountry.ID = "TemplateCountry"
        TemplateCountry.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateCountry.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCountryTemplate
        '------------------------------------------------------------------------

        ' creating the template for the Country column (Group Header)
        '------------------------------------------------------------------------		
        Dim TemplateCountryGroup As Obout.Grid.GridRuntimeTemplate
        TemplateCountryGroup = New GridRuntimeTemplate()
        TemplateCountryGroup.ID = "TemplateCountryGroup"
        TemplateCountryGroup.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateCountryGroup.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCountryGroupTemplate
        '------------------------------------------------------------------------

        ' creating the template for the Has Website column (view mode)
        '------------------------------------------------------------------------
        Dim TemplateHasWebsite As Obout.Grid.GridRuntimeTemplate
        TemplateHasWebsite = New GridRuntimeTemplate()
        TemplateHasWebsite.ID = "TemplateHasWebsite"
        TemplateHasWebsite.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateHasWebsite.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateHasWebsiteTemplate
        '------------------------------------------------------------------------

        ' adding the templates to the Templates collection
        grid1.Templates.Add(TemplateCountry)
        grid1.Templates.Add(TemplateCountryGroup)
        grid1.Templates.Add(TemplateHasWebsite)
		
																						
        ' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "60"

        Dim oCol2 As Column = new Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "Company Name"
        oCol2.Width = "250"
	
        Dim oCol3 As Column = new Column()
        oCol3.DataField = "Address"
        oCol3.HeaderText = "Address"
        oCol3.Width = "175"

        Dim oCol4 As Column = new Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "Country"
        oCol4.Width = "115"
        oCol4.TemplateSettings.TemplateId = "TemplateCountry"
        oCol4.TemplateSettings.GroupHeaderTemplateId = "TemplateCountryGroup"
	
        Dim oCol5 As Column = new Column()
        oCol5.DataField = "HomePage"
        oCol5.HeaderText = "Has WebSite"
        oCol5.Width = "125"
        oCol5.TemplateSettings.TemplateId = "TemplateHasWebsite"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
		
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
				
        If Not Page.IsPostBack Then
            BindGrid()
        End If
    End Sub


    '------------------------------------------------------------------------
    Sub CreateCountryTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindCountryTemplate
    End Sub
    Sub DataBindCountryTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
		
        oLiteral.Text = "<b><u><i>" + oContainer.Value + "</i></u></b>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateCountryGroupTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindCountryGroupTemplate
    End Sub
    Sub DataBindCountryGroupTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
		
        oLiteral.Text = "<b><i>" + oContainer.Value + "</i></b>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
	Sub CreateHasWebsiteTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)	
		Dim oLiteral As Literal = New Literal()
		e.Container.Controls.Add(oLiteral)		
		AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindHasWebsiteTemplate
	End Sub
	Sub DataBindHasWebsiteTemplate(ByVal sender As Object, ByVal e As EventArgs)
		Dim oLiteral As Literal = CType(sender, Literal)
		Dim oContainer As Obout.Grid.TemplateContainer
		oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
		
		If oContainer.Value = "true" Then
			oLiteral.Text = "yes"
		Else
			oLiteral.Text = "no"
		End If
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
		<span class="tdText"><b>ASP.NET Grid - Using the GroupHeaderTemplateId property</b></span>
		<br /><br />			
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		
		<span class="tdText">
		    To customize the data displayed in the headers of the Groups, you can use the <b>GroupHeaderTemplateId</b> property,<br />
		    which can be set using the <b>TemplateSettings</b> property of the Column class.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>