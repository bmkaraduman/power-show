<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>

<script language="C#" runat="server">
	Grid grid1 = new Grid();

	void Page_load(object sender, EventArgs e)		
	{			
		grid1.ID = "grid1";
		grid1.CallbackMode = true;
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
        grid1.DataSourceID = "sds1";
      
		grid1.ClientSideEvents.OnClientEdit = "onAddEdit";
        grid1.ClientSideEvents.OnClientAdd = "onAddEdit";
        grid1.ClientSideEvents.OnBeforeClientUpdate = "onBeforeInsertUpdate";
        
		// creating the Templates
		//------------------------------------------------------------------------
        GridRuntimeTemplate TemplateEditPhoneTemplate = new GridRuntimeTemplate();
        TemplateEditPhoneTemplate.ID = "EditPhoneTemplate";
        TemplateEditPhoneTemplate.ControlID = "PhoneContent";
        TemplateEditPhoneTemplate.Template = new Obout.Grid.RuntimeTemplate();
        TemplateEditPhoneTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditPhoneTemplate);
        TemplateEditPhoneTemplate.UseQuotes = false;
		//------------------------------------------------------------------------
		
		// adding the templates to the Templates collection
        grid1.Templates.Add(TemplateEditPhoneTemplate);
		
																						
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "SupplierID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ID";
		oCol1.Width = "45";

		Column oCol2 = new Column();
		oCol2.DataField = "CompanyName";
		oCol2.HeaderText = "Company Name";
		oCol2.Width = "250";
	
		Column oCol3 = new Column();
		oCol3.DataField = "Address";
		oCol3.HeaderText = "Address";
		oCol3.Width = "175";

		Column oCol4 = new Column();
		oCol4.DataField = "Country";
		oCol4.HeaderText = "Country";
		oCol4.Width = "115";
	
		Column oCol5 = new Column();
		oCol5.DataField = "Phone";
		oCol5.HeaderText = "Phone";
		oCol5.Width = "170";
        oCol5.TemplateSettings.EditTemplateId = "EditPhoneTemplate";

		Column oCol6 = new Column();
		oCol6.HeaderText = "EDIT";		
		oCol6.Width = "125";
		oCol6.AllowEdit = true;
        oCol6.AllowDelete = true;

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		grid1.Columns.Add(oCol6);

		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
		
	}

	// Create the methods that will load the data into the templates
	//------------------------------------------------------------------------

    public void CreateEditPhoneTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
        PlaceHolder templatePlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(templatePlaceHolder);
        templatePlaceHolder.DataBinding += new EventHandler(DataBindEditPhoneTemplate);
	}
    protected void DataBindEditPhoneTemplate(Object sender, EventArgs e)
	{
		PlaceHolder templatePlaceHolder = sender as PlaceHolder;
		Obout.Grid.TemplateContainer oContainer = templatePlaceHolder.NamingContainer as Obout.Grid.TemplateContainer;

        OboutTextBox oboutTextBox1 = new OboutTextBox();
        oboutTextBox1.ID = "OboutTextBox1";
        oboutTextBox1.Width = Unit.Percentage(28);
        oboutTextBox1.MaxLength = 3;
        
        OboutTextBox oboutTextBox2 = new OboutTextBox();
        oboutTextBox2.ID = "OboutTextBox2";
        oboutTextBox2.Width = Unit.Percentage(28);
        oboutTextBox2.MaxLength = 3;
        
        OboutTextBox oboutTextBox3 = new OboutTextBox();
        oboutTextBox3.ID = "OboutTextBox3";
        oboutTextBox3.Width = Unit.Percentage(38);
        oboutTextBox3.MaxLength = 4;
			
         Literal hidden = new Literal();
         hidden.Text = "<input type=\"hidden\" id=\"PhoneContent\" /> ";

         templatePlaceHolder.Controls.Add(oboutTextBox1);
         templatePlaceHolder.Controls.Add(oboutTextBox2);
         templatePlaceHolder.Controls.Add(oboutTextBox3);
         templatePlaceHolder.Controls.Add(hidden);
	}

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
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>