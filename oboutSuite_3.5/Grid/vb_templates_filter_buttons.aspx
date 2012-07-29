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
        grid1.AllowFiltering = True
        grid1.TemplateSettings.FilterShowButton_TemplateId = "tplShowFilter"
        grid1.TemplateSettings.FilterApplyButton_TemplateId = "tplApplyFilter"
        grid1.TemplateSettings.FilterHideButton_TemplateId = "tplHideFilter"
        grid1.TemplateSettings.FilterRemoveButton_TemplateId = "tplRemoveFilter"
				
		
        ' creating the Templates
		        
        '------------------------------------------------------------------------
        Dim tplShowFilter As Obout.Grid.GridRuntimeTemplate
        tplShowFilter = New GridRuntimeTemplate()
        tplShowFilter.ID = "tplShowFilter"
        tplShowFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplShowFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateShowFilterTemplate
        '------------------------------------------------------------------------
        
        '------------------------------------------------------------------------		
        Dim tplApplyFilter As Obout.Grid.GridRuntimeTemplate
        tplApplyFilter = New GridRuntimeTemplate()
        tplApplyFilter.ID = "tplApplyFilter"
        tplApplyFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplApplyFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateApplyFilterTemplate
        '------------------------------------------------------------------------

        '------------------------------------------------------------------------
        Dim tplHideFilter As Obout.Grid.GridRuntimeTemplate
        tplHideFilter = New GridRuntimeTemplate()
        tplHideFilter.ID = "tplHideFilter"
        tplHideFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplHideFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateHideFilterTemplate
        '------------------------------------------------------------------------

        '------------------------------------------------------------------------
        Dim tplRemoveFilter As Obout.Grid.GridRuntimeTemplate
        tplRemoveFilter = New GridRuntimeTemplate()
        tplRemoveFilter.ID = "tplRemoveFilter"
        tplRemoveFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplRemoveFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateRemoveFilterTemplate
        '------------------------------------------------------------------------
        						
		
        ' adding the templates to the Templates collection
        grid1.Templates.Add(tplShowFilter)
        grid1.Templates.Add(tplApplyFilter)
        grid1.Templates.Add(tplHideFilter)
        grid1.Templates.Add(tplRemoveFilter)
		
																						
        ' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "60"
        oCol1.Visible = False

        Dim oCol2 As Column = new Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "300"
	
        Dim oCol3 As Column = new Column()
        oCol3.DataField = "Address"
        oCol3.HeaderText = "COMPANY ADDRESS"
        oCol3.Width = "250"

        Dim oCol4 As Column = new Column()
        oCol4.DataField = "City"
        oCol4.HeaderText = "CITY"
        oCol4.Width = "200"
	
        Dim oCol5 As Column = new Column()
        oCol5.DataField = "Country"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "125"

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
    
    
    ' Create the methods that will load the data into the templates
    '------------------------------------------------------------------------
    Sub CreateShowFilterTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindShowFilterTemplate
    End Sub
    Sub DataBindShowFilterTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" id=""btnShowFilter"" class=""tdTextSmall"" value=""Show Filter"" onclick=""grid1.showFilter()""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateApplyFilterTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindApplyFilterTemplate
    End Sub
    Sub DataBindApplyFilterTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" id=""btnApplyFilter"" class=""tdTextSmall"" value=""Apply Filter"" onclick=""grid1.filter()""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateHideFilterTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindHideFilterTemplate
    End Sub
    Sub DataBindHideFilterTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" id=""btnHideFilter"" class=""tdTextSmall"" value=""Hide Filter"" onclick=""grid1.hideFilter()""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateRemoveFilterTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindRemoveFilterTemplate
    End Sub
    Sub DataBindRemoveFilterTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" id=""btnRemoveFilter"" class=""tdTextSmall"" value=""Remove Filter"" onclick=""grid1.removeFilter()""/>"
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
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Templates for the "Show Filter"/"Apply Filter"/"Hide Filter"/"Remove Filter" buttons</b></span>
		<br /><br />			
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

		<br /><br /><br />
		
		<span class="tdText">		   
		    Use the <b>FilterShowButton_TemplateId</b>, <b>FilterApplyButton_TemplateId</b>, <b>FilterHideButton_TemplateId</b> and <b>FilterRemoveButton_TemplateId</b><br />
		    properties of the <b>Grid</b> class to specify the Templates for the "Show Filter"/"Apply Filter"/"Hide Filter"/"Remove Filter" buttons.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>