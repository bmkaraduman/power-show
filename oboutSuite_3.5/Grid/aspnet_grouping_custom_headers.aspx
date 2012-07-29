<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_grouping_custom_headers.aspx.cs" Inherits="Grid_aspnet_grouping_custom_headers" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
		.header-link, .header-link:hover, .header-link:active, .header-link:visited
		{
			color: #FFF!important;
			font-size: 10px!important;
			text-decoration: underline!important;
		}		
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Custom Data in Group Headers</b></span>		
		
	<br /><br />
		
	<obout:Grid id="Grid1" runat="server" AutoGenerateColumns="false"
		AllowAddingRecords="false" DataSourceID="sds1" ShowMultiPageGroupsInfo="false"
		OnRowDataBound="RowDataBound" AllowGrouping="true" GroupBy="CategoryID">        
		<Columns>
			<obout:Column DataField="ProductID" HeaderText="PRODUCT ID" Visible="false" ReadOnly="true" Width="150" />
			<obout:Column DataField="CategoryID" HeaderText="CATEGORY ID" Visible="false" ReadOnly="true" Width="150" />
            <obout:Column DataField="CategoryName" Width="150" Visible="false" />
			<obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" Width="150" />
			<obout:Column DataField="UnitPrice" HeaderText="PRICE" Width="150" />
			<obout:Column DataField="UnitsInStock" HeaderText="UNITS IN STOCK" Width="150" />
			<obout:Column DataField="UnitsOnOrder" HeaderText="UNITS ON ORDER" Width="150" />
		</Columns>
        <GroupingSettings AllowChanges="false" />
	</obout:Grid>
		
	<br />
	<span class="tdText">
		Developers can customize the group headers using the <b>RowDataBound</b> event.<br />
        This sample showcases the ability to display in the group header data from a different column ("CategoryName")<br />
        than the one used for grouping ("CategoryID"). Other controls (e.g. a hyper link) can be added as well.
	</span>
				
	<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 P.*, C.CategoryName FROM Products P INNER JOIN Categories C ON P.CategoryID = C.CategoryID"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		    
</asp:Content>

