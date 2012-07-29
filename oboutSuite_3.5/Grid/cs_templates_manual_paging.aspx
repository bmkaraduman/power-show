<%@ Page Language="C#" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
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
        grid1.AllowAddingRecords = false;
        grid1.PageSize = 7;
        grid1.AllowManualPaging = true;
        grid1.TemplateSettings.ManualPagingTemplateId = "tplManualPaging";
        grid1.ClientSideEvents.OnClientCallback = "updateCurrentPage";
        
        grid1.FolderStyle = "styles/premiere_blue";
        
		
		// creating the Template for Manual Paging
		//------------------------------------------------------------------------
        GridRuntimeTemplate ManualPagingTemplate = new GridRuntimeTemplate();
        ManualPagingTemplate.ID = "tplManualPaging";
        ManualPagingTemplate.Template = new Obout.Grid.RuntimeTemplate();
        ManualPagingTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateManualPagingTemplate);
		//------------------------------------------------------------------------


        grid1.Templates.Add(ManualPagingTemplate);
		
																						
		// creating the columns
		Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";        
        oCol2.HeaderText = "NAME";
        oCol2.Width = "225";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "175";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";        
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "150";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "150";

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
	}

    void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 350 * FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        /*OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Orders");*/
        OleDbDataReader myReader = myComm.ExecuteReader();


        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }	

	// Create the methods that will load the data into the templates
	//------------------------------------------------------------------------
	public void CreateManualPagingTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		PlaceHolder oPH1 = new PlaceHolder();	
		e.Container.Controls.Add(oPH1);		
		oPH1.DataBinding += new EventHandler(DataBindManualPagingTemplate);
	}
    protected void DataBindManualPagingTemplate(Object sender, EventArgs e)
	{
		PlaceHolder oPH1 = sender as PlaceHolder;
		Obout.Grid.TemplateContainer oContainer = oPH1.NamingContainer as Obout.Grid.TemplateContainer;
        
        DropDownList ddlManualPaging = new DropDownList();
        ddlManualPaging.ID = "ddlManualPaging";
        ddlManualPaging.Attributes["onchange"] = "grid1.changePage(this.value)";
        ddlManualPaging.Attributes["style"] = "width: 50px;";
        ddlManualPaging.Attributes["class"] = "ob_gEC";
        
        ddlManualPaging.Items.Add(new ListItem("1", "0"));
        ddlManualPaging.Items.Add(new ListItem("5", "4"));
        ddlManualPaging.Items.Add(new ListItem("10", "9"));
        ddlManualPaging.Items.Add(new ListItem("15", "14"));
        ddlManualPaging.Items.Add(new ListItem("20", "19"));
        ddlManualPaging.Items.Add(new ListItem("25", "24"));
        ddlManualPaging.Items.Add(new ListItem("30", "29"));
        ddlManualPaging.Items.Add(new ListItem("35", "34"));
        ddlManualPaging.Items.Add(new ListItem("40", "39"));
        ddlManualPaging.Items.Add(new ListItem("45", "44"));
        ddlManualPaging.Items.Add(new ListItem("50", "49"));

        oPH1.Controls.Add(ddlManualPaging);
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
		<script type="text/javascript">
		    function updateCurrentPage() {
		        var arrDropDowns = document.getElementsByTagName("SELECT");
		        for(var i=0; i<arrDropDowns.length; i++) {
		            if(arrDropDowns[i].id.indexOf("ddlManualPaging") != -1) {
		                arrDropDowns[i].value = grid1.getCurrentPageIndex();
		                break;
		            }
		        }		        
		    }
		</script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Templates for Manual Paging</b></span>
		<br /><br />			
					
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		
		<span class="tdText">
		    Set the <b>AllowManualPaging</b> property to <span class="option2">true</span> to enable the manual paging feature.<br />
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>