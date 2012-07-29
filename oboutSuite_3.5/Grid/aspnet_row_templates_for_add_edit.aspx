<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
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

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateFormatted, FORMAT(RequiredDate, \"mm/dd/yyyy\") AS RequiredDateFormatted, FORMAT(ShippedDate, \"mm/dd/yyyy\") AS ShippedDateFormatted FROM Orders ORDER BY OrderID DESC", myConn);
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, Sent = @Sent, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia  WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDateFormatted"];
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = e.Record["RequiredDateFormatted"];
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = e.Record["ShippedDateFormatted"];
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
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDateFormatted"];
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = e.Record["RequiredDateFormatted"];
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = e.Record["ShippedDateFormatted"];
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
			.rowEditTable td {
			    font-family: Verdana;
		        font-size: 10px;
		        color: #4B555E;
			}
			.ob_cbContainer {
            background-color:#FFFFFF;
            border:1px solid #000000;
            overflow:auto;
            text-align:left;
            z-index:999;
		</style>		
	</head>
	<body>	
		<form runat="server">
		<script type="text/javascript">

			var preOnclick = null;

			function OnAdd(record) {
				document.getElementById("txtShipName").disabled = false; 
				document.getElementById("txtShipAddress").disabled = false; 
				document.getElementById("txtShipCity").disabled = false; 
				document.getElementById("txtShipRegion").disabled = false; 
				document.getElementById("txtShipPostalCode").disabled = false;
				gridCbo1.enable();

				
				return true;
			}

			function OnEdit( record ){
				document.getElementById("txtShipName").disabled = false; 
				document.getElementById("txtShipAddress").disabled = false; 
				document.getElementById("txtShipCity").disabled = false; 
				document.getElementById("txtShipRegion").disabled = true; 
				document.getElementById("txtShipPostalCode").disabled = true;
				gridCbo1.disable();

				return true;
			}
		</script>
		
		<br />
		<span class="tdText"><b>ASP.NET Grid - Different Row Fields for Add/Edit</b></span>
		<br /><br />	
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			AutoGenerateColumns="false" FolderStyle="styles/black_glass"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<ClientSideEvents OnClientAdd="OnAdd" OnClientEdit="OnEdit"/>
            <TemplateSettings RowEditTemplateId="tplRowEdit" />
			<Columns>
				<obout:Column DataField="OrderID" Visible="false" Width="150" ReadOnly="true" HeaderText="ORDER ID" runat="server">
				    <TemplateSettings RowEditTemplateControlId="txtOrderID" RowEditTemplateControlPropertyName="innerHTML"/>
				</obout:Column>
                <obout:Column DataField="ShipName" AllowGroupBy="true" Wrap="false" ShowFilterCriterias="true" ParseHTML="false" Align="left" HeaderAlign="left" Width="145" HeaderText="NAME" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipName" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipAddress" Visible="false" AllowGroupBy="true" Wrap="false" ShowFilterCriterias="true" ParseHTML="false" Align="left" HeaderAlign="left" Width="125" HeaderText="NAME" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipAddress" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipCity"  Visible="true" ShowFilterCriterias="true" HeaderAlign="left" ParseHTML="false" Align="left" Width="120" HeaderText="CITY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipCity" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipRegion"  Visible="false" ShowFilterCriterias="true" HeaderAlign="left" ParseHTML="false" Align="left" Width="110" HeaderText="REGION" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipRegion" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipPostalCode" Visible="true" Wrap="false" HeaderAlign="left" Width="120" HeaderText="POSTAL CODE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipPostalCode" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipCountry" AllowFilter="true" Visible="true" Width="125" Wrap="false" HeaderText="COUNTRY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="gridCbo1" RowEditTemplateControlPropertyName="value" />
                </obout:Column>                
                <obout:Column DataField="OrderDateFormatted" Visible="false" Wrap="false" Width="175" HeaderText="ORDER DATE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtOrderDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="RequiredDateFormatted" Visible="false" ShowFilterCriterias="true" HeaderAlign="left" ParseHTML="false" Align="left" Width="200" HeaderText="CITY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtRequiredDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShippedDateFormatted" Visible="false" ShowFilterCriterias="true" HeaderAlign="left" ParseHTML="false" Align="left" Width="200" HeaderText="CITY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShippedDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipVia" Visible="false" ShowFilterCriterias="true" HeaderAlign="left" ParseHTML="false" Align="left" Width="200" HeaderText="SHIP VIA" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipVia" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column1" DataField="Sent" AllowFilter="true" Visible="false" Width="175" Wrap="false" HeaderText="SENT" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtSent" RowEditTemplateControlPropertyName="checked" RowEditTemplateUseQuotes="false" />
                </obout:Column>
                <obout:Column HeaderText="EDIT" Width="150" AllowEdit="true" AllowDelete="true" runat="server" />
			</Columns>
			<Templates> 			    
			    <obout:GridTemplate runat="server" ID="tplRowEdit">
                    <Template>
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
	                                                <obout:ComboBox runat="server" ID="gridCbo1" Height="150" Width="100%" FolderStyle="../Combobox/styles/premiere_blue">
							                            <Items>
								                            <obout:ComboBoxItem ID="Option1" runat="server" Value="Australia" Text="Australia" />
								                            <obout:ComboBoxItem ID="Option2" runat="server" Value="Brazil" Text="Brazil" />
								                            <obout:ComboBoxItem ID="Option3" runat="server" Value="Canada" Text="Canada" />
								                            <obout:ComboBoxItem ID="Option4" runat="server" Value="Denmark" Text="Denmark" />
								                            <obout:ComboBoxItem ID="Option5" runat="server" Value="Finland" Text="Finland" />
								                            <obout:ComboBoxItem ID="Option6" runat="server" Value="France" Text="France" />
								                            <obout:ComboBoxItem ID="Option7" runat="server" Value="Germany" Text="Germany" />
								                            <obout:ComboBoxItem ID="Option8" runat="server" Value="Italy" Text="Italy" />
								                            <obout:ComboBoxItem ID="Option9" runat="server" Value="Japan" Text="Japan" />
								                            <obout:ComboBoxItem ID="Option10" runat="server" Value="Norway" Text="Norway" />
								                            <obout:ComboBoxItem ID="Option11" runat="server" Value="Singapore" Text="Singapore" />
								                            <obout:ComboBoxItem ID="Option12" runat="server" Value="Spain" Text="Spain" />
								                            <obout:ComboBoxItem ID="Option13" runat="server" Value="Sweden" Text="Sweden" />
								                            <obout:ComboBoxItem ID="Option14" runat="server" Value="UK" Text="UK" />
								                            <obout:ComboBoxItem ID="Option15" runat="server" Value="USA" Text="USA" />
							                            </Items>
						                            </obout:ComboBox>
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
                                                <td>Order ID:</td><td><span id="txtOrderID" style="width: 150px;"></span></td>
                                            </tr>					                                            					                                            
                                            <tr>
                                                <td>Order Date:</td>
                                                <td valign="middle">
                                                    <input type="text" id="txtOrderDate" style="width: 150px;" class="ob_gEC" />					                                                    
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal1" runat="server" 
				                                        StyleFolder="../Calendar/styles/expedia" 
				                                        DatePickerMode="true"
				                                        TextBoxId="txtOrderDate" 									      TextArrowLeft = ""
														TextArrowRight = ""                                      
                                  
				                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Required Date:</td>
                                                <td valign="middle">
                                                    <input type="text" id="txtRequiredDate" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal2" runat="server" 
				                                        StyleFolder="../Calendar/styles/expedia" 
				                                        DatePickerMode="true"
				                                        TextBoxId="txtRequiredDate" 									  TextArrowLeft = ""
														TextArrowRight = ""                                      
				                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>	
                                            <tr>
                                                <td>Shipped Date:</td>
                                                <td>
                                                    <input type="text" id="txtShippedDate" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal3" runat="server" 
				                                        StyleFolder="../Calendar/styles/expedia" 
				                                        DatePickerMode="true"
				                                        TextBoxId="txtShippedDate" 	
														TextArrowLeft = ""
														TextArrowRight = ""                                      

				                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
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
                                <td colspan="2" align="center">
                                    <input type="button" value="Save" onclick="grid1.save()" class="tdText" />
                                    <input type="button" value="Cancel" onclick="grid1.cancel()" class="tdText" /> 
                                </td>
                             </tr>
                         </table>					                         
                    </Template>
                </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		<br />
<br />
<span class="tdText">This example showcases the use of different edit field for  adding / editing using row templates.<br /><br />

    In add mode, ShipCity and ShipPostalCode are editable (enabled), but they are read only for edit mode (disabled).<br /> 
    This is achieved using the client-side events of the Grid ("OnClientAdd" and "OnClientEdit")
    along with <br />the "enable" / "disable" client-side methods of the OboutTextBox control.
</span>
		<br /><br /><br />
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>

		
