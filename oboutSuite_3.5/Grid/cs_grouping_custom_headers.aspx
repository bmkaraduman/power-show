<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_grouping_custom_headers.aspx.cs" Inherits="Grid_cs_grouping_custom_headers" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
		.header-link, .header-link:hover, .header-link:active, .header-link:visited
		{
			color: #FFF!important;
			font-size: 10px!important;
			text-decoration: underline!important;
		}		
	</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Custom Data in Group Headers</b></span>		
		
	<br /><br />
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

	<br />
	<span class="tdText">
		Developers can customize the group headers using the <b>RowDataBound</b> event.<br />
        This sample showcases the ability to display in the group header data from a different column ("CategoryName")<br />
        than the one used for grouping ("CategoryID"). Other controls (e.g. a hyper link) can be added as well.
	</span>
				
	<asp:SqlDataSource runat="server" ID="SqlDataSource1" SelectCommand="SELECT TOP 25 P.*, C.CategoryName FROM Products P INNER JOIN Categories C ON P.CategoryID = C.CategoryID"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		    
</asp:Content>


       
	