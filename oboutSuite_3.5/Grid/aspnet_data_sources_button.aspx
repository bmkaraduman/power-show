<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_data_sources_button.aspx.cs" Inherits="Grid_aspnet_data_sources_button" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Populate on Button Click</b></span>		
	
    <br /><br />

    <obout:OboutDropDownList runat="server" ID="CustomerId" Width="250" Height="150" DataSourceID="sds1" 
        DataTextField="CompanyName" DataValueField="CustomerID" AppendDataBoundItems="true" >
		<asp:ListItem>Select a customer ...</asp:ListItem>
	</obout:OboutDropDownList>

    <obout:OboutButton runat="server" ID="btn1" OnClick="Populate_Grid"
		    Text="Populate the Grid" />

	<br /><br /><br /><br />

    <obout:Grid id="Grid1" runat="server" Serialize="true"
        AutoGenerateColumns="false" AllowAddingRecords="false">
        <Columns>
            <obout:Column DataField="OrderID" HeaderText="ORDER ID"  />
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME" />
            <obout:Column DataField="ShipCity" HeaderText="SHIP CITY"  />
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Visible="false"/>
            <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" />
            <obout:Column AllowEdit="true" AllowDelete="true" Visible="false"/>
        </Columns>
	</obout:Grid>

    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 [CustomerID], [CompanyName] FROM Customers"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
         
    <br />

    <span class="tdText">
        The Grid doesn't need to be populated on page load. It can be populated during a postback, <br />
        in a server-side event handler. If you use the serialization feature of the Grid (<b>Serialize="true"</b>) <br />
        you need to call the <b>ClearPreviousDataSource</b> method before specifying the new data source.<br />
    </span>
</asp:Content>

