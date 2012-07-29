<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_apiserver_tooltips.aspx.cs" Inherits="ComboBox_aspnet_apiserver_tooltips" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Server-Side API - Tooltips</b></span>
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" Width="250" EmptyText="Select a customer ..."
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID" ToolTip="Select a customer"
        OnItemDataBound="ComboBox1_ItemDataBound"
        />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox and its items provide support for tooltips, which can be used to provide additional information for end users.<br />
        To add a tooltip to the input field of a ComboBox, use the <b>ToolTip</b> property of the ComboBox class.<br />
        To add a tooltip to an item, use the <b>ToolTip</b> property of the ComboBoxItem class.<br /><br />

        When populating the ComboBox from a data source you can use the <b>ItemDataBound</b> event to assign a tooltip<br />
        to each individual item from the list (as we did in this sample).
    </span>
</asp:Content>

