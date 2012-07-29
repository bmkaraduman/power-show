<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_filtering_live.aspx.cs" Inherits="Grid_aspnet_filtering_live" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Live Search</b></span>		
	
    <br /><br />
	
    <obout:Grid id="Grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" AllowAddingRecords="false"
			FolderStyle="styles/black_glass" AllowFiltering="true" ShowLoadingMessage="false" DataSourceID="sds1" AllowPageSizeSelection="false">
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" Visible="false" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" ShowFilterCriterias="false" Width="200" runat="server">
                    <TemplateSettings FilterTemplateId="NameFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="StartsWith" />
                    </FilterOptions>
                </obout:Column>
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" ShowFilterCriterias="false" Width="150" runat="server">
                    <TemplateSettings FilterTemplateId="CityFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="StartsWith" />
                    </FilterOptions>
                </obout:Column>
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" ShowFilterCriterias="false" Width="150" runat="server">
                    <TemplateSettings FilterTemplateId="ZipFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="StartsWith" />
                    </FilterOptions>
                </obout:Column>
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY"  ShowFilterCriterias="false" Width="150" runat="server">
                    <TemplateSettings FilterTemplateId="CountryFilter" />
                    <FilterOptions>
                        <obout:FilterOption IsDefault="true" Type="StartsWith" />
                    </FilterOptions>
                </obout:Column>
			</Columns>
			<FilteringSettings InitialState="Visible" FilterPosition="Top" />
            <Templates>
                <obout:GridTemplate runat="server" ID="NameFilter" ControlID="Name">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="Name" Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="CityFilter" ControlID="City">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="City" Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="ZipFilter" ControlID="Zip">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="Zip" Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="CountryFilter" ControlID="Country">
                    <Template>
                        <obout:OboutTextBox runat="server" ID="Country" Width="100%">
                            <ClientSideEvents OnKeyUp="applyFilter" />
                        </obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
            </Templates>
		</obout:Grid>
        
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Orders ORDER BY ShipName ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
        <br /><br />
		
		<span class="tdText">
    		This example demonstrates the ability to automatically filter the Grid when typing into the filter text boxes,<br />
            without being needed to hit the "Apply Filter" link. Simply type a search term into the filter text boxes and<br />
            the Grid will load a fresh set of data from the server.    		
		</span>

    <script type="text/javascript">
        var applyFilterTimeout = null;

        function applyFilter() {
            if (applyFilterTimeout) {
                window.clearTimeout(applyFilterTimeout);
            }

            applyFilterTimeout = window.setTimeout(doFiltering, 1000);
        }

        function doFiltering() {
            Grid1.filter();
        }
	</script>

    <style type="text/css">
            .ob_gFALC
			{
			    display: none !important;
			}
    </style>
</asp:Content>

