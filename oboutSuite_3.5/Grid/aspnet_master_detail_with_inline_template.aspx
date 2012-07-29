<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_with_inline_template.aspx.cs" Inherits="Grid_aspnet_master_detail_with_inline_template" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">				
		<br />
		<span class="tdText"><b>ASP.NET Grid - Inline Edit Templates for Master / Detail Grids</b></span>
		
		<br /><br />
		
       <obout:Grid runat="server" ID="Grid1" AutoGenerateColumns="false" PageSize="5"
		    AllowAddingRecords="true" DataSourceID="sds1" AllowPageSizeSelection="false">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false" />
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="200" />
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME" />
                <obout:Column DataField="Country" HeaderText="COUNTRY" Width="125">
                    <TemplateSettings EditTemplateId="CustomerCountryTemplate" />
                </obout:Column>
                <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="145"></obout:Column>
            </Columns>
            <MasterDetailSettings LoadingMode="OnCallback" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="Grid2" AutoGenerateColumns="false" EnableTypeValidation="false"
                    AllowAddingRecords="true" ShowFooter="true" PageSize="5" OnRowCreated="Grid2_RowCreated"
                    DataSourceID="sds2" ForeignKeys="CustomerID" AllowPageSizeSelection="false">
                    <ClientSideEvents  ExposeSender="true" OnClientPopulateControls="onPopulateControls" />
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="false" Visible="false" />
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="false" Visible="false" />
                        <obout:Column DataField="ShipName" HeaderText="SHIP NAME" />
                        <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" Visible="false" />
                        <obout:Column DataField="ShipAddress" HeaderText="SHIP ADDRESS">
                            <TemplateSettings EditTemplateId="OrderAddressTemplate" />                            
                        </obout:Column>
                        <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" DataFormatString="{0:C2}" Width="125">
                            <TemplateSettings EditTemplateId="OrderCountryTemplate" />
                        </obout:Column>
                        <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="140"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnCallback" />
                    <Templates>
                        <obout:GridTemplate runat="server" ID="OrderCountryTemplate" ControlID="OrderCountry">
                            <Template>
                                <obout:OboutDropDownList runat="server" ID="OrderCountry" Width="100%" Height="200" MenuWidth="175"
                                    DataSourceID="sds3" DataTextField="ShipCountry" DataValueField="ShipCountry" />
                            </Template>
                        </obout:GridTemplate>
                        <obout:GridTemplate runat="server" ID="OrderAddressTemplate" ControlID="OrderAddress">
                            <Template>
                                <obout:OboutTextBox runat="server" ID="OrderAddress" TextMode="MultiLine" Width="100%" />
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                </obout:DetailGrid>
            </DetailGrids>
			<Templates>
                <obout:GridTemplate runat="server" ID="CustomerCountryTemplate" ControlID="CustomerCountry">
                    <Template>
                        <obout:OboutDropDownList runat="server" ID="CustomerCountry" Width="100%" Height="200" MenuWidth="175"
                            DataSourceID="sds3" DataTextField="ShipCountry" DataValueField="ShipCountry" />
                    </Template>
                </obout:GridTemplate>			                  
            </Templates>
	    </obout:Grid>

        <div style="display: none;">
            <%-- Needed to load the stylesheet for the multi line text box that comes from the detail grid --%>
            <obout:OboutTextBox runat="server" ID="DummyTxt" TextMode="MultiLine" />
        </div>
		
		<br /><br />				
		
		<span class="tdText">
            This sample showcases the ability to have inline edit templates inside detail grids. The <b>RowCreated</b> and <b>RowDataBound</b><br />
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
            InsertCommand="INSERT INTO Orders (CustomerID, ShipName, ShipCity, ShipAddress, ShipCountry) VALUES(@CustomerID, @ShipName, @ShipCity, @ShipAddress, @ShipCountry)"
            UpdateCommand="UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipAddress = @ShipAddress, ShipCountry=@ShipCountry WHERE OrderID = @OrderID"
            DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipAddress" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipAddress" Type="String" />
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
    	
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">	
    <script type="text/javascript">
        function onPopulateControls(sender, record) {
            record.CustomerID = sender.ForeignKeys.CustomerID.Value;

            return record;
        }
    </script>
</asp:Content>

