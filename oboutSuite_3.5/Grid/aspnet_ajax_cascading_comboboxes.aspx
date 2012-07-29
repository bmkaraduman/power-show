<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aspnet_ajax_cascading_comboboxes.aspx.cs" Inherits="Grid_aspnet_cascading_comboboxes" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
		<script type="text/javascript">
		    function loadCities(sender, index) {
		        PageMethods.GetCities(sender.value(), onCitiesLoaded, onCitiesLoadedError);
		    }

		    function onCitiesLoaded(cities) {
		        CitiesComboBox.options.clear();

		        for (var i = 0; i < cities.length; i++) {
		            CitiesComboBox.options.add(cities[i]);
		        }

		        CitiesComboBox.value(document.getElementById('hiddenCity').value);
		    }

		    function onCitiesLoadedError() {
		    }

		    function updateCitySelection(sender, index) {
		        document.getElementById('hiddenCity').value = sender.value();
		    }

		    function grid1_OnEdit() {
		        CitiesComboBox.value(document.getElementById('hiddenCity').value);
		    }

		</script>		
	</head>
	<body>
		<form runat="server">
					
		<br />
		
		<span class="tdText"><b>ASP.NET Grid - Cascading ComboBoxes inside Row Template</b></span>
		
		<br /><br />
		
		<asp:ScriptManager ID="ScriptManager" runat="server"  EnablePageMethods="true" />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			AutoGenerateColumns="false" FolderStyle="" EnableRecordHover="true"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
            <ClientSideEvents OnClientEdit="grid1_OnEdit" ExposeSender="true" />
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
                    <TemplateSettings RowEditTemplateControlId="hiddenCity" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipRegion" Visible="false" Width="150" HeaderText="REGION" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipRegion" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipPostalCode" Width="150" HeaderText="POSTAL CODE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipPostalCode" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipCountry" Visible="true" Width="175" Wrap="false" HeaderText="COUNTRY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="CountriesComboBox" RowEditTemplateControlPropertyName="value" />
                </obout:Column>                
                <obout:Column DataField="OrderDateFormatted" Width="175" HeaderText="ORDER DATE" runat="server">
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
                <obout:Column DataField="AdditionalInformation" Visible="false" Width="200" HeaderText="ADDITIONAL INFORMATION" runat="server" >
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
                                                    <obout:ComboBox runat="server" ID="CountriesComboBox" Width="150" Height="200"
                                                        DataSourceID="sds1" DataTextField="ShipCountry" DataValueField="ShipCountry">
                                                        <ClientSideEvents OnSelectedIndexChanged="loadCities" />
                                                    </obout:ComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship City:</td>
                                                <td>
                                                    <input type="hidden" id="hiddenCity" />
                                                    <obout:ComboBox runat="server" ID="CitiesComboBox" Width="150">
                                                        <ClientSideEvents OnSelectedIndexChanged="updateCitySelection" />
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
                                 <td valign="top">
                                    <fieldset style="width: 300px; height: 175px;">
                                        <legend>Additional Information</legend>
                                        <textarea class="ob_gEC" id="txtAdditionalInformation" style="margin: 5px;width:285px;height:145px;overflow:auto;background-color: #EFEFEF;"></textarea>
                                    </fieldset>
                                 </td>
                             </tr>
                             <tr>
                                <td colspan="3" align="center">
                                    <input type="button" value="Save" onclick="grid1.save()" class="tdText" />
                                    <input type="button" value="Cancel" onclick="grid1.cancel()" class="tdText" /> 
                                </td>
                             </tr>
                         </table>					                         
                    </Template>
                </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		<br />
		<span class="tdText">
		You can place cascading ComboBox controls inside a Grid template.<br /><br />
        This example showcases the use of two ComboBox controls - one containing countries and one containing cities - which are linked in a cascading manner. <br />When selecting a country in the first ComboBox, the second one will be reloaded with the cities for that country.
        </span>
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


