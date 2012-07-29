<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aspnet_ajax_cascading_comboboxes_inline.aspx.cs" Inherits="Grid_aspnet_cascading_comboboxes" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
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

		</script>		
        
	</head>
	<body>
		<form runat="server">
					
		<br />
		
		<span class="tdText"><b>ASP.NET Grid - Cascading ComboBoxes Inline</b></span>
		
		<br /><br />
		
		<asp:ScriptManager ID="ScriptManager" runat="server"  EnablePageMethods="true" />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			AutoGenerateColumns="false" FolderStyle="" EnableRecordHover="true"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			
			<Columns>
				<obout:Column DataField="OrderID" Visible="false" Width="150" ReadOnly="true" HeaderText="ORDER ID" runat="server">
				</obout:Column>
                <obout:Column DataField="ShipName" Width="200" HeaderText="NAME" runat="server">
                </obout:Column>
                <obout:Column ID="Column1" DataField="ShipPostalCode" Width="150" HeaderText="POSTAL CODE" runat="server">
                </obout:Column>   
                <obout:Column DataField="ShipCountry" Visible="true" Width="175" Wrap="false" HeaderText="COUNTRY" runat="server">
                    <TemplateSettings EditTemplateId="tmpComboCountry" />
                </obout:Column>    
                <obout:Column DataField="ShipCity" Width="200" HeaderText="CITY" runat="server">
                    <TemplateSettings EditTemplateId="tmpComboCity" />
                </obout:Column>                
                <obout:Column HeaderText="EDIT" Width="200" AllowEdit="true" AllowDelete="true" runat="server" />
			</Columns>
			    <Templates>
                    <obout:GridTemplate runat="server" ControlID="CountriesComboBox" ID="tmpComboCountry" ControlPropertyName="value">
                        <Template>
                           <obout:ComboBox runat="server" ID="CountriesComboBox" Width="150" Height="200"
                                DataSourceID="sds1" DataTextField="ShipCountry" DataValueField="ShipCountry">
                                <ClientSideEvents OnSelectedIndexChanged="loadCities" />
                            </obout:ComboBox>
                        </Template>
                    </obout:GridTemplate>
                    <obout:GridTemplate runat="server" ControlID="hiddenCity" ID="tmpComboCity" ControlPropertyName="value">
                        <Template>
                           <input type="hidden" id="hiddenCity" />
                           <obout:ComboBox runat="server" ID="CitiesComboBox" Width="150">
                                <ClientSideEvents OnSelectedIndexChanged="updateCitySelection" />
                            </obout:ComboBox>
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


