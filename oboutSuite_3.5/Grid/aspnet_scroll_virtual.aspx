<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_scroll_virtual.aspx.cs" Inherits="Grid_aspnet_scroll_virtual" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Virtual Scrolling</b></span>		
	
    <br /><br />
	
    <obout:Grid id="Grid1" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" Serialize="false"
        OnDataSourceNeeded="Grid1_DataSourceNeeded" AllowPaging="false" AllowPageSizeSelection="false" PageSize="50">
		<ScrollingSettings ScrollHeight="250" EnableVirtualScrolling="true" />
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
        The virtual scrolling feature of the Grid can be used as a way to display large amounts of records without using the paging buttons.<br />
        Simply scroll the vertical scrollbar of the Grid down to the bottom and a fresh set of records will be loaded and added to the existing records.<br />
        
        <br />

        To enable the virtual scrolling feature set the <b>ScrollingSettings.EnableVirtualScrolling</b> property to <span class="option2">true</span>.<br />
        Also, you need to make sure the vertical scrolling feature is enabled, by setting the <b>ScrollingSettings.ScrollHeight</b> property.<br />
        The retrieving of records from the database is performed in the event handler of the <b>DataSourceNeeded</b> event.
    </span>
</asp:Content>

