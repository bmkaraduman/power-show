<%@ Page Language="C#" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
    Grid grid1 = new Grid();

    string number = "#,##0.00;(#,##0.00);Zero";
    string currency = "$#,##0.00;($#,##0.00);Zero";
    string date = "dd/MM/yyyy";
    string phone = "1-###-###-####";
    
	void Page_load(object sender, EventArgs e)		
	{
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        
        grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowAddingRecords = false;


        // creating the template for the Number column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate numberTemplate = new GridRuntimeTemplate();
        numberTemplate.ID = "numberTemplate";
        numberTemplate.Template = new Obout.Grid.RuntimeTemplate();
        numberTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateNumberTemplate);
        //------------------------------------------------------------------------

        // creating the template for the Currency column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate currencyTemplate = new GridRuntimeTemplate();
        currencyTemplate.ID = "currencyTemplate";
        currencyTemplate.Template = new Obout.Grid.RuntimeTemplate();
        currencyTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCurrencyTemplate);
        //------------------------------------------------------------------------

        // creating the template for the Date column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate dateTemplate = new GridRuntimeTemplate();
        dateTemplate.ID = "dateTemplate";
        dateTemplate.Template = new Obout.Grid.RuntimeTemplate();
        dateTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateDateTemplate);
        //------------------------------------------------------------------------

        // creating the template for the Date column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate phoneTemplate = new GridRuntimeTemplate();
        phoneTemplate.ID = "phoneTemplate";
        phoneTemplate.Template = new Obout.Grid.RuntimeTemplate();
        phoneTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreatePhoneTemplate);
        //------------------------------------------------------------------------

        
        // adding the templates to the Templates collection
        grid1.Templates.Add(numberTemplate);
        grid1.Templates.Add(currencyTemplate);
        grid1.Templates.Add(dateTemplate);
        grid1.Templates.Add(phoneTemplate);
        
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "id";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "Row ID";
        oCol1.Width = "70";

        Column oCol2 = new Column();
        oCol2.DataField = "number";
        oCol2.HeaderText = "Number";
        oCol2.Width = "150";
        oCol2.TemplateSettings.TemplateId = "numberTemplate";        

        Column oCol3 = new Column();
        oCol3.DataField = "currency";
        oCol3.HeaderText = "Currency";
        oCol3.Width = "150";
        oCol3.TemplateSettings.TemplateId = "currencyTemplate";

        Column oCol4 = new Column();
        oCol4.DataField = "date";
        oCol4.HeaderText = "Date Time";
        oCol4.Width = "180";
        oCol4.TemplateSettings.TemplateId = "dateTemplate";

        Column oCol5 = new Column();
        oCol5.DataField = "phone";
        oCol5.HeaderText = "Phone";
        oCol5.Width = "150";
        oCol5.TemplateSettings.TemplateId = "phoneTemplate";
        
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
        setValue();
	}

    void setValue()
    {
        number = cbNumberFormat.Text;
        currency = cbCurrencyFormat.Text;
        date = cbDateFormat.Text;
        phone = cbPhoneFormat.Text;
    }
    
    // Create the methods that will load the data into the templates
    //------------------------------------------------------------------------
    public void CreateNumberTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindNumberTemplate);
    }
    protected void DataBindNumberTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = oContainer.Value != String.Empty && oContainer.Value != "&#160;" ?  (number == "{0:n:1}")? 
							String.Format( number, oContainer.Value + "") : Convert.ToDecimal( oContainer.Value).ToString( number )   : "";
    }
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    public void CreateCurrencyTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindCurrencyTemplate);
    }
    protected void DataBindCurrencyTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = oContainer.Value != String.Empty && oContainer.Value != "&#160;" ? Convert.ToDecimal(oContainer.Value).ToString(currency) : "";
    }
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    public void CreateDateTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindDateTemplate);
    }
    protected void DataBindDateTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = oContainer.Value != String.Empty && oContainer.Value != "&#160;" ? Convert.ToDateTime(oContainer.Value.Replace("&#160;", " ")).ToString(date) : "";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreatePhoneTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindPhoneTemplate);
    }
    protected void DataBindPhoneTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = oContainer.Value != String.Empty && oContainer.Value != "&#160;" ? Convert.ToDecimal(oContainer.Value).ToString(phone) : "";
    }
    //------------------------------------------------------------------------
	
	void CreateGrid()
	{
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/format.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM format ORDER BY id DESC", myConn);
        myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}	
		
	
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
			<span class="tdText">To change the format of the columns, please select different formats from the drop-down lists.</span>
			<br /><br />		
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>