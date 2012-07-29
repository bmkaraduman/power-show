<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_apiclient_selected.aspx.vb" Inherits="ComboBox_vb_apiclient_selected" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
        function getSelectedItem() {
            if(ComboBox1.selectedIndex() != -1) {
                alert('Selected item: ' + ComboBox1.options[ComboBox1.selectedIndex()].text);
            } else {
                alert('No selected item.');
            }
        
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Client-Side API - Get Selected Item</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
    
    
    <obout:OboutButton ID="OboutButton1" runat="server" Text="Get Selected Item" OnClientClick="return getSelectedItem();" />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox control provides client-side properties / methods for setting / getting the selected item.<br /><br />
        Use the <span class="option2">selectedIndex</span> client-side method to get / set the selected index.<br />
        Use the <span class="option2">options</span> collection to get the text / value of the selected item.
    </span>
</asp:Content>

