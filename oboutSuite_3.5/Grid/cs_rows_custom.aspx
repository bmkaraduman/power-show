<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_rows_custom.aspx.cs" Inherits="Grid_cs_rows_custom" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Customize Individual Rows</b></span>		
	
    <br /><br />

    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
			
		<br /><br /><br />
		
		<span class="tdText">
		    You can use the OnRowCreated and OnRowDataBound events to modify the properties and values of the cells inside the Grid.<br />
		    The OnRowCreated event is triggered when the row is created, but before the data binding takes place.<br />
		    The OnRowDataBound event is triggered after the row is binded to the data.
		</span>

</asp:Content>

