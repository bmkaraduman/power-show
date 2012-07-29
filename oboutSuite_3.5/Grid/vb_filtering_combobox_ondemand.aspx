<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_filtering_combobox_ondemand.aspx.vb" Inherits="Grid_vb_filtering_combobox_ondemand" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Filtering with On-Demand ComboBox</b></span>
	
    <br /><br />
    
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		 

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

