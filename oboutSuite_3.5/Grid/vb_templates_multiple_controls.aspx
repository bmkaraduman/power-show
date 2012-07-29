<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.DataSourceID = "sds1"
      
        grid1.ClientSideEvents.OnClientEdit = "onAddEdit"
        grid1.ClientSideEvents.OnClientAdd = "onAddEdit"
        grid1.ClientSideEvents.OnBeforeClientUpdate = "onBeforeInsertUpdate"
        
		
        ' creating the Templates
        '------------------------------------------------------------------------
        Dim TemplateEditPhoneTemplate As Obout.Grid.GridRuntimeTemplate
        TemplateEditPhoneTemplate = New GridRuntimeTemplate()
        TemplateEditPhoneTemplate.ID = "EditPhoneTemplate"
        TemplateEditPhoneTemplate.ControlID = "PhoneContent"
        TemplateEditPhoneTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateEditPhoneTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateEditPhoneTemplate
        TemplateEditPhoneTemplate.UseQuotes = False
        '------------------------------------------------------------------------

        ' adding the templates to the Templates collection
        grid1.Templates.Add(TemplateEditPhoneTemplate)
																		
        ' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "45"

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
	
        Dim oCol5 As Column = new Column()
        oCol5.DataField = "Phone"
        oCol5.HeaderText = "Phone"
        oCol5.Width = "170"
        oCol5.TemplateSettings.EditTemplateId = "EditPhoneTemplate"


        Dim oCol6 As Column = new Column()
        oCol6.HeaderText = "EDIT"
        oCol6.Width = "125"
        oCol6.AllowEdit = True
        oCol6.AllowDelete = True

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

	' Create the methods that will load the data into the templates
	'------------------------------------------------------------------------
    Sub CreateEditPhoneTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(templatePlaceHolder)
        AddHandler CType(templatePlaceHolder, PlaceHolder).DataBinding, AddressOf DataBindEditPhoneTemplate
    End Sub
    Sub DataBindEditPhoneTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim templatePlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(templatePlaceHolder.NamingContainer, Obout.Grid.TemplateContainer)

        Dim oboutTextBox1 As OboutTextBox = New OboutTextBox()
        oboutTextBox1.ID = "OboutTextBox1"
        oboutTextBox1.Width = Unit.Percentage(28)
        oboutTextBox1.MaxLength = 3
        
        Dim oboutTextBox2 As OboutTextBox = New OboutTextBox()
        oboutTextBox2.ID = "OboutTextBox2"
        oboutTextBox2.Width = Unit.Percentage(28)
        oboutTextBox2.MaxLength = 3
        
        Dim oboutTextBox3 As OboutTextBox = New OboutTextBox()
        oboutTextBox3.ID = "OboutTextBox3"
        oboutTextBox3.Width = Unit.Percentage(38)
        oboutTextBox3.MaxLength = 4
			
        Dim hidden As Literal = New Literal()
        hidden.Text = "<input type=""hidden"" id=""PhoneContent"" /> "

        templatePlaceHolder.Controls.Add(oboutTextBox1)
        templatePlaceHolder.Controls.Add(oboutTextBox2)
        templatePlaceHolder.Controls.Add(oboutTextBox3)
        templatePlaceHolder.Controls.Add(hidden)
    End Sub
	
	</script>	
		
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
		
		<script type="text/JavaScript">
		    function onAddEdit() {
		        var phoneContent = document.getElementById('PhoneContent').value;
		        phoneContent = phoneContent.replace('(', '').replace(')', '').replace(/-/g, '').replace(/ /g, '');
		        OboutTextBox1.value(phoneContent.substr(0, 3));
		        OboutTextBox2.value(phoneContent.substr(3, 3));
		        OboutTextBox3.value(phoneContent.substr(6, 4));

		    }

		    function onBeforeInsertUpdate() {
		        document.getElementById('PhoneContent').value = '(' + OboutTextBox1.value() + ') ' + OboutTextBox2.value() + '-' + OboutTextBox3.value();
		    }
        </script>			
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Multiple Controls inside Template</b></span>
		<br /><br />			
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Suppliers ORDER BY SupplierID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<span class="tdText">
		    This example showcases the use of multiple controls inside a single edit template. <br />
		    Out of the box the Grid can link a template with a single control, but you can override this behavior <br />
		    by using some JavaScript code that will take care of the interaction between the Grid and the controls.<br />
	    </span>

		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>