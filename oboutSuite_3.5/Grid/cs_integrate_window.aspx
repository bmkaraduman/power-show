<%@ Page Language="C#" Debug="true" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>

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
        grid1.AllowAddingRecords = true;
        grid1.ShowLoadingMessage = false;
		grid1.TemplateSettings.NewRecord_TemplateId = "tplAddBtn";


        grid1.FolderStyle = "styles/style_7";

        // setting the event handlers
		grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
		grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
		grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
		grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);
				
		
		// creating the Template for Edit Button
		//------------------------------------------------------------------------
        GridRuntimeTemplate EditButtonTemplate = new GridRuntimeTemplate();
        EditButtonTemplate.ID = "tplEditBtn";
        EditButtonTemplate.Template = new Obout.Grid.RuntimeTemplate();
        EditButtonTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditButtonTemplate);
		//------------------------------------------------------------------------

		// creating the Template for Edit Button
		//------------------------------------------------------------------------
        GridRuntimeTemplate AddButtonTemplate = new GridRuntimeTemplate();
        AddButtonTemplate.ID = "tplAddBtn";
        AddButtonTemplate.Template = new Obout.Grid.RuntimeTemplate();
        AddButtonTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateAddButtonTemplate);
		//------------------------------------------------------------------------


        grid1.Templates.Add(EditButtonTemplate);
        grid1.Templates.Add(AddButtonTemplate);		
																						
		// creating the columns
		Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
        oCol1.Visible = false;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "150";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";        
        oCol2.Visible = true;
        oCol2.HeaderText = "NAME";
        oCol2.Width = "125";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipAddress";        
        oCol3.Visible = false;
        oCol3.HeaderText = "ADDRESS";
        oCol3.Width = "125";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipCity";        
        oCol4.Visible = true;
        oCol4.HeaderText = "CITY";
        oCol4.Width = "200";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipRegion";
        oCol5.Visible = false;
        oCol5.HeaderText = "REGION";
        oCol5.Width = "200";
        
        Column oCol6 = new Column();
        oCol6.DataField = "ShipPostalCode";
        oCol6.Visible = true;
        oCol6.HeaderText = "POSTAL CODE";
        oCol6.Width = "150";

        Column oCol7 = new Column();
        oCol7.DataField = "ShipCountry";
        oCol7.Visible = true;
        oCol7.HeaderText = "COUNTRY";
        oCol7.Width = "175";

        Column oCol8 = new Column();
        oCol8.DataField = "OrderDateFormatted";
        oCol8.Visible = true;
        oCol8.HeaderText = "ORDER DATE";
        oCol8.Width = "175";

        Column oCol9 = new Column();
        oCol9.DataField = "RequiredDateFormatted";
        oCol9.Visible = false;
        oCol9.HeaderText = "REQUIRED DATE";
        oCol9.Width = "200";

        Column oCol10 = new Column();
        oCol10.DataField = "ShippedDateFormatted";
        oCol10.Visible = false;
        oCol10.HeaderText = "SHIPPED DATE";
        oCol10.Width = "200";

        Column oCol11 = new Column();
        oCol11.DataField = "ShipVia";
        oCol11.Visible = false;
        oCol11.HeaderText = "SHIP VIA";
        oCol11.Width = "200";

        Column oCol12 = new Column();
        oCol12.DataField = "Sent";
        oCol12.Visible = false;
        oCol12.HeaderText = "SENT";
        oCol12.Width = "175";

        Column oCol13 = new Column();
        oCol13.DataField = "AdditionalInformation";
        oCol13.Visible = false;
        oCol13.HeaderText = "ADDITIONAL INFORMATION";
        oCol13.Width = "200";

        Column oCol14= new Column();
        oCol14.DataField = "";
        oCol14.Visible = true;
        oCol14.HeaderText = "EDIT";
        oCol14.Width = "60";
        oCol14.AllowEdit = true;
        oCol14.AllowDelete = true;
        oCol14.TemplateSettings.TemplateId = "tplEditBtn";
		

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
        grid1.Columns.Add(oCol14);

		// add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1);
		
		if (!Page.IsPostBack)
		{
			BindGrid();			
		}			
	}

	// Create the methods that will load the data into the templates
	//------------------------------------------------------------------------
    public void CreateEditButtonTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindEditButtonTemplate);
	}
    protected void DataBindEditButtonTemplate(Object sender, EventArgs e)
	{
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;
        
        oLiteral.Text = "<a href=\"javascript: //\" id=\"grid_link_" + oContainer.PageRecordIndex.ToString() + "\" onclick=\"attachWindowToLink(this)\" class=\"ob_gAL\">Edit</a>";
	}

    
	//------------------------------------------------------------------------

	// Create the methods that will load the data into the templates
	//------------------------------------------------------------------------
    public void CreateAddButtonTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindAddButtonTemplate);
	}
    protected void DataBindAddButtonTemplate(Object sender, EventArgs e)
	{
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;
        
        oLiteral.Text = "<a href=\"javascript: //\" id=\"btAdd\" onclick=\"cleanAddForm(); addPanel.Open();\" class=\"ob_gAL\">Add New</a>";
	}

    
	//------------------------------------------------------------------------

    void BindGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateFormatted, FORMAT(RequiredDate, \"mm/dd/yyyy\") AS RequiredDateFormatted, FORMAT(ShippedDate, \"mm/dd/yyyy\") AS ShippedDateFormatted FROM Orders", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }
    void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }


    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, Sent = @Sent, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDate"];
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = e.Record["RequiredDate"];
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = e.Record["ShippedDate"];
        myComm.Parameters.Add("@ShipVia", OleDbType.Integer).Value = e.Record["ShipVia"];        
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, Sent, OrderDate, RequiredDate, ShippedDate, ShipVia) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, @Sent, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDate"];
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = e.Record["RequiredDate"];
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = e.Record["ShippedDate"];
        myComm.Parameters.Add("@ShipVia", OleDbType.Integer).Value = e.Record["ShipVia"];        

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

	void RebindGrid(object sender, EventArgs e)
	{
		BindGrid();
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
			
			.rowEditTable {
			    background-color: #EEEEEE;
		        border: 1px solid #000000;
			}
			
			.rowEditTable td {
			    font-family: Verdana;
		        font-size: 10px;
		        color: #000000;		        
			}
		</style>
		<script type="text/javascript">
		    function attachWindowToLink(oLink) {	
		        try {	        	                
		            
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));		            
		            
		            editPanel.Open();
                } catch(ex){ alert(ex);}
		    }
		    
		    function closeDialog() {
		        editPanel.Close();
		    }
		    
			function closeDialog2() {
		        addPanel.Close();
		    }

		    function populateEditControls(iRecordIndex) {		        
		        document.getElementById("txtOrderID").firstChild.nodeValue = grid1.Rows[iRecordIndex].Cells[0].Value;
		        document.getElementById("txtShipName").value = grid1.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("txtShipAddress").value = grid1.Rows[iRecordIndex].Cells[2].Value;
		        document.getElementById("txtShipCity").value = grid1.Rows[iRecordIndex].Cells[3].Value;
		        document.getElementById("txtShipRegion").value = grid1.Rows[iRecordIndex].Cells[4].Value;
		        document.getElementById("txtShipPostalCode").value = grid1.Rows[iRecordIndex].Cells[5].Value;
		        document.getElementById("<%=ddlCountries.ClientID%>").value = grid1.Rows[iRecordIndex].Cells[6].Value;		        
		        document.getElementById("txtOrderDate").value = grid1.Rows[iRecordIndex].Cells[7].Value;
		        document.getElementById("txtRequiredDate").value = grid1.Rows[iRecordIndex].Cells[8].Value;
		        document.getElementById("txtShippedDate").value = grid1.Rows[iRecordIndex].Cells[9].Value;
		        document.getElementById("txtShipVia").value = grid1.Rows[iRecordIndex].Cells[10].Value;	
		        document.getElementById("txtSent").checked = grid1.Rows[iRecordIndex].Cells[11].Value.toLowerCase() == "true" ? true : false;
		    }
		    
		    function saveChanges() {
		        var oRecord = new Object();
		        oRecord.OrderID = document.getElementById("txtOrderID").firstChild.nodeValue;
		        oRecord.ShipName = document.getElementById("txtShipName").value;
		        oRecord.ShipAddress = document.getElementById("txtShipAddress").value;
		        oRecord.ShipCity = document.getElementById("txtShipCity").value;
		        oRecord.ShipRegion = document.getElementById("txtShipRegion").value;
		        oRecord.ShipPostalCode = document.getElementById("txtShipPostalCode").value;
		        oRecord.ShipCountry = document.getElementById("<%=ddlCountries.ClientID%>").value;
		        oRecord.OrderDate = document.getElementById("txtOrderDate").value;
		        oRecord.RequiredDate = document.getElementById("txtRequiredDate").value;
		        oRecord.ShippedDate = document.getElementById("txtShippedDate").value;
		        oRecord.ShipVia = document.getElementById("txtShipVia").value;
		        oRecord.Sent = document.getElementById("txtSent").checked;
		        
		        grid1.executeUpdate(oRecord);
		    }
			function saveChanges2() {
		        var oRecord = new Object();
		        oRecord.OrderID = document.getElementById("txtOrderID2").value;
		        oRecord.ShipName = document.getElementById("txtShipName2").value;
		        oRecord.ShipAddress = document.getElementById("txtShipAddress2").value;
		        oRecord.ShipCity = document.getElementById("txtShipCity2").value;
		        oRecord.ShipRegion = document.getElementById("txtShipRegion2").value;
		        oRecord.ShipPostalCode = document.getElementById("txtShipPostalCode2").value;
		        oRecord.ShipCountry = document.getElementById("<%=ddlCountries2.ClientID%>").value;
		        oRecord.OrderDate = document.getElementById("txtOrderDate2").value;
		        oRecord.RequiredDate = document.getElementById("txtRequiredDate2").value;
		        oRecord.ShippedDate = document.getElementById("txtShippedDate2").value;
		        oRecord.ShipVia = document.getElementById("txtShipVia2").value;
		        oRecord.Sent = document.getElementById("txtSent2").checked;
		        
		        grid1.executeInsert(oRecord);
		    }

			function cleanAddForm() {		        
		        document.getElementById("txtOrderID2").value = "";
		        document.getElementById("txtShipName2").value = "";
		        document.getElementById("txtShipAddress2").value = "";
		        document.getElementById("txtShipCity2").value = "";
		        document.getElementById("txtShipRegion2").value = "";
		        document.getElementById("txtShipPostalCode2").value = "";
		        document.getElementById("<%=ddlCountries2.ClientID%>").value = "";     
		        document.getElementById("txtOrderDate2").value = "";
		        document.getElementById("txtRequiredDate2").value = "";
		        document.getElementById("txtShippedDate2").value = "";
		        document.getElementById("txtShipVia2").value = "";
		        document.getElementById("txtSent2").checked = false;
		    }			
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Using the Window control to Add/Edit Records</b></span>
		
		<br /><br />			
					
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

            <owd:Dialog runat="server" ID="editPanel" Height="246" Width="637" IsModal="true" zIndex="10" Title="Edit Panel" StyleFolder="../window/wdstyles/default">
		    <table class="rowEditTable">
                <tr>
                    <td valign="top">
                        <fieldset style="width: 275px; height: 175px;">
                            <legend>Ship Information</legend>
                            <table>					                                            
                                <tr>
                                    <td>Ship Name:</td><td><input type="text" id="txtShipName" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>Ship Address:</td><td><input type="text" id="txtShipAddress" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>Ship City:</td><td><input type="text" id="txtShipCity" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>Ship Region:</td><td><input type="text" id="txtShipRegion" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>Ship Postal Code:</td><td><input type="text" id="txtShipPostalCode" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>Ship Country:</td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlCountries" CssClass="ob_gEC" Width="150">
                                            <asp:ListItem Value="Argentina">Argentina</asp:ListItem>
                                            <asp:ListItem Value="Austria">Austria</asp:ListItem>
                                            <asp:ListItem Value="Brazil">Brazil</asp:ListItem>
                                            <asp:ListItem Value="Denmark">Denmark</asp:ListItem>
                                            <asp:ListItem Value="France">France</asp:ListItem>
                                            <asp:ListItem Value="Germany">Germany</asp:ListItem>
                                            <asp:ListItem Value="Ireland">Ireland</asp:ListItem>
                                            <asp:ListItem Value="Italy">Italy</asp:ListItem>
                                            <asp:ListItem Value="Mexico">Mexico</asp:ListItem>
                                            <asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
                                            <asp:ListItem Value="UK">UK</asp:ListItem>                                           
                                            <asp:ListItem Value="USA">USA</asp:ListItem>
                                            <asp:ListItem Value="Venezuela">Venezuela</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>					                                            
                                <tr>
                                    <td colspan="2">
                                        <br />
                                        
                                    </td>
                                </tr>
                            </table>
                         </fieldset>
                     </td>
                     <td valign="top">
                        <fieldset style="width: 300px; height: 175px;">
                            <legend>Order Information</legend>
                            <table>
                                <tr>
                                    <td>Order ID:</td><td><span id="txtOrderID" style="width: 150px;">&#160;</span></td>
                                </tr>					                                            					                                            
                                <tr>
                                    <td>Order Date:</td>
                                    <td valign="middle">
                                        <input type="text" id="txtOrderDate" style="width: 150px;" class="ob_gEC" />					                                                    
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td>Required Date:</td>
                                    <td valign="middle">
                                        <input type="text" id="txtRequiredDate" style="width: 150px;" class="ob_gEC" />
                                    </td>                                    
                                </tr>	
                                <tr>
                                    <td>Shipped Date:</td>
                                    <td>
                                        <input type="text" id="txtShippedDate" style="width: 150px;" class="ob_gEC" />
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td>Ship Via:</td><td><input type="text" id="txtShipVia" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>				                                            
                                <tr>
                                    <td>Sent:</td><td><input type="checkbox" id="txtSent" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <br />			                                        
                                    </td>
                                </tr>
                            </table>
                         </fieldset>
                     </td>
                     
                 </tr>
                 <tr>
                    <td colspan="3" align="center">
                        <input type="button" value="Save" onclick="saveChanges();closeDialog()" class="tdText" />
                        <input type="button" value="Cancel" onclick="closeDialog()" class="tdText" /> 
                    </td>
                 </tr>
             </table>	
            </owd:Dialog>

			<owd:Dialog runat="server" ID="addPanel" Height="246" Width="637" IsModal="true" zIndex="10" Title="Edit Panel" StyleFolder="../window/wdstyles/default">
				<center>
		  		    <table class="rowEditTable">
						<tr>
							<td valign="top">
								<fieldset style="width: 275px; height: 175px;">
									<legend>Ship Information</legend>
									<table>					                                            
										<tr>
											<td>Ship Name:</td><td><input type="text" id="txtShipName2" style="width: 150px;" class="ob_gEC" /></td>
										</tr>
										<tr>
											<td>Ship Address:</td><td><input type="text" id="txtShipAddress2" style="width: 150px;" class="ob_gEC" /></td>
										</tr>
										<tr>
											<td>Ship City:</td><td><input type="text" id="txtShipCity2" style="width: 150px;" class="ob_gEC" /></td>
										</tr>
										<tr>
											<td>Ship Region:</td><td><input type="text" id="txtShipRegion2" style="width: 150px;" class="ob_gEC" /></td>
										</tr>
										<tr>
											<td>Ship Postal Code:</td><td><input type="text" id="txtShipPostalCode2" style="width: 150px;" class="ob_gEC" /></td>
										</tr>
										<tr>
											<td>Ship Country:</td>
											<td>
												<asp:DropDownList runat="server" ID="ddlCountries2" CssClass="ob_gEC" Width="150">
													<asp:ListItem Value="Argentina">Argentina</asp:ListItem>
													<asp:ListItem Value="Austria">Austria</asp:ListItem>
													<asp:ListItem Value="Brazil">Brazil</asp:ListItem>
													<asp:ListItem Value="Denmark">Denmark</asp:ListItem>
													<asp:ListItem Value="France">France</asp:ListItem>
													<asp:ListItem Value="Germany">Germany</asp:ListItem>
													<asp:ListItem Value="Ireland">Ireland</asp:ListItem>
													<asp:ListItem Value="Italy">Italy</asp:ListItem>
													<asp:ListItem Value="Mexico">Mexico</asp:ListItem>
													<asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
													<asp:ListItem Value="UK">UK</asp:ListItem>                                           
													<asp:ListItem Value="USA">USA</asp:ListItem>
													<asp:ListItem Value="Venezuela">Venezuela</asp:ListItem>
												</asp:DropDownList>
											</td>
										</tr>					                                            
										<tr>
											<td colspan="2">
												<br />
												
											</td>
										</tr>
									</table>
								 </fieldset>
							 </td>
							 <td valign="top">
								<fieldset style="width: 300px; height: 175px;">
									<legend>Order Information</legend>
									<table>
										<tr>
											<td>Order ID:</td><td><input type="text" id="txtOrderID2" style="width: 150px;" class="ob_gEC" /></td>
										</tr>					                                            					                                            
										<tr>
											<td>Order Date:</td>
											<td valign="middle">
												<input type="text" id="txtOrderDate2" style="width: 150px;" class="ob_gEC" />					                                                    
											</td>                                    
										</tr>
										<tr>
											<td>Required Date:</td>
											<td valign="middle">
												<input type="text" id="txtRequiredDate2" style="width: 150px;" class="ob_gEC" />
											</td>                                    
										</tr>	
										<tr>
											<td>Shipped Date:</td>
											<td>
												<input type="text" id="txtShippedDate2" style="width: 150px;" class="ob_gEC" />
											</td>                                    
										</tr>
										<tr>
											<td>Ship Via:</td><td><input type="text" id="txtShipVia2" style="width: 150px;" class="ob_gEC" /></td>
										</tr>				                                            
										<tr>
											<td>Sent:</td><td><input type="checkbox" id="txtSent2" /></td>
										</tr>
										<tr>
											<td colspan="2">
												<br />			                                        
											</td>
										</tr>
									</table>
								 </fieldset>
							 </td>
							 
						 </tr>
						 <tr>
							<td colspan="3" align="center">
								<input type="button" value="Save" onclick="saveChanges2();closeDialog2()" class="tdText" />
								<input type="button" value="Cancel" onclick="closeDialog2()" class="tdText" /> 
							</td>
						 </tr>
					 </table>	
				 </center>
            </owd:Dialog>

	<br>
	The Window control may be used to display custom forms for editing the records of the Grid.

		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>