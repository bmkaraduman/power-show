<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_scroll_virtual_paging.aspx.cs" Inherits="Grid_cs_scroll_virtual_paging" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Virtual Scrolling with Paging</b></span>		
	
    <br /><br />
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

    <br />

    <span class="tdText">
        The virtual scrolling feature of the Grid can be customized to work similar to the paging feature.<br />
        Move the vertical scrollbar up or down to navigate through the pages of the Grid, which will be loaded on demand.<br />
        
        <br />

        To enable the virtual scrolling with paging feature set the <b>ScrollingSettings.EnableVirtualScrolling</b> and <br />
        <b>ScrollingSettings.UsePagingForVirtualScrolling</b> properties to <span class="option2">true</span>.<br />
        Also, you need to make sure the vertical scrolling feature is enabled, by setting the <b>ScrollingSettings.ScrollHeight</b> property.<br />
        The retrieving of records from the database is performed in the event handler of the <b>DataSourceNeeded</b> event.

    </span>
</asp:Content>

