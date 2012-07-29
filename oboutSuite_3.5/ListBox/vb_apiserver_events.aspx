<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_apiserver_events.aspx.vb" Inherits="ListBox_vb_apiserver_events" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ListBox - Server-Side API - Events</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
   
    <span class="tdText">
        <asp:Literal runat="server" ID="EventLogger" />
    </span>
        
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides server-side events that allow you to detect<br />
        various stages in the control's lifecycle or to detect when the end user performs <br />
        a specific action with the control. The following server-side events are raised by the control:<br /><br />
        
        <ul>
            <li><span class="option2">SelectedIndexChanged</span> - is raised when the selection is changed;</li>
            <li><span class="option2">OnItemCreated</span> - is raised when an item is created;</li>
            <li><span class="option2">OnItemDataBound</span> - is raised when an item is bound to its data source;</li>
            <li><span class="option2">OnLoadingItems</span> - is raised when the load on demand feature sends an AJAX request to load the next set of items;</li>
        </ul>
    </span>
</asp:Content>

