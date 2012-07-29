<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_with_row_template.aspx.cs" Inherits="Grid_aspnet_master_detail_with_row_template" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">				
		<br />
		<span class="tdText"><b>ASP.NET Grid - Row Edit Templates inside Master / Detail Grids</b></span>
		
		<br /><br />
		
       <obout:Grid runat="server" ID="Grid1" AutoGenerateColumns="false" PageSize="5"
		    AllowAddingRecords="true" DataSourceID="sds1" AllowPageSizeSelection="false">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false">
                    <TemplateSettings RowEditTemplateControlId="txtCustomerID" RowEditTemplateControlPropertyName="innerHTML"/>
                </obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="200">
                    <TemplateSettings RowEditTemplateControlId="txtCompanyName" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME">
                    <TemplateSettings RowEditTemplateControlId="txtContactName" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY" Width="125">
                    <TemplateSettings RowEditTemplateControlId="ddlCountries" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="145"></obout:Column>
            </Columns>
            <MasterDetailSettings LoadingMode="OnCallback" />
            <TemplateSettings RowEditTemplateId="tplRowEditMaster" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="Grid2" AutoGenerateColumns="false" EnableTypeValidation="false"
                    AllowAddingRecords="true" ShowFooter="true" PageSize="5" OnRowCreated="grid2_RowCreated"
                    DataSourceID="sds2" ForeignKeys="CustomerID" AllowPageSizeSelection="false">
                    <ClientSideEvents  ExposeSender="true" OnClientPopulateControls="onPopulateControls" />
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="false" Visible="false">
                            <TemplateSettings RowEditTemplateControlId="hiddenCustomerID" RowEditTemplateControlPropertyName="value" />
                        </obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="false" Visible="false">
                            <TemplateSettings RowEditTemplateControlId="hiddenOrderID" RowEditTemplateControlPropertyName="value" />
                        </obout:Column>
                        <obout:Column DataField="ShipName" HeaderText="SHIP NAME">
                            <TemplateSettings RowEditTemplateControlId="txtShipName" RowEditTemplateControlPropertyName="value" />
                        </obout:Column>
                        <obout:Column DataField="ShipCity" HeaderText="SHIP CITY">                            
                            <TemplateSettings RowEditTemplateControlId="txtShipCity" RowEditTemplateControlPropertyName="value" />
                        </obout:Column>
                        <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" DataFormatString="{0:C2}" Width="125">
                            <TemplateSettings RowEditTemplateControlId="ddlShipCountries" RowEditTemplateControlPropertyName="value" />
                        </obout:Column>
                        <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="140"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnCallback" />
                    <TemplateSettings RowEditTemplateId="tplRowEditDetail" />
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tplRowEditDetail">
                            <Template>
                                <input type="hidden" id="hiddenCustomerID" />
                                <input type="hidden" id="hiddenOrderID" />
                                <table class="rowEditTable">
                                    <tr>
                                        <td valign="top">
                                            <fieldset style="width: 300px; height: 125px;">
                                                <legend>Ship Information</legend>
                                                <table>					                                            
                                                    <tr>
                                                        <td>Ship Name:</td>
                                                        <td>
                                                            <obout:OboutTextBox runat="server" ID="txtShipName" Width="150" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ship City:</td>
                                                        <td>
                                                            <obout:OboutTextBox runat="server" ID="txtShipCity" Width="150" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ship Country:</td>
                                                        <td>
                                                            <obout:OboutDropDownList runat="server" ID="ddlShipCountries" Width="150" Height="200" MenuWidth="175"
                                                                DataSourceID="sds3" DataTextField="ShipCountry" DataValueField="ShipCountry" />
                                                        </td>
                                                    </tr>					                                            
                                                </table>
                                             </fieldset>
                                         </td>
                                    </tr>
                                 </table>					                         
                            </Template>
                        </obout:GridTemplate> 
                    </Templates>                    
                </obout:DetailGrid>
            </DetailGrids>  
			<Templates> 			    
			    <obout:GridTemplate runat="server" ID="tplRowEditMaster">
                    <Template>
                        <table class="rowEditTable">
                            <tr>
                                <td valign="top">
                                    <fieldset class="fieldPosition" style="width: 275px; height: 125px;">
                                        <legend>Customer Information</legend>
                                        <table>	
                                            <tr>
                                                <td>Customer ID:</td>
                                                <td>
                                                    <span id="txtCustomerID" style="width: 150px;"></span>
                                                </td>
                                            </tr>					                                            
                                            <tr>
                                                <td>Company Name:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtCompanyName" Width="150" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Contact Name:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtContactName" Width="150" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Country:</td>
                                                <td>
                                                    <obout:OboutDropDownList runat="server" ID="ddlCountries" Width="150" Height="200" MenuWidth="175"
                                                        DataSourceID="sds3" DataTextField="ShipCountry" DataValueField="ShipCountry" />
                                                </td>
                                            </tr>
                                        </table>
                                     </fieldset>
                                 </td>
                            </tr>
                         </table>					                         
                    </Template>
                </obout:GridTemplate>                
            </Templates>
	    </obout:Grid>
		
		<br /><br />				
		
		<span class="tdText">
		    Using row edit templates developers can place large forms inside the Grid for allowing end users to add/edit delete data.<br />
            Use the <b>TemplateSettings.RowEditTemplateId</b> property to specify the ID of the template containing the row template.<br /><br />
            
            This sample showcases the ability to have row edit templates inside detail grids. The <b>RowCreated</b> and <b>RowDataBound</b><br />
            events are used to gain access to the controls inside the detail grid template, in order to change their IDs and make them <br />
            unique to each individual detail grid.
		</span>
				
	    <asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		    SelectCommand="SELECT * FROM [Customers]"
            InsertCommand="INSERT INTO Customers (CustomerID, CompanyName, ContactName, Country) VALUES(@CustomerID, @CompanyName, @ContactName, @Country)"
            UpdateCommand="UPDATE Customers SET CompanyName = @CompanyName, ContactName = @ContactName, Country=@Country WHERE CustomerID = @CustomerID"
            DeleteCommand="DELETE FROM Customers WHERE CustomerID = @CustomerID">
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="CustomerID" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </DeleteParameters>
		 </asp:SqlDataSource>

		 
		<asp:SqlDataSource runat="server" ID="sds2" ProviderName="System.Data.OleDb"
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = @CustomerID"
            InsertCommand="INSERT INTO Orders (CustomerID, ShipName, ShipCity, ShipCountry) VALUES(@CustomerID, @ShipName, @ShipCity, @ShipCountry)"
            UpdateCommand="UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipCountry=@ShipCountry WHERE OrderID = @OrderID"
            DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
		</asp:SqlDataSource>
        	
        <asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
</asp:Content>
    	
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">	
    <style type="text/css">			
		.rowEditTable
		{
			position: relative;
			left: 184px;
		}
			
		.rowEditTable td {
			font-family: Verdana;
		    font-size: 10px;
		    color: #4B555E;
		}
	</style>
    <script type="text/javascript">
        function onPopulateControls(sender, record) {
            record.CustomerID = sender.ForeignKeys.CustomerID.Value;

            return record;
        }
    </script>
</asp:Content>

