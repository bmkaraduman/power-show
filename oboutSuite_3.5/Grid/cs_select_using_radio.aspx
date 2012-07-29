<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
    Grid grid1 = new Grid();
    
	void Page_load(object sender, EventArgs e)		
	{
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;

        grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowRecordSelection = true;
        grid1.AllowMultiRecordSelection = true;
        grid1.KeepSelectedRecords = true;
        grid1.AllowAddingRecords = false;
        grid1.AllowMultiRecordSelection = false;
        grid1.ClientSideEvents.OnClientCallback = "resetRadio";
		grid1.ClientSideEvents.OnClientSelect = "onRecordSelect";
        grid1.GenerateRecordIds = true;

        // creating the template for the Company name column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate CheckTemplate = new GridRuntimeTemplate();
        CheckTemplate.ID = "CheckTemplate";
        CheckTemplate.Template = new Obout.Grid.RuntimeTemplate();
        CheckTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCheckTemplate);
        //------------------------------------------------------------------------

        // adding the templates to the Templates collection
        grid1.Templates.Add(CheckTemplate);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "Select";
        oCol1.TemplateSettings.TemplateId = "CheckTemplate";

        Column oCol2 = new Column();
        oCol2.DataField = "ProductID";
        oCol2.HeaderText = "Product ID";
        oCol2.Width = "125";
        oCol2.ReadOnly = true;


        Column oCol3 = new Column();
        oCol3.DataField = "ProductName";
        oCol3.HeaderText = "Product Name";
        oCol3.Width = "225";

        Column oCol4 = new Column();
        oCol4.DataField = "UnitPrice";
        oCol4.HeaderText = "Unit Price";
        oCol4.Width = "150";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        	
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
        
	}

    // Create the methods that will load the data into the templates
    //------------------------------------------------------------------------
    public void CreateCheckTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindCheckTemplate);
    }
    protected void DataBindCheckTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"radio\"  name=\"radio\" id=\"rad_grid_" + oContainer.DataItem["ProductID"].ToString() + "\"/>";
    }
    //------------------------------------------------------------------------

    void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Products", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();
        /*OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Products");*/
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
		<script type="text/javascript">
			function onRecordSelect(arrSelectedRecords) {
				var sMessage;
				
				if ( 0 <grid1.SelectedRecords.length ) {
					var id = grid1.SelectedRecords[0].ProductID;

					var radio = document.getElementById( "rad_grid_" + id );
					radio.checked =  true;
				}
			
			}
			function resetRadio (){
				// populate the previously checked radio buttons
                var arrPageSelectedRecords = grid1.PageSelectedRecords;
                if ( 0<arrPageSelectedRecords.length ) {                    
                    var oCheckbox = document.getElementById("rad_grid_" + arrPageSelectedRecords[0].ProductID);
                    oCheckbox.checked = true;
                }
			}
		</script>
	</head>
	<body>	
		<form runat="server">	
				
		<br />
		<span class="tdText"><b>ASP.NET Grid - Select using Radio Buttons</b></span>
		<br /><br />	
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
							
		<br /><br /><br />
		
		<span class="tdText">
		    Use the radio buttons to select records from the Grid. 		   
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>
<script type="text/javascript">
var oldonload = window.onload;
if (typeof window.onload != 'function') {
    window.onload = resetRadio;
} else {
    window.onload = function() {
    if (oldonload) {
        oldonload();
    }
    resetRadio();
    }
}
</script>