<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_state_sorting.aspx.cs" Inherits="Grid_aspnet_state_sorting" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Keep Current Sort Order</b></span>		
	
    <br /><br />
	
    <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 AllowFiltering="false" OnRebind="RebindGrid" AllowAddingRecords="false"
			OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="80" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
				<obout:Column ID="Column5" HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>					
		</obout:Grid>	

        <br /><br />
<span class="tdText">
To keep the sort order of the Grid when revisiting the page, you need to store the SortPriority and the SortOrder properties of each column <br />
in a session variable. Based on these session variables you can restore the sort order for each column of the Grid when the user visits the page again. <br />
Instead of Session variables you can also use cookies.
</span>

</asp:Content>

