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
        
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowAddingRecords = false

        
        ' creating the template for the USD column (view mode)
        '------------------------------------------------------------------------
        Dim usdTemplate As Obout.Grid.GridRuntimeTemplate
        usdTemplate = New GridRuntimeTemplate()
        usdTemplate.ID = "usdTemplate"
        usdTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(usdTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateUSDTemplate
        '------------------------------------------------------------------------
        ' creating the template for the JPY column (view mode)
        '------------------------------------------------------------------------
        Dim jpyTemplate As Obout.Grid.GridRuntimeTemplate
        jpyTemplate = New GridRuntimeTemplate()
        jpyTemplate.ID = "jpyTemplate"
        jpyTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(jpyTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateJPYTemplate
        '------------------------------------------------------------------------

        ' creating the template for the GBP column (view mode)
        '------------------------------------------------------------------------
        Dim gbpTemplate As Obout.Grid.GridRuntimeTemplate
        gbpTemplate = New GridRuntimeTemplate()
        gbpTemplate.ID = "gbpTemplate"
        gbpTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(gbpTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateGBPTemplate
        '------------------------------------------------------------------------
		
        ' adding the templates to the Templates collection
        grid1.Templates.Add(usdTemplate)
        grid1.Templates.Add(jpyTemplate)
        grid1.Templates.Add(gbpTemplate)
				

		' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = true
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "Freight"
        oCol2.HeaderText = "Freight in USD"
        oCol2.Width = "200"
        oCol2.TemplateSettings.TemplateId = "usdTemplate"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = ""
        oCol3.HeaderText = "Freight in JPY"
        oCol3.Width = "150"
        oCol3.TemplateSettings.TemplateId = "jpyTemplate"
        oCol3.Visible = True
       

        Dim oCol4 As Column = New Column()
        oCol4.DataField = ""
        oCol4.HeaderText = "Freight in GBP"
        oCol4.Width = "150"
        oCol4.TemplateSettings.TemplateId = "gbpTemplate"

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
    
    ' Create the methods that will load the data into the USD templates
    '------------------------------------------------------------------------
    Sub CreateUSDTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindUSDTemplate
    End Sub
    Sub DataBindUSDTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        If oContainer.Value <> String.Empty And oContainer.Value <> "&#160;" Then
            oLiteral.Text = String.Format("{0:C}", Convert.ToDecimal(oContainer.Value))
        Else
            oLiteral.Text = ""
        End If
        
    End Sub
    '-------------------------------------------------------------------

      ' Create the methods that will load the data into the JPY templates
    '------------------------------------------------------------------------
    Sub CreateJPYTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindJPYTemplate
    End Sub
    Sub DataBindJPYTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)


        Dim value As String = (Convert.ToDouble(oContainer.DataItem("Freight")) * 118.19) & ""
        If value <> String.Empty And value <> "&#160;" Then
            oLiteral.Text = Convert.ToDecimal(value).ToString("¥#,##0.00;(¥#,##0.00);Zero")
        Else
            oLiteral.Text = ""
        End If

    End Sub
    '-------------------------------------------------------------------


    ' Create the methods that will load the data into the USD templates
    '------------------------------------------------------------------------
    Sub CreateGBPTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindGBPTemplate
    End Sub
    Sub DataBindGBPTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        Dim value As String = (Convert.ToDouble(oContainer.DataItem("Freight")) / 1.9565) & ""
        If value <> String.Empty And value <> "&#160;" Then
            oLiteral.Text = Convert.ToDecimal(value).ToString("£#,##0.00;(£#,##0.00);Zero")
        Else
            oLiteral.Text = ""
        End If

    End Sub
    '-------------------------------------------------------------------


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
		<span class="tdText"><b>ASP.NET Grid - Formatting Currencies</b></span>
		<br /><br />			
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

		<br /><br /><br />
		
		<span class="tdText">
		    Templates can be used also to format currencies.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>