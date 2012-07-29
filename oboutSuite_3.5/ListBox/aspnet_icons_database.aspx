<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="aspnet_icons_database.aspx.cs" Inherits="ListBox_aspnet_icons_database" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Load Items with Icons from Database</b></span>	
    
    <br /><br />
    
    <obout:ListBox runat="server" ID="ListBox1" Width="200" OnItemDataBound="ListBox1_ItemDataBound" 
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"  />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName, Country FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ListBox can contain an icon next to the text. <br />
        The source of this image is specified using the <b>ImageUrl</b> property.<br /><br />
        
        <br /><br />
        
        You can display icons for items even when the ListBox is populated from a data source control.<br />
        In this case, the <b>ImageUrl</b> for each item can be set in the event handler of the <b>ItemDataBound</b> event.<br />
    </span>
    
</asp:Content>