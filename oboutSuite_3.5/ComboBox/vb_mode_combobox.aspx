<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_mode_combobox.aspx.vb" Inherits="ComboBox_vb_mode_combobox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ComboBox - ComboBox Mode</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td>
                <span class="tdText">ComboBox:</span><br />
                 <asp:PlaceHolder runat="server" ID="ComboBox1Container" />     
                
            </td>
            <td width="20">&#160;</td>
            <td>
                <span class="tdText">ComboBox with Multi-Item Selection:</span><br />
                 <asp:PlaceHolder runat="server" ID="ComboBox2Container" />     
               
            </td>
            <td width="20">&#160;</td>
            <td>
                <span class="tdText">ComboBox with Load on Demand & Virtual Scrolling:</span><br />
                <asp:PlaceHolder runat="server" ID="ComboBox3Container" />     
               
            </td>
        </tr>
    </table>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox can work in two modes, which can be configured using the <b>Mode</b> property.
        
        <ul>
            <li>
                <span class="option2">ComboBox</span> - this is the default mode; only the input field is initially visible, <br />
                and the end users have the ability to open the drop down menu with items by clicking <br />
                on the arrow button on the right side of the input field.
            </li>
            <li>
                <span class="option2">TextBox</span> - works similar to the ComboBox mode, but it doesn't render the arrow button <br />
                for opening the drop down menu with items.
            </li>
        </ul>
    </span>
</asp:Content>

