<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_selection_multi_get.aspx.cs" Inherits="ComboBox_cs_selection_multi_get" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Get Selected Items</b></span>	
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
        
    <obout:OboutButton runat="server" Text="Get Selected Item" OnClick="Postback" />
    
    <span class="tdText">
        <asp:Literal runat="server" ID="Details" />
    </span>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        When using the multi item selection feature, if you need to get the selected items from the ComboBox, <br />        
        you need to loop through the <b>Items</b> collection of the ComboBox and check the <b>Selected</b> property of each item.<br />
        The currently selected items have their <b>Selected</b> property set to <span class="option2">true</span>.
    </span>
</asp:Content>

