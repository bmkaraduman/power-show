<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)		
	{
        OboutInc.Calendar2.Calendar orderDateCalendar = grid1.Templates[0].Container.FindControl("gridCal1") as OboutInc.Calendar2.Calendar;
        OboutInc.Calendar2.Calendar requiredDateCalendar = grid1.Templates[0].Container.FindControl("gridCal2") as OboutInc.Calendar2.Calendar;
        OboutInc.Calendar2.Calendar shippedDateCalendar = grid1.Templates[0].Container.FindControl("gridCal3") as OboutInc.Calendar2.Calendar;

        OboutTextBox txtOrderDate = grid1.Templates[0].Container.FindControl("txtOrderDate") as OboutTextBox;
        OboutTextBox txtRequiredDate = grid1.Templates[0].Container.FindControl("txtRequiredDate") as OboutTextBox;
        OboutTextBox txtShippedDate = grid1.Templates[0].Container.FindControl("txtShippedDate") as OboutTextBox;

        orderDateCalendar.TextBoxId = txtOrderDate.ClientID;
        requiredDateCalendar.TextBoxId = txtRequiredDate.ClientID;
        shippedDateCalendar.TextBoxId = txtShippedDate.ClientID;
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, Sent = @Sent, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia, AdditionalInformation=@AdditionalInformation WHERE OrderID = @OrderID", myConn);

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
        myComm.Parameters.Add("@AdditionalInformation", OleDbType.VarChar).Value = e.Record["AdditionalInformation"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, Sent, OrderDate, RequiredDate, ShippedDate, ShipVia, AdditionalInformation) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, @Sent, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @AdditionalInformation)", myConn);

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
        myComm.Parameters.Add("@AdditionalInformation", OleDbType.VarChar).Value = e.Record["AdditionalInformation"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }


        
    void DeleteDetailRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM [Order Details] WHERE OrderID = @OrderID AND ProductID = @ProductID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record["ProductID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void UpdateDetailRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE [Order Details] SET UnitPrice = @UnitPrice, Quantity=@Quantity, ProductID = @ProductID WHERE OrderID = @OrderID AND ProductID = @OldProductID", myConn);

        myComm.Parameters.Add("@UnitPrice", OleDbType.Double).Value = e.Record["UnitPrice"];
        myComm.Parameters.Add("@Quantity", OleDbType.Double).Value = e.Record["Quantity"];
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record["ProductID"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
        myComm.Parameters.Add("@OldProductID", OleDbType.Integer).Value = e.Record["OldProductID"];
        
        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void InsertDetailRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO [Order Details] (UnitPrice, Quantity, OrderID, ProductID) VALUES(@UnitPrice, @Quantity, @OrderID, @ProductID)", myConn);

        myComm.Parameters.Add("@UnitPrice", OleDbType.Double).Value = e.Record["UnitPrice"];
        myComm.Parameters.Add("@Quantity", OleDbType.Double).Value = e.Record["Quantity"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record["ProductID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
</script>		


<html>
	<head runat="server">
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
			
			.rowEditTable
			{
			    position: relative;
			}
			
			.rowEditTable td {
			    font-family: Verdana;
		        font-size: 10px;
		        color: #4B555E;
			}
		</style>		
		<script type"text/javascript">
		    function moveDetailsToMain(sender, record) {
		        document.getElementById('orderItemsContainer').appendChild(document.getElementById('detailsContainer'));

		        if (record.Sent == '') {
		            record.Sent = false;
		        }

		        return record;
		    }

		    function restoreDetailsOutsideMain() {
		        document.getElementById('details').appendChild(document.getElementById('detailsContainer'));
		    }
		
		    function grid1_OnAddEdit(sender, record) {
		        var HiddenOrderID = document.getElementById('HiddenOrderID');
		        if (record.OrderID) {
		            HiddenOrderID.value = record.OrderID;
		            document.getElementById('OrderItemsRow').style.display = '';
		        } else {
		            HiddenOrderID.value = 0;
		            document.getElementById('OrderItemsRow').style.display = 'none';
		        }

		        allowDetailAdding = false;
		        detailGrid.refresh();
		    }

		    function detailGrid_OnPopulateControls(sender, record) {
		        record.OrderID = document.getElementById('HiddenOrderID').value;

		        return record;
		    }

		    var allowDetailAdding = true;

		    function detailGrid_BeforeAdd(sender, record) {
		        return allowDetailAdding;
		    }

		    function detailGrid_Callback(sender) {
		        allowDetailAdding = true;
		    }
		</script>
	</head>
	<body>
		<form runat="server">
					
		<br /><br />
		
		<span class="tdText"><b>ASP.NET Grid - Using a Detail Grid inside a Row Edit Template</b></span>
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			AutoGenerateColumns="false" FolderStyle="" EnableRecordHover="true"
			DataSourceID="sdsOrders"
			OnInsertCommand="InsertRecord" OnUpdateCommand="UpdateRecord" OnDeleteCommand="DeleteRecord"
			>
			<ClientSideEvents OnClientEdit="grid1_OnAddEdit" OnClientAdd="grid1_OnAddEdit" ExposeSender="true"
			    OnClientPopulateControls="moveDetailsToMain"
			    OnBeforeClientUpdate="restoreDetailsOutsideMain" OnBeforeClientInsert="restoreDetailsOutsideMain" OnBeforeClientDelete="restoreDetailsOutsideMain"
			    OnBeforeClientCancelAdd="restoreDetailsOutsideMain" OnBeforeClientCancelEdit="restoreDetailsOutsideMain"
			    />
			<Columns>
				<obout:Column DataField="OrderID" Visible="false" Width="150" ReadOnly="true" HeaderText="ORDER ID" runat="server">
				    <TemplateSettings RowEditTemplateControlId="txtOrderID" RowEditTemplateControlPropertyName="innerHTML"/>
				</obout:Column>
                <obout:Column DataField="ShipName" Width="200" HeaderText="NAME" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipName" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipAddress" Visible="false" Width="125" HeaderText="ADDRESS" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipAddress" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipCity" Width="150" HeaderText="CITY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipCity" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipRegion" Visible="false" Width="150" HeaderText="REGION" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipRegion" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipPostalCode" Width="150" HeaderText="POSTAL CODE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipPostalCode" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipCountry" Visible="true" Width="150" Wrap="false" HeaderText="COUNTRY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="ddlCountries" RowEditTemplateControlPropertyName="value" />
                </obout:Column>                
                <obout:Column DataField="OrderDateFormatted" Width="150" HeaderText="ORDER DATE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtOrderDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="RequiredDateFormatted" Visible="false"  Width="200" HeaderText="REQUIRED DATE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtRequiredDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShippedDateFormatted" Visible="false" Width="200" HeaderText="SHIPPED DATE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShippedDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipVia" Visible="false" Width="200" HeaderText="SHIP VIA" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipVia" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column1" DataField="Sent" Visible="false" Width="175" HeaderText="SENT" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtSent" RowEditTemplateControlPropertyName="checked" RowEditTemplateUseQuotes="false" />
                </obout:Column>
                <obout:Column DataField="AdditionalInformation" Visible="false" Width="200" HeaderText="ADDITIONAL INFORMATION" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtAdditionalInformation" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column HeaderText="EDIT" Width="200" AllowEdit="true" AllowDelete="true" runat="server" />
			</Columns>
			<TemplateSettings RowEditTemplateId="tplRowEdit" />
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
                                                <td>Ship Name:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipName" Width="150" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Address:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipAddress" Width="150" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship City:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipCity" Width="150" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Region:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipRegion" Width="150" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Postal Code:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipPostalCode" Width="150" />
                                                 </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Country:</td>
                                                <td>
                                                    <obout:OboutDropDownList runat="server" ID="ddlCountries" Width="150" Height="200" MenuWidth="175"
                                                        DataSourceID="sdsCountries" DataTextField="ShipCountry" DataValueField="ShipCountry" />
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
                                                    <obout:OboutTextBox runat="server" ID="txtOrderDate" Width="150" />
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal1" runat="server" 
				                                        StyleFolder="../Calendar/styles/expedia" 
				                                        DatePickerMode="true"
				                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Required Date:</td>
                                                <td valign="middle">
                                                    <obout:OboutTextBox runat="server" ID="txtRequiredDate" Width="150" />
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal2" runat="server" 
				                                        StyleFolder="../Calendar/styles/expedia" 
				                                        DatePickerMode="true"
				                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>	
                                            <tr>
                                                <td>Shipped Date:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShippedDate" Width="150" />
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal3" runat="server" 
				                                        StyleFolder="../Calendar/styles/expedia" 
				                                        DatePickerMode="true"
				                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Via:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipVia" Width="150" />
                                                </td>
                                            </tr>				                                            
                                            <tr>
                                                <td>Sent:</td><td><obout:OboutCheckBox runat="server" ID="txtSent" /></td>
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
                                        <legend>Additional Information</legend>
                                        
                                        <obout:OboutTextBox runat="server" ID="txtAdditionalInformation" TextMode="MultiLine" Width="300px" Height="165px" />
                                    </fieldset>
                                 </td>
                             </tr>
                             <tr id="OrderItemsRow">
                                <td colspan="3">
                                    <fieldset style="width: 925px;">
                                        <legend>Order Items</legend>
                                        
                                        <div style="padding-left: 40px;" id="orderItemsContainer">
                                            
                                        </div>
                                    </fieldset>
                                </td>
                             </tr>
                             <tr>
                                <td colspan="3" align="center">                                    
                                    <br /><br />
                                    <obout:OboutButton runat="server" OnClientClick="grid1.save(); return false;" Text="Save" Width="75" />
                                    <obout:OboutButton runat="server" OnClientClick="grid1.cancel(); return false;" Text="Cancel" Width="75" />
                                </td>
                             </tr>
                         </table>					                         
                    </Template>
                </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
		
		<div id="details" style="visibility: hidden;height: 1px; overflow: hidden;position: relative;">
		    <div id="detailsContainer">
		        <obout:Grid runat="server" ID="detailGrid" AutoGenerateColumns="false" 
                    Serialize="false" DataSourceID="sdsOrderDetails"
                    OnInsertCommand="InsertDetailRecord" OnUpdateCommand="UpdateDetailRecord" OnDeleteCommand="DeleteDetailRecord">
                    <ClientSideEvents ExposeSender="true" OnClientPopulateControls="detailGrid_OnPopulateControls" OnBeforeClientAdd="detailGrid_BeforeAdd" OnClientCallback="detailGrid_Callback" />
                    <Columns>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false"></obout:Column>
                        <obout:Column DataField="OldProductID" ReadOnly="true" Visible="false" />
                        <obout:Column DataField="ProductID" HeaderText="PRODUCT NAME" Width="225">
                            <TemplateSettings TemplateId="ViewProductTemplate" EditTemplateId="EditProductTemplate" />
                        </obout:Column>
                        <obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="UnitPrice" HeaderText="UNIT PRICE" DataFormatString="{0:C2}" Width="150"></obout:Column>
                        <obout:Column DataField="Quantity" HeaderText="QUANTITY" Width="150"></obout:Column>
                        <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" ></obout:Column>
                    </Columns>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="ViewProductTemplate">
                            <Template>
                                <%# Container.DataItem["ProductName"] %>
                            </Template>
                        </obout:GridTemplate>
                        
                        <obout:GridTemplate runat="server" ID="EditProductTemplate" ControlID="DdlProductID">
                            <Template>
                                <obout:OboutDropDownList runat="server" ID="DdlProductID" Width="100%" MenuWidth="300" Height="200"
                                    DataSourceID="sdsProducts" DataValueField="ProductID" DataTextField="ProductName"
                                    />
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                </obout:Grid>
            </div>
        </div>
		
		<asp:HiddenField runat="server" ID="HiddenOrderID" />
		 
		<asp:SqlDataSource runat="server" ID="sdsOrders" 
		    SelectCommand="SELECT TOP 25 *, FORMAT(OrderDate, 'mm/dd/yyyy') AS OrderDateFormatted, FORMAT(RequiredDate, 'mm/dd/yyyy') AS RequiredDateFormatted, FORMAT(ShippedDate, 'mm/dd/yyyy') AS ShippedDateFormatted FROM Orders ORDER BY OrderID DESC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		</asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sdsOrderDetails" SelectCommand="SELECT OD.*, P.ProductName, P.ProductID AS OldProductID FROM [Order Details] OD INNER JOIN Products P ON OD.ProductID = P.ProductID WHERE OrderID = @OrderID"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:ControlParameter Name="OrderID" Type="Int32" ControlID="HiddenOrderID" PropertyName="Value" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sdsCountries" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sdsProducts" SelectCommand="SELECT DISTINCT ProductID, ProductName FROM Products ORDER BY ProductName ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<span class="tdText">
		    This example showcases the use of a detail grid inside a row edit template.<br />
		    You can manage the order items (add/edit/delete items) from within the row edit template.<br />
		    The detail grid is populated dynamically using AJAX based on the currently edited record.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


