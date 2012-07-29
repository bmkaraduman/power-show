<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)		
	{		
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
	
	void CreateGrid()
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
		CreateGrid();
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
			
			.rowEditTableContainer
			{
			    position: relative;
			    background-color: #EEEEEE;
			    z-index: 30;
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
		    function attachFlyoutToLink(oLink) {	
		        try {	        	                
		            <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
		            
		            closeFlyout2();
		            <%=Flyout1.getClientID()%>.Open();
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
                } catch(ex){}
		    }
		    
		    function attachFlyoutToLink2(oLink) {	
		        try {	        	                
		            <%=Flyout2.getClientID()%>.AttachTo(oLink.id);		            		            
		            
		            closeFlyout();
		            clearForm2();
		            <%=Flyout2.getClientID()%>.Open();
                } catch(ex){
					alert(ex);
				}
		    }
		    
		    function closeFlyout() {
		        <%=Flyout1.getClientID()%>.Close();
		    }
		    
		    function closeFlyout2() {
		        <%=Flyout2.getClientID()%>.Close();
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
		    
            function clearForm2() {
		        document.getElementById("txtShipName2").value = "";
		        document.getElementById("txtShipAddress2").value = "";
		        document.getElementById("txtShipCity2").value = "";
		        document.getElementById("txtShipRegion2").value = "";
		        document.getElementById("txtShipPostalCode2").value = "";
		        document.getElementById("<%=ddlCountries2.ClientID%>").value = "Argentina";
		        document.getElementById("txtOrderDate2").value = "";
		        document.getElementById("txtRequiredDate2").value = "";
		        document.getElementById("txtShippedDate2").value = "";
		        document.getElementById("txtShipVia2").value = "";
		        document.getElementById("txtSent2").checked = "";
		        
		    }
		</script>		
	</head>
	<body>
		<form runat="server">
					
		<br /><br />
		
		<span class="tdText"><b>ASP.NET Grid - Using the Flyout control and Custom Forms to Add/Edit Records</b></span>
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true"
			AutoGenerateColumns="false" FolderStyle="styles/grand_gray" AllowAddingRecords="true" ShowLoadingMessage="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<TemplateSettings NewRecord_TemplateId="tplAddBtn" />
			<Columns>
				<obout:Column DataField="OrderID" Visible="false" Width="150" ReadOnly="true" HeaderText="ORDER ID" runat="server" />
                <obout:Column DataField="ShipName" Width="175" HeaderText="NAME" runat="server" />
                <obout:Column DataField="ShipAddress" Visible="false" Width="125" HeaderText="NAME" runat="server" />
                <obout:Column DataField="ShipCity" Width="150" HeaderText="CITY" runat="server" />
                <obout:Column DataField="ShipRegion" Visible="false" Width="200" HeaderText="CITY" runat="server" />
                <obout:Column DataField="ShipPostalCode" Wrap="false" HeaderAlign="left" Width="150" HeaderText="POSTAL CODE" runat="server" />
                <obout:Column DataField="ShipCountry" AllowFilter="true" Visible="true" Width="175" Wrap="false" HeaderText="COUNTRY" runat="server" />
                <obout:Column DataField="OrderDateFormatted" Wrap="false" Width="175" HeaderText="ORDER DATE" runat="server" />
                <obout:Column DataField="RequiredDateFormatted" Visible="false" Width="200" HeaderText="" runat="server" />
                <obout:Column DataField="ShippedDateFormatted" Visible="false" Width="200" HeaderText="" runat="server" />
                <obout:Column DataField="ShipVia" Visible="false" Width="200" HeaderText="SHIP VIA" runat="server" />
                <obout:Column DataField="Sent" Visible="false" Width="175" HeaderText="SENT" runat="server" />
                <obout:Column DataField="AdditionalInformation" Visible="false" Width="200" HeaderText="ADDITIONAL INFORMATION" runat="server" />
                <obout:Column HeaderText="EDIT" Width="200" AllowEdit="true" AllowDelete="true" runat="server">
                    <TemplateSettings TemplateId="tplEditBtn" />
                </obout:Column>
			</Columns>
			<Templates>
			    <obout:GridTemplate runat="server" ID="tplEditBtn">
			        <Template>
			            <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this)" class="ob_gAL">Edit</a>
			        </Template>
			    </obout:GridTemplate>
			    <obout:GridTemplate runat="server" ID="tplAddBtn">
			        <Template>
			            <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink2(this)" class="ob_gAL">Add New</a>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
		<obout:Flyout runat="server" ID="Flyout1" Align="RIGHT" zIndex="20" Position="BOTTOM_LEFT" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
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
                        <input type="button" value="Save" onclick="saveChanges();closeFlyout()" class="tdText" />
                        <input type="button" value="Cancel" onclick="closeFlyout()" class="tdText" /> 
                    </td>
                 </tr>
             </table>
        </obout:Flyout>
        
        <obout:Flyout runat="server" ID="Flyout2" AttachTo="btAdd" zIndex="20" Align="LEFT" Position="ABSOLUTE" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500" RelativeLeft="-200" RelativeTop="-200">
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
                        <input type="button" value="Save" onclick="saveChanges2();closeFlyout2()" class="tdText" />
                        <input type="button" value="Cancel" onclick="closeFlyout2()" class="tdText" /> 
                    </td>
                 </tr>
             </table>
        </obout:Flyout>	
		
		<br /><br /><br />
		
		<span class="tdText">
		    The Flyout control may be used to display custom forms for editing the records of the Grid.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


