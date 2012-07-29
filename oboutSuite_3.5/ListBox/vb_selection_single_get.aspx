<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_selection_single_get.aspx.vb" Inherits="ListBox_vb_selection_single_get" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Get Selected Item</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
    
        
    <obout:OboutButton ID="OboutButton1" runat="server" Text="Get Selected Item" OnClick="Postback" />
    
    <span class="tdText">
        <asp:Literal runat="server" ID="Literal1" />
    </span>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides three properties that assist you in retrieving information about the selected item:<br />
        
        <ul>
            <li><b>SelectedIndex</b> - the index of the selected item.</li>
            <li><b>SelectedValue</b> - the value of the selected item.</li>
            <li><b>SelectedText</b> - the text of the selected item.</li>
        </ul>
        
        <br />
        
        You can also loop through the <b>Items</b> collection of the ListBox and check the <b>Selected</b> property of each item.<br />
        The currently selected item has its <b>Selected</b> property set to <span class="option2">true</span>.
    </span>
</asp:Content>

