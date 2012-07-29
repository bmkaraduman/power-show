<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_filtering_combobox_ondemand.aspx.cs" Inherits="Grid_aspnet_filtering_combobox_ondemand" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Filtering with On-Demand ComboBox</b></span>
	
    <br /><br />
    
    <obout:Grid runat="server" ID="Grid1" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" 
        AllowAddingRecords="false" AllowFiltering="true" AllowPageSizeSelection="false">
        <Columns>
            <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false" />
            <obout:Column DataField="ShipName" HeaderText="NAME" />
            <obout:Column DataField="ShipCity" HeaderText="CITY" />
            <obout:Column DataField="ShipCountry" HeaderText="COUNTRY" ShowFilterCriterias="false"> 
                <TemplateSettings FilterTemplateId="Template1" />
            </obout:Column>
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" />
        </Columns>
        <Templates>
            <obout:GridTemplate runat="server" ID="Template1" ControlID="ComboBox1">
                <Template><obout:ComboBox runat="server" ID="ComboBox1" Width="100%" Height="200"
                    DataTextField="CountryName" DataValueField="CountryName" EmptyText="Select a country ..."
                    EnableLoadOnDemand="true" OnLoadingItems="ComboBox1_LoadingItems"
                    /></Template>
            </obout:GridTemplate>
        </Templates>
    </obout:Grid>        

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        SelectCommand="SELECT TOP 100 OrderID, ShipName, ShipPostalCode, ShipCity, ShipCountry FROM Orders ORDER BY OrderID DESC"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" 
		ProviderName="System.Data.OleDb">
    </asp:SqlDataSource>

    <br />

    <span class="tdText">
        The Grid allows developers to customize the controls used in the filter row by means of templates.<br />
        You can place any ASP.NET / HTML controls inside the Grid templates.<br /><br />
        This example showcases the use of a ComboBox control with its on-demand loading feature enabled.
    </span>
</asp:Content>

