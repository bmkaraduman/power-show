<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_icons_database.aspx.cs" Inherits="ComboBox_aspnet_icons_database" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Load Items with Icons from Database</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" Width="200" MenuWidth="300" OnItemDataBound="ComboBox1_ItemDataBound" ShowSelectedImage="true"
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID" EmptyText="Select a customer ..." />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName, Country FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can contain an icon next to the text. <br />
        The source of this image is specified using the <b>ImageUrl</b> property.<br /><br />
        
        The icon of the selected item can be displayed in the input field of the ComboBox, <br />
        by setting the <b>ShowSelectedImage</b> property to <span class="option2">true</span>.
        
        <br /><br />
        
        You can display icons for items even when the ComboBox is populated from a data source control.<br />
        In this case, the <b>ImageUrl</b> for each item can be set in the event handler of the <b>ItemDataBound</b> event.<br />
    </span>
    
</asp:Content>