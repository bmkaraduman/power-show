<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aspnet_ajax_populate_edit_fields.aspx.cs" Inherits="Grid_aspnet_ajax_populate_edit_fields" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
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
		
		.loading-image-container
        {
            position: absolute;
            z-index: 50; 
            top: 0px; 
            bottom: 0px; 
            left: -5px; 
            right: 5px; 
            width: auto; 
            height: auto;
            background-color: #EEEEEE;
            text-align: center;
            filter: alpha(opacity=60);
            -moz-opacity: 0.6;
            opacity: 0.6;
        }
        
        .loading-image
        {
            position: absolute;
            font-family: Verdana;
	        font-size: 10px;
	        color:#0C416F;
	        height: 10px;
	        top: 50%;	
	        bottom: 0px;
	        margin-top: -5px;	
	        left: 0px;
	        right: 0px;
	        margin-left: auto;
	        margin-right: auto;
	        text-align: center;
	        width: 100%;
        }         
    </style>
    <script type="text/javascript">
        var actionType = null;
        
        function onClientEdit(sender, record) {
        
            PageMethods.GetData(record.OrderID, onSucceededGetOrder, onFailedAction);
            var LoadingIndicator = document.getElementById('LoadingIndicator');
            LoadingIndicator.style.display = '';
        }

        function onSucceededGetOrder(order) {
            txtShipAddress.value(order.ShipAddress);
            txtShipRegion.value(order.ShipRegion);
            ddlCountries.value(order.ShipCountry);
            txtOrderDate.value(order.OrderDate);
            txtRequiredDate.value(order.RequiredDate);
            txtShippedDate.value(order.ShippedDate);
            txtShipVia.value(order.ShipVia);
            txtSent.checked(order.Sent);
            
            var LoadingIndicator = document.getElementById('LoadingIndicator');
            LoadingIndicator.style.display = 'none';
        }

        function onFailedAction() {
        }
        
        function blurButton(btnId) {
            var btn = eval(btnId);
            btn.blur();
        }
 
    
        function saveChanges(btnObj) {
            blurButton(btnObj);

            grid1.save();

            return false;
        }

        function cancelChanges(btnObj) {
            blurButton(btnObj);

            grid1.cancel();

            return false;
        }

        function onSaving(sender, record) {
          
            var order = new Object();
            
            order.OrderID = record.OrderID;
            order.ShipName = txtShipName.value();
            order.ShipAddress = txtShipAddress.value();
            order.ShipCity = txtShipCity.value();
            order.ShipRegion = txtShipRegion.value();
            order.ShipPostalCode = txtShipPostalCode.value();
            order.ShipCountry = ddlCountries.value();
            order.OrderDate = txtOrderDate.value();
            order.RequiredDate = txtRequiredDate.value();
            order.ShippedDate = txtShippedDate.value();
            order.ShipVia = txtShipVia.value() != '' ? txtShipVia.value() : 0;
            order.Sent = txtSent.checked(); 

            if (record.OrderID) {
                PageMethods.UpdateOrder(order, onSucceeded, onFailedAction);
            } else {
                PageMethods.InsertRecord(order, onSucceeded, onFailedAction);
            }
            
            return false;
        }


        function onDeleteing(sender, record) {
            if (record.OrderID != '') {
                if (confirm("Are you sure you want to delete this order?")) {
                    PageMethods.DeleteOrder(record.OrderID, onSucceeded, onFailedAction);
                }
            }

            return false;
        } 

        function onSucceeded() {
            grid1.refresh();
        }
        
        function onFailedAction(error) {
            alert(error.get_message());
        }

       function onAdding(sender, record) {            
            txtShipAddress.value('');
            txtShipRegion.value('');
            ddlCountries.selectedIndex(0);
            txtOrderDate.value('');
            txtRequiredDate.value('');
            txtShippedDate.value('');
            txtShipVia.value('');
            txtSent.checked(false); 
        }
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span class="tdText"><b>ASP.NET Grid - Populate edit fields with AJAX</b></span>
    
        <br /><br />
    
        <asp:ScriptManager ID="ScriptManager" runat="server"  EnablePageMethods="true" />
        
        <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false" DataSourceId="ods1" EmbedFilterInSortExpression="true"
            AllowColumnResizing="true" ShowHeader="true" PageSize="10" AllowPageSizeSelection="false"
            FolderStyle="styles/black_glass" AutoGenerateColumns="false"
            EnableRecordHover="true" AllowAddingRecords="true">
            <ClientSideEvents OnClientEdit="onClientEdit" OnBeforeClientAdd="onAdding" OnBeforeClientUpdate="onSaving" OnBeforeClientInsert="onSaving"  OnBeforeClientDelete="onDeleteing" ExposeSender="true" />
            <Columns>
                <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" Visible="false" HeaderText="ID" Width="100" runat="server">			    			    
                    <TemplateSettings RowEditTemplateControlId="txtOrderID" RowEditTemplateControlPropertyName="innerHTML"/>
	            </obout:Column>
                <obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server">					
                    <TemplateSettings RowEditTemplateControlId="txtShipName" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" >
                    <TemplateSettings RowEditTemplateControlId="txtShipCity" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" >
                    <TemplateSettings RowEditTemplateControlId="txtShipPostalCode" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column6" HeaderText="" Width="200" AllowEdit="true"  Align="center" AllowDelete="true" runat="server" />																							
            </Columns>
            <TemplateSettings RowEditTemplateId="tplRowEdit" />
            <Templates> 			    
	            <obout:GridTemplate runat="server" ID="tplRowEdit">
                    <Template>
                        <div style="position: relative;">
                            <table class="rowEditTable" >
                                <tr>
                                    <td valign="top">
                                        <fieldset style="width: 275px; height: 170px;">
                                            <legend>Ship Information</legend>
                                            <table>					                                            
                                                <tr>
                                                    <td Width="120">Ship Name:</td>
                                                    <td>
                                                        <obout:OboutTextBox runat="server" ID="txtShipName" Width="150"  />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td Width="120">Ship Address:</td>
                                                    <td>
                                                        <obout:OboutTextBox runat="server" ID="txtShipAddress" Width="150"  />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td Width="120">Ship City:</td>
                                                    <td>
                                                        <obout:OboutTextBox runat="server" ID="txtShipCity" Width="150"  />										
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td Width="120">Ship Region:</td>
                                                    <td>
                                                        <obout:OboutTextBox runat="server" ID="txtShipRegion" Width="150"  />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td Width="120">Ship Postal Code:</td>
                                                    <td>
                                                        <obout:OboutTextBox runat="server" ID="txtShipPostalCode" Width="150"  />
                                                     </td>
                                                </tr>
                                                <tr>
                                                    <td Width="120">Ship Country:</td>
                                                    <td>
                                                        <obout:OboutDropDownList runat="server" ID="ddlCountries" Width="150" Height="200" MenuWidth="175"
                                                               DataSourceID="sdsCountries" DataTextField="ShipCountry" DataValueField="ShipCountry"/>
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
                                        <fieldset style="width: 310px; height: 170px;">
                                            <legend>Order Information</legend>
                                            <table>
                                                <tr>
                                                    <td>Order ID:</td><td><span id="txtOrderID" style="width: 150px;"></span></td>
                                                </tr>					                                            					                                            
                                                <tr>
                                                    <td>Order Date:</td>
                                                    <td valign="middle">
                                                        <obout:OboutTextBox runat="server" ID="txtOrderDate" Width="125"  />
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
                                                        <obout:OboutTextBox runat="server" ID="txtRequiredDate" Width="125"  />
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
                                                        <obout:OboutTextBox runat="server" ID="txtShippedDate" Width="125"  />
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
                                                        <obout:OboutTextBox runat="server" ID="txtShipVia" Width="125"  />
                                                    </td>
                                                </tr>				                                            
                                                <tr>
                                                    <td>Sent:</td>
                                                    <td>
                                                        <obout:OboutCheckBox runat="server" ID="txtSent"  />
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
                                 </tr>
                                 <tr>
                                    <td colspan="2" align="center">
                                        <obout:OboutButton ID="BtnSaveChanges" runat="server" Text="Save" OnClientClick="return saveChanges('BtnSaveChanges')"  /> &#160;
                                        <obout:OboutButton ID="BtnCancelChanges" runat="server" Text="Cancel" OnClientClick="return cancelChanges('BtnCancelChanges');"  />
                                    </td>
                                 </tr>
                             </table>					                         
                             
                             <div class="loading-image-container" id="LoadingIndicator" style="display: none;">
                                 <div class="loading-image">
						            <img src="resources/images/2.gif">
					            </div>
					         </div>
                         </div>
                    </Template>
                </obout:GridTemplate>
            </Templates>
        </obout:Grid>
	    
	    <asp:ObjectDataSource runat="server" ID="ods1" TypeName="OrdersDataPerformance"
		    SelectMethod="GetOrders" SelectCountMethod="GetOrdersCount" EnablePaging="true" SortParameterName="sortExpression" />
		
		<asp:SqlDataSource runat="server" ID="sdsCountries" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountry ASC"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		    
		
		
		<br /><br /> 
		
    </div>
    
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    
    </form>
</body>
</html>
