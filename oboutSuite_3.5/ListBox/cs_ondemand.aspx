<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="cs_ondemand.aspx.cs" Inherits="ListBox_cs_ondemand" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Load Items on Demand</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
       
    
    <br /><br /><br />
    
    <span class="tdText">
        The items of the ListBox can be loaded on-demand (via AJAX requests). The advantage of using this approach<br />
        is that the items are loaded asynchronously. <br />
        Thus, the page will load very fast because no item is loaded on page load.<br /><br />
        
        In order to enable the on demand loading feature, set the <b>EnableLoadOnDemand</b> property to <span class="option2">true</span>.<br />
        You also need to handle the <b>LoadingItems</b> server-side event, which is executed each time the ListBox <br />
        requests items from the server via AJAX.
    </span>
    
</asp:Content>
