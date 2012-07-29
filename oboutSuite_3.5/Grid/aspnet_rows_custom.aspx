<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_rows_custom.aspx.cs" Inherits="Grid_aspnet_rows_custom" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Customize Individual Rows</b></span>		
	
    <br /><br />

    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowFiltering="true" DataSourceID="sds1" AllowAddingRecords="false"
			OnRowCreated="OnGridRowCreated" OnRowDataBound="OnGridRowDataBound">
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />				
			</Columns>					
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">
		    You can use the OnRowCreated and OnRowDataBound events to modify the properties and values of the cells inside the Grid.<br />
		    The OnRowCreated event is triggered when the row is created, but before the data binding takes place.<br />
		    The OnRowDataBound event is triggered after the row is binded to the data.
		</span>

</asp:Content>

