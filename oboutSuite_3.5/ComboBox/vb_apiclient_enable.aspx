<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_apiclient_enable.aspx.vb" Inherits="ComboBox_vb_apiclient_enable" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
        function enableComboBox() {
            ComboBox1.enable();

            return false;
        }

        function disableComboBox() {
            ComboBox1.disable();

            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Client-Side API - Enable / Disable</b></span>	
    
    <br /><br />
    
   <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
    
    &#160;&#160;&#160;
    
    <obout:OboutButton ID="OboutButton1" runat="server" Text="Enable" OnClientClick="return enableComboBox();" />
    <obout:OboutButton ID="OboutButton2" runat="server" Text="Disable" OnClientClick="return disableComboBox();" />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox control provides client-side methods for enabling / disabling the control.<br /><br />
        Use the <span class="option2">enable</span> client-side method to enable the ComboBox.<br />
        Use the <span class="option2">disable</span> client-side method to disable the ComboBox.
    </span>
</asp:Content>

