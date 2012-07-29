<%@ Page Language="VB" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    
    Dim number As String = "#,##0.00;(#,##0.00);Zero"
    Dim currency As String = "$#,##0.00;($#,##0.00);Zero"
    Dim dateTime As String = "dd/MM/yyyy"
    Dim phone As String = "1-###-###-####"
        
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = true
        grid1.AutoGenerateColumns = false
        
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowAddingRecords = false

        
        ' creating the template for the Number column (view mode)
        '------------------------------------------------------------------------
        Dim numberTemplate As Obout.Grid.GridRuntimeTemplate
        numberTemplate = New GridRuntimeTemplate()
        numberTemplate.ID = "numberTemplate"
        numberTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(numberTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateNumberTemplate
        '------------------------------------------------------------------------
        ' creating the template for the Currency column (view mode)
        '------------------------------------------------------------------------
        Dim currencyTemplate As Obout.Grid.GridRuntimeTemplate
        currencyTemplate = New GridRuntimeTemplate()
        currencyTemplate.ID = "currencyTemplate"
        currencyTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(currencyTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCurrencyTemplate
        '------------------------------------------------------------------------

        ' creating the template for the Date column (view mode)
        '------------------------------------------------------------------------
        Dim dateTemplate As Obout.Grid.GridRuntimeTemplate
        dateTemplate = New GridRuntimeTemplate()
        dateTemplate.ID = "dateTemplate"
        dateTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(dateTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateDateTemplate
        '------------------------------------------------------------------------

        ' creating the template for the Phone column (view mode)
        '------------------------------------------------------------------------
        Dim phoneTemplate As Obout.Grid.GridRuntimeTemplate
        phoneTemplate = New GridRuntimeTemplate()
        phoneTemplate.ID = "phoneTemplate"
        phoneTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(phoneTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreatePhoneTemplate
        '------------------------------------------------------------------------
		
        ' adding the templates to the Templates collection
        grid1.Templates.Add(numberTemplate)
        grid1.Templates.Add(currencyTemplate)
        grid1.Templates.Add(dateTemplate)
        grid1.Templates.Add(phoneTemplate)

		' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "id"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "Row ID"
        oCol1.Width = "70"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "number"
        oCol2.HeaderText = "Number"
        oCol2.Width = "150"
        oCol2.TemplateSettings.TemplateId = "numberTemplate"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "currency"
        oCol3.HeaderText = "Currency"
        oCol3.Width = "150"
        oCol3.TemplateSettings.TemplateId = "currencyTemplate"
       

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "date"
        oCol4.HeaderText = "Date Time"
        oCol4.Width = "180"
        oCol4.TemplateSettings.TemplateId = "dateTemplate"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "phone"
        oCol5.HeaderText = "Phone"
        oCol5.Width = "150"
        oCol5.TemplateSettings.TemplateId = "phoneTemplate"
        
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
		
        setValue()
    End Sub
    
    Sub setValue()
        number = cbNumberFormat.Text
        currency = cbCurrencyFormat.Text
        dateTime = cbDateFormat.Text
        phone = cbPhoneFormat.Text
    End Sub
    
    ' Create the methods that will load the data into the Number templates
    '------------------------------------------------------------------------
    Sub CreateNumberTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindNumberTemplate
    End Sub
    Sub DataBindNumberTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        If oContainer.Value <> String.Empty And oContainer.Value <> "&#160;" Then
            If (number = "{0:n:1}") Then
                oLiteral.Text = String.Format(number, oContainer.Value + "")
            Else
                oLiteral.Text = Convert.ToDecimal(oContainer.Value).ToString(number)
            End If
            
        Else
            oLiteral.Text = ""
        End If
        
    End Sub
    '-------------------------------------------------------------------

    ' Create the methods that will load the data into the Currency templates
    '------------------------------------------------------------------------
    Sub CreateCurrencyTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindCurrencyTemplate
    End Sub
    Sub DataBindCurrencyTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        If oContainer.Value <> String.Empty And oContainer.Value <> "&#160;" Then
            oLiteral.Text = Convert.ToDecimal(oContainer.Value).ToString(currency)
        Else
            oLiteral.Text = ""
        End If

    End Sub
    '-------------------------------------------------------------------


    ' Create the methods that will load the data into the Date Time templates
    '------------------------------------------------------------------------
    Sub CreateDateTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindDateTemplate
    End Sub
    Sub DataBindDateTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
        
                
        If oContainer.Value <> String.Empty And oContainer.Value <> "&#160;" Then
            oLiteral.Text = Convert.ToDateTime(oContainer.Value.Replace("&#160;", " ")).ToString(dateTime)
        Else
            oLiteral.Text = ""
        End If

    End Sub
    '-------------------------------------------------------------------


    ' Create the methods that will load the data into the Phone templates
    '------------------------------------------------------------------------
    Sub CreatePhoneTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindPhoneTemplate
    End Sub
    Sub DataBindPhoneTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
        
                
        If oContainer.Value <> String.Empty And oContainer.Value <> "&#160;" Then
            oLiteral.Text = Convert.ToDecimal(oContainer.Value).ToString(phone)
        Else
            oLiteral.Text = ""
        End If

    End Sub
    '-------------------------------------------------------------------

    Sub BindGrid()
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/format.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM format ORDER BY id DESC", myConn)
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
		<span class="tdText"><b>ASP.NET Grid - Formatting Numbers, Currencies, Dates and Phone Numbers  </b></span>
		<br /><br />			
			<table>
				<tr>
					<td class="tdText">Number Format</td>
					<td class="tdText">Currency Format</td>
					<td class="tdText">Date Format</td>
					<td class="tdText">Phone Format</td>
				</tr>
				<tr>
					<td >
					<asp:DropDownList runat="server" ID="cbNumberFormat" CssClass="tdText" AutoPostBack="true">
						<asp:ListItem Value="{0:n:1}">{0:n:1}</asp:ListItem>
						<asp:ListItem Value="#,###;-#,###;0">#,###</asp:ListItem>
						<asp:ListItem Value="#,##0.00" Selected="true">#,##0.00</asp:ListItem>
						<asp:ListItem Value="#,##0.00;(#,##0.00);Zero" >#,##0.00;(#,##0.00);Zero</asp:ListItem>
						<asp:ListItem Value="#,###;-#,###;Hiding Zero" >#,###;-#,###;Hiding Zero</asp:ListItem>
						<asp:ListItem Value="#%;-#%;0%">#%</asp:ListItem>
					</asp:DropDownList>
					</td>
					<td >
						<asp:DropDownList runat="server" ID="cbCurrencyFormat" CssClass="tdText" AutoPostBack="true">
							<asp:ListItem Value="$#,##0.00;($#,##0.00);0">$#,##0.00;($#,##0.00);0</asp:ListItem>
							<asp:ListItem Value="¥#,##0.00;(¥#,##0.00);Zero" Selected="true">¥#,##0.00;(¥#,##0.00);Zero</asp:ListItem>
							<asp:ListItem Value="¥#,##0.00;-¥#,##0.00;Zero" >¥#,##0.00;-¥#,##0.00;Zero</asp:ListItem>
							<asp:ListItem Value="£#,##0;(£#,##0);Zero" >£#,##0;(£#,##0);Zero</asp:ListItem>
						</asp:DropDownList>
					</td>
					<td >
						<asp:DropDownList runat="server" ID="cbDateFormat" CssClass="tdText" AutoPostBack="true">
							<asp:ListItem Value="dd-MM-yy">dd-MM-yy</asp:ListItem>
							<asp:ListItem Value="ddd dd-MM-yy">ddd dd-MM-yy</asp:ListItem>
							<asp:ListItem Value="dddd dd-MM-yy">dddd dd-MM-yy</asp:ListItem>
							<asp:ListItem Value="dd-MM-yyyy" >dd-MM-yyyy</asp:ListItem>
							<asp:ListItem Value="dd MMM yyyy">dd MMM yyyy</asp:ListItem>
							<asp:ListItem Value="dd-MMM-yyyy">dd-MMM-yyyy</asp:ListItem>
							<asp:ListItem Value="dd/MM/yyyy" Selected="true">dd/MM/yyyy</asp:ListItem>
							<asp:ListItem Value="dd/MM/yyyy HH:mm:ff">dd/MM/yyyy HH:mm:ff</asp:ListItem>
							<asp:ListItem Value="dd/MM/yyyy hh:mm tt">dd/MM/yyyy hh:mm AM</asp:ListItem>
							<asp:ListItem Value="dd MMM yyyy hh:mm tt">dd MMM yyyy hh:mm AM</asp:ListItem>
							<asp:ListItem Value="dd MMM yyyy hh:mm tt">dd MMM yyyy hh:mm AM</asp:ListItem>
							<asp:ListItem Value="HH:MM:ff" >HH:MM:ff</asp:ListItem>
							<asp:ListItem Value="hh:MM tt" >hh:MM AM</asp:ListItem>
						</asp:DropDownList>
					</td>
					<td>
						<asp:DropDownList runat="server" ID="cbPhoneFormat" CssClass="tdText" AutoPostBack="true">
							<asp:ListItem Value="(###) ###-####">(###) ###-####</asp:ListItem>
							<asp:ListItem Value="###-###-####">###-###-####</asp:ListItem>
							<asp:ListItem Value="1-###-###-####" Selected="true">1-###-###-####</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>

			</table>
			



			<br />             
			<span class="tdText">To change the format of the columns, please select different formats from the drop-down lists. </span>
			<br /><br />
		    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

		    <br /><br /><br />
	
		    <a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>