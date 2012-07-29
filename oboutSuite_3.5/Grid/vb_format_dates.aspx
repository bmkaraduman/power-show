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
        
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowAddingRecords = False
     
		
        ' creating the Templates
        
        ' creating the template for the ORDER DATE column (view mode)
        '------------------------------------------------------------------------
        Dim dateTemplate1 As Obout.Grid.GridRuntimeTemplate
        dateTemplate1 = New GridRuntimeTemplate()        
        dateTemplate1.ID = "dateTemplate1"
        dateTemplate1.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(dateTemplate1.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateDateTemplate1
        '------------------------------------------------------------------------

        ' creating the template for the REQUIRED DATE column (view mode)
        '------------------------------------------------------------------------
        Dim dateTemplate2 As Obout.Grid.GridRuntimeTemplate
        dateTemplate2 = New GridRuntimeTemplate()
        dateTemplate2.ID = "dateTemplate2"
        dateTemplate2.Template = New Obout.Grid.RuntimeTemplate()        
        AddHandler CType(dateTemplate2.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateDateTemplate2
        '------------------------------------------------------------------------

        ' creating the template for the SHIPPED DATE column (view mode)
        '------------------------------------------------------------------------
        Dim dateTemplate3 As Obout.Grid.GridRuntimeTemplate
        dateTemplate3 = New GridRuntimeTemplate()
        dateTemplate3.ID = "dateTemplate3"
        dateTemplate3.Template = New Obout.Grid.RuntimeTemplate()        
        AddHandler CType(dateTemplate3.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateDateTemplate3
        '------------------------------------------------------------------------
						
		
        ' adding the templates to the Templates collection
        grid1.Templates.Add(dateTemplate1)
        grid1.Templates.Add(dateTemplate2)
        grid1.Templates.Add(dateTemplate3)
        
        ' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = true
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = new Column()
        oCol2.DataField = "OrderDate"
        oCol2.HeaderText = "ORDER DATE"
        oCol2.Width = "250"
        oCol2.TemplateSettings.TemplateId = "dateTemplate1"

        Dim oCol3 As Column = new Column()
        oCol3.DataField = "RequiredDate"
        oCol3.HeaderText = "REQUIRED DATE"
        oCol3.Width = "150"
        oCol3.TemplateSettings.TemplateId = "dateTemplate2"

        Dim oCol4 As Column = new Column()
        oCol4.DataField = "ShippedDate"
        oCol4.HeaderText = "SHIPPED DATE"
        oCol4.Width = "150"
        oCol4.TemplateSettings.TemplateId = "dateTemplate3"

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
    Sub CreateDateTemplate1(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindDateTemplate1
    End Sub
    Sub DataBindDateTemplate1(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        If oContainer.Value <> String.Empty And oContainer.Value <> "&#160;" Then
            oLiteral.Text = Convert.ToDateTime(oContainer.Value.Replace("&#160;", " ")).ToString("MM/dd/yy")
        Else
            oLiteral.Text = ""
        End If         
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateDateTemplate2(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindDateTemplate2
    End Sub
    Sub DataBindDateTemplate2(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        If oContainer.Value <> String.Empty And oContainer.Value <> "&#160;" Then
            oLiteral.Text = Convert.ToDateTime(oContainer.Value.Replace("&#160;", " ")).ToString("MM/dd/yy")
        Else
            oLiteral.Text = ""
        End If
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateDateTemplate3(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindDateTemplate3
    End Sub
    Sub DataBindDateTemplate3(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        If oContainer.Value <> String.Empty And oContainer.Value <> "&#160;" Then
            oLiteral.Text = Convert.ToDateTime(oContainer.Value.Replace("&#160;", " ")).ToString("MM/dd/yy")
        Else
            oLiteral.Text = ""
        End If
    End Sub
    '------------------------------------------------------------------------

  

    Sub BindGrid()
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders", myConn)
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
		<span class="tdText"><b>ASP.NET Grid - Formatting Dates</b></span>
		<br /><br />			
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

		<br /><br /><br />
		
		<span class="tdText">
		    Templates can be used also to format dates.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>