<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_filtering.aspx.vb" Inherits="ComboBox_vb_filtering" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Filtering</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
       
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br /><br />
    
    <span class="tdText">
        The filtering feature of the ComboBox enables end users to search items in the list very fast.<br />
        As soon as the user types something, the ComboBox will display only the items that match the filter being used.<br />
        The filtering operation is performed on the client-side and thus it is extremly fast.<br /><br />
        
        To enable the filtering feature, you need to use the <b>FilterType</b> property. <br />
        This property can be set to one of the following values:<br />
        <ul>
            <li><b>None</b> - the default value; all items will be displayed in the list.</li>
            <li><b>StartsWith</b> - only the items that start with the text typed in the input field will be displayed in the list.</li>
            <li><b>Contains</b> - only the items that contain the text typed in the input field will be displayed in the list.</li>
        </ul>
    </span>
</asp:Content>

