<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_data_sources_switch.aspx.cs" Inherits="Grid_aspnet_data_sources_switch" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Switch Data Sources</b></span>		
	
    <br /><br />

    <obout:OboutButton runat="server" ID="OboutButton1" Text="Load Orders" OnClick="LoadOrders" />
    <obout:OboutButton runat="server" ID="OboutButton2" Text="Load Customers" OnClick="LoadCustomers" />

    <br /><br />
	
    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1"
        AutoGenerateColumns="true" AllowAddingRecords="false"/>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC" />

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [CustomerID], [CompanyName], [City], [Country] FROM [Customers] ORDER BY CustomerID ASC" />

    <br />

    <span class="tdText">
        The Grid can be bound to a different data source during a postback. If you use the serialization feature of the Grid <br />
        (Serialize="true") you need to call the <b>ClearPreviousDataSource</b> method before specifying the new data source.
    </span>
</asp:Content>

