<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">	
	void Page_Load(object sender, EventArgs e)		
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
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
    }

    void InsertRecord(object sender, GridRecordEventArgs e)
    {
    }
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
	}			
	</script>		

<html>
<head>

</head>
<body>
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
    <form runat="server">
<script type="text/javascript">
	function OnDelete(record) {		
		alert("The order with ID " + record.OrderID + " (for " + record.ShipName + ") was deleted. In a real application, the database will be updated.");
	}
	function OnUpdate(record) {						
		alert("The order with ID " + record.OrderID + " (for " + record.ShipName + ") was modified. In a real application, the database will be updated.");		
	}
	function OnInsert(record) {		
		alert("A new order was created. In a real application, the database will be updated.");					
	}

</script>


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
		            
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));		            
		            
		            editPanel.Open();
                } catch(ex){}
		    }
		    
		    function closeDialog() {
		        editPanel.Close();
		    }
		    
		    function populateEditControls(iRecordIndex) {		        
		        document.getElementById("txtOrderID").firstChild.nodeValue = grid1.Rows[iRecordIndex].Cells[0].Value;
		        document.getElementById("txtShipName").value = grid1.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("txtShipAddress").value = grid1.Rows[iRecordIndex].Cells[2].Value;
		        document.getElementById("txtShipCity").value = grid1.Rows[iRecordIndex].Cells[3].Value;
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
		        oRecord.ShipCountry = document.getElementById("<%=ddlCountries.ClientID%>").value;
		        oRecord.OrderDate = document.getElementById("txtOrderDate").value;
		        oRecord.RequiredDate = document.getElementById("txtRequiredDate").value;
		        oRecord.ShippedDate = document.getElementById("txtShippedDate").value;
		        oRecord.ShipVia = document.getElementById("txtShipVia").value;
		        oRecord.Sent = document.getElementById("txtSent").checked;
		        
		        grid1.executeUpdate(oRecord);
		    }
		</script>		
		<br /><br />
		
		<span class="h3">ASP.NET Grid - Using Custom Forms (Row Templates) to Add/Edit Records</span>
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true"
			AutoGenerateColumns="false" FolderStyle="../Grid/styles/style_7" AllowAddingRecords="false" ShowLoadingMessage="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<ClientSideEvents OnClientDelete="OnDelete" OnClientUpdate="OnUpdate" OnClientInsert="OnInsert"/>

			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" Visible="false" Width="150" ReadOnly="true" HeaderText="ORDER ID" runat="server" />
                <obout:Column ID="Column2" DataField="ShipName" Width="175" HeaderText="NAME" runat="server" />
                <obout:Column ID="Column3" DataField="ShipAddress" Visible="false" Width="125" HeaderText="NAME" runat="server" />
                <obout:Column ID="Column4" DataField="ShipCity" Width="150" HeaderText="CITY" runat="server" />
                <obout:Column ID="Column5" DataField="ShipRegion" Visible="false" Width="200" HeaderText="CITY" runat="server" />
                <obout:Column ID="Column6" DataField="ShipPostalCode" Visible="false" Wrap="false" HeaderAlign="left" Width="150" HeaderText="POSTAL CODE" runat="server" />
                <obout:Column ID="Column7" DataField="ShipCountry" AllowFilter="true" Visible="true" Width="125" Wrap="false" HeaderText="COUNTRY" runat="server" />
                <obout:Column ID="Column8" DataField="OrderDateFormatted" Wrap="false" Width="125" HeaderText="ORDER DATE" runat="server" />
                <obout:Column ID="Column9" DataField="RequiredDateFormatted" Visible="false" Width="200" HeaderText="" runat="server" />
                <obout:Column ID="Column10" DataField="ShippedDateFormatted" Visible="false" Width="200" HeaderText="" runat="server" />
                <obout:Column ID="Column11" DataField="ShipVia" Visible="false" Width="200" HeaderText="SHIP VIA" runat="server" />
                <obout:Column ID="Column12" DataField="Sent" Visible="false" Width="175" HeaderText="SENT" runat="server" />
                <obout:Column ID="Column13" DataField="AdditionalInformation" Visible="false" Width="200" HeaderText="ADDITIONAL INFORMATION" runat="server" />
                <obout:Column ID="Column14" HeaderText="EDIT" Width="60" AllowEdit="true" AllowDelete="true" runat="server">
                    <TemplateSettings TemplateId="tplEditBtn" />
                </obout:Column>
			</Columns>
			<Templates>
			    <obout:GridTemplate runat="server" ID="tplEditBtn">
			        <Template>
			            <a href="#" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this); return false;" class="ob_gAL">Edit</a>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
            <owd:Dialog runat="server" ID="editPanel" Height="246" Width="637" IsModal="true" zIndex="10" Title="Edit Panel" StyleFolder="wdstyles/default">
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


		
		<br /><br /><br />
</form>
</body>
</html>





