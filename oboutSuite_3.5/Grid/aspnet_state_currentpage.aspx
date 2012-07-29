<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_state_currentpage.aspx.cs" Inherits="Grid_aspnet_state_currentpage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Keep Current Page</b></span>		
	
    <br /><br />
	
    <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
	    AllowFiltering="false" AllowPageSizeSelection="false" CurrentPageIndex="2"
	    OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="80" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
				<obout:Column ID="Column4" DataField="ShipCountry" HeaderText="COUNTRY" Width="130" runat="server" />
				<obout:Column ID="Column5" HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>					
		</obout:Grid>	

    <br /><br />

   <span class="tdText">
        To keep the current page visible when revisiting the page, you need to store the CurrentPageIndex property of the Grid <br />
        in a session variable. Based on this session variable you can restore the page index when the user visits the page<br />
        again. Instead of Session variables you can also use cookies.
    </span>
</asp:Content>

