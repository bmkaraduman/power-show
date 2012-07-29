<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_apiserver_tooltips.aspx.vb" Inherits="ListBox_vb_apiserver_tooltips" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Server-Side API - Tooltips</b></span>
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 

    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ListBox provide support for tooltips, which can be used to provide additional information for end users.<br />
        To add a tooltip to an item of a ListBox, use the <b>ToolTip</b> property of the ListBox class.
        <br /><br />

        When populating the ListBox from a data source you can use the <b>ItemDataBound</b> event to assign a tooltip<br />
        to each individual item from the list (as we did in this sample).<br />
    </span>
</asp:Content>


