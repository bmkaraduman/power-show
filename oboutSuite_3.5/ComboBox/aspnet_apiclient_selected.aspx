<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
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

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Client-Side API - Get Selected Item</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" Width="250" EmptyText="Select a customer ..."
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
        />
    
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