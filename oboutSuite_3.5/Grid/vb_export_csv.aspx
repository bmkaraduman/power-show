<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_export_csv.aspx.vb" Inherits="Grid_vb_export_csv" %>
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

    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

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

        