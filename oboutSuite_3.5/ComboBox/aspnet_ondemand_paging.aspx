<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_ondemand_paging.aspx.cs" Inherits="ComboBox_aspnet_ondemand" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Load Items on Demand with Paging</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" Width="250" Height="200"
        DataTextField="CountryName" DataValueField="CountryID" OpenOnFocus="true"
        EmptyText="Select a country ..."
        EnableLoadOnDemand="true" OnLoadingItems="ComboBox1_LoadingItems">
        <FooterTemplate>
            Displaying items <%# Container.ItemsCount > 0 ? "1" : "0" %>-<%# Container.ItemsLoadedCount %> out of <%# Container.ItemsCount %>.
        </FooterTemplate>
    </obout:ComboBox>
    
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
