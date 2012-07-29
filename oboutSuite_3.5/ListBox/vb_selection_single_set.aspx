<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_selection_single_set.aspx.vb" Inherits="ListBox_vb_selection_single_set" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ListBox - Set Selected Item</b></span>	
    
    <br /><br />
    
    <table>    
        <tr>
            <td>
                <span class="tdText">SelectedIndex="2"</span><br />
                <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
                
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">SelectedValue="ALFKI"</span><br />
                <asp:PlaceHolder runat="server" ID="ListBox2Container" /> 
               
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Item.Selected = true;</span><br />
                <asp:PlaceHolder runat="server" ID="ListBox3Container"  /> 
                
            </td>
        </tr>
    </table>    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 25 CustomerID, CompanyName FROM Customers"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides multiple ways to set the initial selected item:<br />
        
        <ul>
            <li><b>SelectedIndex</b> - the index of the item to be selected.</li>
            <li><b>SelectedValue</b> - the value of the item to be selected.</li>
            <li><b>Selected</b> - this is a property of the ListBoxItem class. If set to true, the item will be selected.</li>
        </ul>
    </span>
</asp:Content>

