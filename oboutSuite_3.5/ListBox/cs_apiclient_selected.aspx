<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" CodeFile="cs_apiclient_selected.aspx.cs" Inherits="ListBox_cs_apiclient_selected"%>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function getSelectedItem() {
            if(ListBox1.selectedIndex() != -1) {
                alert('Selected item: ' + ListBox1.options[ListBox1.selectedIndex()].text);
            } else {
                alert('No selected item.');
            }
        
            return false;
        }
    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Client-Side API - Get Selected Item</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
    
    
    <obout:OboutButton ID="OboutButton1" runat="server" Text="Get Selected Item" OnClientClick="return getSelectedItem();" />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides client-side properties / methods for setting / getting the selected item.<br /><br />
        Use the <span class="option2">selectedIndex</span> client-side method to get / set the selected index.<br />
        Use the <span class="option2">options</span> collection to get the text / value of the selected item.
    </span>
    
</asp:Content>