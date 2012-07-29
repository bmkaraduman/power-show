<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_ondemand_paging.aspx.vb" Inherits="ListBox_vb_ondemand_paging" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Load Items on Demand with Paging</b></span>	
    
    <br /><br />
     <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
    
    
    <br /><br /><br />
    
    <span class="tdText">
        The items of the ListBox can be loaded on-demand (via AJAX requests). The advantage of using this approach<br />
        is that the items are loaded asynchronously. <br />
        Thus, the page will load very fast because no item is loaded on page load.<br /><br />
        
        In order to enable the on demand loading feature, set the <b>EnableLoadOnDemand</b> property to <span class="option2">true</span>.<br />
        You also need to handle the <b>LoadingItems</b> server-side event, which is executed each time the ListBox <br />
        requests items from the server via AJAX.<br /><br />
        
        To improve the performance even further, you can use the "paging" approach for the load on demand feature. <br />
        Using this approach will force the ListBox to load only a limited number at a time, instead of retrieving all the matches at once.<br />
        So for example, if there are 10,000 items in the database, you can configure the ListBox to load 100 items at a time, <br />
        to make the on demand loading functionality run smoother.<br /><br />
        
        To load the next set of items, the end user simply needs to click on the footer text from the bottom of the list with items.
    </span>
</asp:Content>

