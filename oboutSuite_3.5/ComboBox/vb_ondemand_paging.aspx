<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_ondemand_paging.aspx.vb" Inherits="ComboBox_vb_ondemand_pagining" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Load Items on Demand with Paging</b></span>	
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" /> 
        
    
    <br /><br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be loaded on-demand (via AJAX requests). The advantage of using this approach<br />
        is that the items are loaded only when the end user types something into the input field. <br />
        Thus, the page will load very fast because no item is loaded on page load.<br /><br />
        
        In order to enable the on demand loading feature, set the <b>EnableLoadOnDemand</b> property to <span class="option2">true</span>.<br />
        You also need to handle the <b>LoadingItems</b> server-side event, which is executed each time the ComboBox <br />
        requests items from the server via AJAX. The server-side event handler will load all the items that match the text typed in the input field.<br /><br />
        
        To improve the performance even further, you can use the "paging" approach for the load on demand feature. <br />
        Using this approach will force the ComboBox to load only a limited number at a time, instead of retrieving all the matches at once.<br />
        So for example, if there are 10,000 items in the database, you can configure the ComboBox to load 100 items at a time, <br />
        to make the on demand loading functionality run smoother.<br /><br />
        
        To load the next set of items, the end user simply needs to click on the footer text from the bottom of the list with items.
    </span>
</asp:Content>

