<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="cs_apiserver_enable.aspx.cs" Inherits="ListBox_cs_apiserver_enable" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Server-Side API - Enable / Disable</b></span>
    
    <br /><br />
     <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
   
    
    &#160;&#160;&#160;
    
    <obout:OboutButton ID="OboutButton1" runat="server" Text="Enable" OnClick="ListBox1_Enable" />
    <obout:OboutButton ID="OboutButton2" runat="server" Text="Disable" OnClick="ListBox1_Disable" />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides a property for enabling / disabling the control.<br /><br />
        Set the <b>Enabled</b> property to <span class="option2">true</span> to enable the ListBox.<br />
        Set the <b>Enabled</b> property to <span class="option2">false</span> to disable the ListBox.
    </span>
</asp:Content>

