<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
    Grid grid1 = new Grid();
    Flyout Flyout1;
	void Page_load(object sender, EventArgs e)		
	{
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        
        grid1.FolderStyle = "styles/premiere_blue";
        grid1.AllowAddingRecords = false;
        grid1.AllowRecordSelection = false;
        grid1.AllowMultiRecordSelection = false;
        
      
        // creating the Templates
		
		// creating the template for the Company name column (view mode)
		//------------------------------------------------------------------------
		GridRuntimeTemplate TemplateCompanyName = new GridRuntimeTemplate();
		TemplateCompanyName.ID = "TemplateCompanyName";				 
		TemplateCompanyName.Template = new Obout.Grid.RuntimeTemplate();
		TemplateCompanyName.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCompanyTemplate);
		//------------------------------------------------------------------------

        grid1.Templates.Add(TemplateCompanyName);
       
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "SupplierID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ID";
        oCol1.Width = "60";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "350";       

        Column oCol3 = new Column();
        oCol3.DataField = "ContactName";
        oCol3.HeaderText = "CONTACT NAME";
        oCol3.Width = "175";
        oCol3.Visible = false;     

        Column oCol4 = new Column();
        oCol4.DataField = "ContactTitle";
        oCol4.HeaderText = "CONTACT TITLE";
        oCol4.Width = "175";
        oCol4.Visible = false;

        Column oCol5 = new Column();
        oCol5.DataField = "Address";
        oCol5.HeaderText = "ADDRESS";
        oCol5.Width = "175";
        oCol5.Visible = true;

        Column oCol6 = new Column();
        oCol6.DataField = "City";
        oCol6.HeaderText = "CITY";
        oCol6.Width = "175";
        oCol6.Visible = false;

        Column oCol7 = new Column();
        oCol7.DataField = "Region";
        oCol7.HeaderText = "REGION";
        oCol7.Width = "175";
        oCol7.Visible = false;

        Column oCol8 = new Column();
        oCol8.DataField = "PostalCode";
        oCol8.HeaderText = "POSTAL CODE";
        oCol8.Width = "175";
        oCol8.Visible = false;

        Column oCol9 = new Column();
        oCol9.DataField = "Country";
        oCol9.HeaderText = "COUNTRY";
        oCol9.Width = "115";
        oCol9.Visible = true;

        Column oCol10 = new Column();
        oCol10.DataField = "Phone";
        oCol10.HeaderText = "PHONE";
        oCol10.Width = "115";
        oCol10.Visible = false;

        Column oCol11 = new Column();
        oCol11.DataField = "Fax";
        oCol11.HeaderText = "FAX";
        oCol11.Width = "115";
        oCol11.Visible = false;

        Column oCol12 = new Column();
        oCol12.DataField = "HomePage";
        oCol12.HeaderText = "HOME PAGE";
        oCol12.Width = "175";
        oCol12.Visible = false;

        Column oCol13 = new Column();
        oCol13.DataField = "";
        oCol13.HeaderText = "INFO";
        oCol13.Width = "115";
        oCol13.TemplateSettings.TemplateId = "TemplateCompanyName";
        
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);
        grid1.Columns.Add(oCol7);
        grid1.Columns.Add(oCol8);
        grid1.Columns.Add(oCol9);
        grid1.Columns.Add(oCol10);
        grid1.Columns.Add(oCol11);
        grid1.Columns.Add(oCol12);
        grid1.Columns.Add(oCol13);
                
        Flyout1 = new Flyout();
        Flyout1.ID = "Flyout1";
        Flyout1.Align = AlignStyle.LEFT;
        Flyout1.Position = PositionStyle.BOTTOM_LEFT;
        Flyout1.OpenEvent = OpenEvents.NONE;
        Flyout1.CloseEvent = CloseEvents.NONE;
        Flyout1.zIndex = 100;

        Literal oLiteral = new Literal();
        oLiteral.Text = "<div id=\"divFlyoutContent\" style=\"width: 250px; height: 250px; background-color: #EEEEEE; border: 1px solid #000000;\" class=\"tdText\">test</div>";

        Flyout1.Controls.Add(oLiteral);
        
        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        phGrid1.Controls.Add(Flyout1);
        
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
        
	}
	
    // Create the methods that will load the data into the templates
	//------------------------------------------------------------------------
	public void CreateCompanyTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();	
		e.Container.Controls.Add(oLiteral);		
		oLiteral.DataBinding += new EventHandler(DataBindCompanyTemplate);
	}
	protected void DataBindCompanyTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<span class=\"tdTextLink\" id=\"grid_link_" + oContainer.DataItem["SupplierID"].ToString() + "\" onmouseover=\"attachFlyoutToLink(this, " + oContainer.PageRecordIndex.ToString() + ")\" onmouseout=\"closeFlyout()\">More info...</span>";
	}
	//------------------------------------------------------------------------

    
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
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
				background-color___:#f6f9fc;
				padding-left:4px;
				padding-right:4px;
			}
			.tdTextLink {
			    font:11px Verdana;
				color:#315686;
				text-decoration:underline;
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
		    function attachFlyoutToLink(oLink, index) {	
		        try {	        	        
		            <%=Flyout1.getClientID()%>.Close();        
		            <%=Flyout1.getClientID()%>.AttachTo(oLink.id);
		            var sNewHtml = getRecordInfo(oLink, index);
		            document.getElementById("divFlyoutContent").innerHTML = sNewHtml;
		            <%=Flyout1.getClientID()%>.Open();
                } catch(ex){}
		    }
		    
		    function closeFlyout() {
		        try {
		            <%=Flyout1.getClientID()%>.Close();
		        } catch(ex) {};
		    }
		    
		    function getRecordInfo(oLink, iIndex) {
		        
		        var sSupplierID = grid1.Rows[iIndex].Cells[0].Value;
		        var sCompanyName = grid1.Rows[iIndex].Cells[1].Value;
		        var sContactName = grid1.Rows[iIndex].Cells[2].Value;
		        var sContactTitle = grid1.Rows[iIndex].Cells[3].Value;
		        var sAddress = grid1.Rows[iIndex].Cells[4].Value;
		        var sCity = grid1.Rows[iIndex].Cells[5].Value;
		        var sRegion = grid1.Rows[iIndex].Cells[6].Value;
		        var sPostalCode = grid1.Rows[iIndex].Cells[7].Value;
		        var sCountry = grid1.Rows[iIndex].Cells[8].Value;
		        var sPhone = grid1.Rows[iIndex].Cells[9].Value;
		        var sFax = grid1.Rows[iIndex].Cells[10].Value;
		        var sHomePage = grid1.Rows[iIndex].Cells[11].Value;
		        
		        if(sHomePage == "true") {
		            sHomePage = "yes";
		        } else {
		            sHomePage = "no";
		        }
		    
		        var sNewHtml = "<table>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>SUPPLIER ID:</b></td><td class='tdText'>" + sSupplierID + "</td></tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>COMPANY NAME:</b></td><td class='tdText'>" + sCompanyName + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>CONTACT NAME:</b></td><td class='tdText'>" + sContactName + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>CONTACT TITLE:</b></td><td class='tdText'>" + sContactTitle + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>ADDRESS:</b></td><td class='tdText'>" + sAddress + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>CITY:</b></td><td class='tdText'>" + sCity + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>REGION:</b></td><td class='tdText'>" + sRegion + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>POSTAL CODE:</b></td><td class='tdText'>" + sPostalCode + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>COUNTRY:</b></td><td class='tdText'>" + sCountry + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>PHONE:</b></td><td class='tdText'>" + sPhone + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>FAX:</b></td><td class='tdText'>" + sFax + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>HAS WEBSITE:</b></td><td class='tdText'>" + sHomePage + "</tr>";
		        sNewHtml += "</table>";
		        
		        return sNewHtml;
		    }
        </script>			
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Flyout inside the Grid</b></span>
		<br /><br />			
		
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>                		

		<br /><br /><br />
		
		<span class="tdText">
		    Using Templates you can use also the Flyout control inside the Grid.
		</span>


		<br /><br /><br />
		<a href="Default.aspx?type=CSHARP" ID="test_link">« Back to examples</a>
		
		</form>
	</body>
</html>