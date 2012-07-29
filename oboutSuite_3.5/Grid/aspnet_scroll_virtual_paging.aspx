<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_scroll_virtual_paging.aspx.cs" Inherits="Grid_aspnet_scroll_virtual_paging" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Virtual Scrolling with Paging</b></span>		
	
    <br /><br />
	
    <obout:Grid id="Grid1" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" Serialize="false"
        OnDataSourceNeeded="Grid1_DataSourceNeeded" AllowPageSizeSelection="false" PageSize="10">
		<ScrollingSettings ScrollHeight="250" EnableVirtualScrolling="true" UsePagingForVirtualScrolling="true" />
        <Columns>
            <obout:Column DataField="OrderID" Visible="false" />
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME" />
            <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" />
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" />
            <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" />
        </Columns>
	</obout:Grid>

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

