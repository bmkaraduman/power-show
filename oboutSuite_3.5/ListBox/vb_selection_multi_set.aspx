<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_selection_multi_set.aspx.vb" Inherits="ListBox_vb_selection_multi_set" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ListBox - Set Selected Items</b></span>	
    
    <br /><br />
    
    <table>    
        <tr>
            <td>
                <span class="tdText">SelectedIndexes="3,4,5"</span><br />
                <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
                
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">SelectedValue="ANATR,ALFKI,AROUT"</span><br />
                <asp:PlaceHolder runat="server" ID="ListBox2Container" /> 
                
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Item.Selected = true;</span><br />
                <asp:PlaceHolder runat="server" ID="ListBox3Container" /> 
                
            </td>
        </tr>
    </table>    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 25 CustomerID, CompanyName FROM Customers"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides multiple ways to set the initial selected items (for multi-item selection):<br />
        
        <ul>
            <li><b>SelectedIndexes</b> - the comma separated indexes of the items to be selected.</li>
            <li><b>SelectedValue</b> - the values of the items to be selected (the values need to be separated <br />using the character specified in the MultiSelectionSeparator property - comma by default).</li>
            <li><b>Selected</b> - this is a property of the ListBoxItem class. If set to true, the item will be selected.</li>
        </ul>
    </span>
</asp:Content>

