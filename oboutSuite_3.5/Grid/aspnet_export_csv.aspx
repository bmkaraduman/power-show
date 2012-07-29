<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_export_csv.aspx.cs" Inherits="Grid_aspnet_export_csv" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Export to CSV</b></span>
    
    <br />
    <br />

    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export current page to CSV" OnClick="OboutButton1_Click" />
    <obout:OboutButton ID="OboutButton2" runat="server" Text="Export all pages to CSV" OnClick="OboutButton2_Click" />

    <br /><br />

    <obout:Grid ID="Grid1" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <obout:Column DataField="OrderID" HeaderText="ORDER ID" runat="server" />
            <obout:Column DataField="ShipName" HeaderText="NAME" runat="server" />
            <obout:Column DataField="ShipCity" HeaderText="CITY" runat="server" />
            <obout:Column DataField="ShipCountry" HeaderText="COUNTRY" runat="server" />            
        </Columns>
    </obout:Grid>

    <br />

    <div class="tdText" style="width: 600px;">
        This sample showcases the ability to export data from the Grid to CSV. We used a loop to go through the records of the Grid and add them to the generated CSV file.
        
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 50 * FROM [Orders] ORDER BY OrderID DESC">
    </asp:SqlDataSource>    
</asp:Content>