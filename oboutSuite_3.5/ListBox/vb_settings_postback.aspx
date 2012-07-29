<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_settings_postback.aspx.vb" Inherits="ListBox_vb_settings_postback" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ListBox - AutoPostBack</b></span>
    
    <br /><br />
     <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
   
    
    <span class="tdText">
        <asp:Literal runat="server" ID="Details" />
    </span>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        You can automate the process of posting the page back to the server after an item is selected from the list,<br />
        by using the <b>AutoPostBack</b> property. When it is set to true the end users don't need to click any button <br />
        on the page to post the page to the server - the ListBox will do it automatically. <br /><br />
        
        Usually the <b>AutoPostBack</b> property is used alongside the <b>SelectedIndexChanged</b> server-side event, <br />
        which allows you to handle the change event on the server. This event is used in this example too.
    </span>
</asp:Content>

