<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" type="text/C#">
    Grid grid1 = new Grid();
    TextBox TextBox1 = new TextBox();

    void Page_load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = false;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.ShowFooter = false;
        grid1.AllowSorting = false;
        grid1.PageSize = -1;
        grid1.AllowSorting = false;
        grid1.ShowLoadingMessage = false;
        grid1.AllowRecordSelection = false;
        grid1.AllowAddingRecords = false;
        grid1.FolderStyle = "styles/premiere_blue";
        grid1.DataSourceID = "SqlDataSource1";

        grid1.RowDataBound += grid1_RowDataBound;

        // creating the Templates

        // creating the template for the Company name column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate PlainEditTemplate = new GridRuntimeTemplate();
        PlainEditTemplate.ID = "PlainEditTemplate";
        PlainEditTemplate.Template = new Obout.Grid.RuntimeTemplate();
        PlainEditTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreatePlainEditTemplate);
        //------------------------------------------------------------------------

        // adding the templates to the Templates collection
        grid1.Templates.Add(PlainEditTemplate);
        
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";
        oCol1.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol2 = new Column();
        oCol2.DataField = "OrderDate";
        oCol2.HeaderText = "DATE";
        oCol2.Width = "100";
        oCol2.DataFormatString = "{0:MM/dd/yyyy}";
        oCol2.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipName";
        oCol3.HeaderText = "NAME";
        oCol3.Width = "200";
        oCol3.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipCity";
        oCol4.HeaderText = "CITY";
        oCol4.Width = "150";
        oCol4.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipPostalCode";
        oCol5.HeaderText = "POSTAL CODE";
        oCol5.Width = "150";
        oCol5.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol6 = new Column();
        oCol6.DataField = "ShipRegion";
        oCol6.HeaderText = "REGION";
        oCol6.Width = "150";
        oCol6.TemplateSettings.TemplateId = "PlainEditTemplate";

        Column oCol7 = new Column();
        oCol7.DataField = "ShipCountry";
        oCol7.HeaderText = "COUNTRY";
        oCol7.Width = "150";
        oCol7.TemplateSettings.TemplateId = "PlainEditTemplate";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);
        grid1.Columns.Add(oCol7);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

    }
        // Create the methods that will load the data into the templates
	//------------------------------------------------------------------------
    public void CreatePlainEditTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
        PlaceHolder ph1 = new PlaceHolder();
        e.Container.Controls.Add(ph1);

        TextBox text = new TextBox();
        text.ID = "TextBox1";
        text.CssClass = "excel-textbox";
       
        text.Attributes["onfocus"] = "markAsFocused(this)";
        text.Attributes["onblur"] = "markAsBlured(this)";
        ph1.Controls.Add(text);

        ph1.DataBinding += new EventHandler(DataBindPlainEditTemplate);
	}
    protected void DataBindPlainEditTemplate(Object sender, EventArgs e)
	{
        PlaceHolder ph1 = sender as PlaceHolder;
        Obout.Grid.TemplateContainer oContainer = ph1.NamingContainer as Obout.Grid.TemplateContainer;

        TextBox text = ph1.Controls[0] as TextBox;
        
        text.Text = oContainer.Value.ToString();
	}
    
    void SaveChanges(object sender, EventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();
        
        for (int i = 0; i < grid1.RowsInViewState.Count; i++)
        {
            string orderId = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[0]).FindControl("TextBox1")).Text;
            string orderDate = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[1]).FindControl("TextBox1")).Text;
            string shipName = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[2]).FindControl("TextBox1")).Text;
            string shipCity = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[3]).FindControl("TextBox1")).Text;
            string shipPostalCode = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[4]).FindControl("TextBox1")).Text;
            string shipRegion = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[5]).FindControl("TextBox1")).Text;
            string shipCountry = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[6]).FindControl("TextBox1")).Text;
            
            
            OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET OrderDate = @OrderDate, ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipRegion = @ShipRegion, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn);

            myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = orderDate;
            myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = shipName;
            myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = shipCity;
            myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = shipPostalCode;
            myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = shipRegion;
            myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = shipCountry;
            myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = orderId;

            myComm.ExecuteNonQuery();            
        }

        myConn.Close();
    }

    void grid1_RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.DataRow && grid1.RowsInViewState.Count > 0)
        {
            if (grid1.RowsInViewState.Count > e.Row.RowIndex)
            {
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    GridDataControlFieldCell cell = e.Row.Cells[i] as GridDataControlFieldCell;
                    TextBox textBox = cell.FindControl("TextBox1") as TextBox;

                    GridDataControlFieldCell cellInViewState = grid1.RowsInViewState[e.Row.RowIndex].Cells[i] as GridDataControlFieldCell;
                    TextBox textBoxInViewState = cellInViewState.FindControl("TextBox1") as TextBox;

                    textBox.Text = textBoxInViewState.Text;
                }                
            }
        }
    }
</script>

<html>
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
		<script type="text/javascript">
		    function markAsFocused(textbox) {
		        textbox.className = 'excel-textbox-focused';
		    }

		    function markAsBlured(textbox) {
                textbox.className = 'excel-textbox';
            }

		</script>		
	</head>
	<body>	
        
        <form id="Form1" runat="server">
		
        <br />
		
        <span class="tdText"><b>ASP.NET Grid - "Excel-style" editing</b></span>
		
        <br /><br />
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            ProviderName="System.Data.OleDb"
            SelectCommand="SELECT TOP 15 [OrderID], [OrderDate], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry] FROM [Orders]">
        </asp:SqlDataSource>
		
		<br />
		
		<obout:OboutButton runat="server" Text="Save Changes" OnClick="SaveChanges" />
		
		<br /><br />
		
		<span class="tdText">
		    This example showcases the ability to edit the cells of the Grid similar to an Excel spreadsheet.<br />
            To edit a cell simply click it with the mouse.<br />
            When clicking the "Save Changes" button all the changes from the Grid are saved into the database at once.

		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
				
		</form>
	</body>
</html>

<style type="text/css">
    .excel-textbox
    {
        background-color: transparent;
        border: 0px;
    	margin: 0px;
    	padding: 0px;
    	outline: 0;
    	font: inherit;
    	width: 100%;
    	padding-top: 4px;
    	padding-bottom: 4px;
    }
    
    .excel-textbox-focused
    {
        background-color: #FFFFFF;
        border: 0px;
    	margin: 0px;
    	padding: 0px;
    	outline: 0;
    	font: inherit;
    	width: 100%;
    	padding-top: 4px;
    	padding-bottom: 4px;
    }
    
    .excel-textbox-error
    {
        color: #FF0000;
    }
    
	.ob_gCc2 
	{
       padding-left: 3px !important;
	}
	
	.ob_gBCont
	{
		border-bottom: 1px solid #C3C9CE;
	}
</style>