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
		grid1.Serialize = false;
		grid1.AutoGenerateColumns = false;		
		grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowFiltering = true;
        grid1.AllowAddingRecords = false;

		// setting the event handlers
		grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
		grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
		grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);


        // creating the template for the Company name column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateAddInfo = new GridRuntimeTemplate();
        TemplateAddInfo.ID = "TemplateAddInfo";
        TemplateAddInfo.Template = new Obout.Grid.RuntimeTemplate();
        TemplateAddInfo.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateAddInfoTemplate);
        //------------------------------------------------------------------------


        grid1.Templates.Add(TemplateAddInfo);
        	
		
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "200";
		
		Column oCol2 = new Column();
		oCol2.DataField = "ShipName";
        oCol2.HeaderText = "ADDITIONAL INFO";
        oCol2.Width = "300";
        oCol2.TemplateSettings.TemplateId = "TemplateAddInfo";
		
		Column oCol3 = new Column();
		oCol3.DataField = "ShipCity";		
		oCol3.HeaderText = "CITY";
        oCol3.Width = "250";				
											
		Column oCol4 = new Column();
        oCol4.DataField = "ShipCountry";
        oCol4.HeaderText = "COUNTRY";
        oCol4.Width = "250";		

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);

        ObjectDataSource ods1 = new ObjectDataSource();
        ods1.ID = "ods1";
        ods1.SelectMethod = "GetGenericOrdersWithInfo";
        ods1.TypeName = "OrdersGenericData";
        phGrid1.Controls.Add(ods1);
		
		if (!Page.IsPostBack)
		{
            grid1.DataSourceID = "ods1";
		}		
	}

    // Create the methods that will load the data into the templates
    //------------------------------------------------------------------------
    public void CreateAddInfoTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindAddInfoTemplate);
    }
    protected void DataBindAddInfoTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        Order oOrder = (Order)oContainer.DataObject;

        oLiteral.Text = oOrder.OrderID.ToString();//((AdditionalInformation)oOrder.AdditionalInfo[0]).Text + " --- " + ((AdditionalInformation)oOrder.AdditionalInfo[1]).Text;
    }
    //------------------------------------------------------------------------
		
	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
		OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = " + e.Record["OrderID"].ToString(), myConn);
		myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
		OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName='" + e.Record["ShipName"].ToString().Replace("'", "''") + "', ShipCity='" + e.Record["ShipCity"].ToString().Replace("'", "''") + "', ShipCountry='" + e.Record["ShipCountry"].ToString().Replace("'", "''") + "' WHERE OrderID = " + e.Record["OrderID"].ToString(), myConn);
		myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
		OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipCountry) VALUES('" + e.Record["ShipName"].ToString().Replace("'", "''") + "', '" + e.Record["ShipCity"].ToString().Replace("'", "''") + "', '" + e.Record["ShipCountry"].ToString().Replace("'", "''") + "')", myConn);
		myComm.ExecuteNonQuery();
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
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Using Container.DataObject</b></span>
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />		
		
		<span class="tdText">
		    When the Grid is bounded to a collection of custom objects, you can use the <b>Container.DataObject</b> object<br />
		    to access the custom objects from the collection (and all their properties and complex properties)
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>