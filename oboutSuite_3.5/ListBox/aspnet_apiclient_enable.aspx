<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function enableListBox() {
            ListBox1.enable();

            return false;
        }

        function disableListBox() {
            ListBox1.disable();

            return false;
        }
    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Client-Side API - Enable / Disable</b></span>	
    
    <br /><br />
    
    <obout:ListBox runat="server" ID="ListBox1" Width="250"
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
        />
    
    &#160;&#160;&#160;
    
    <obout:OboutButton ID="OboutButton1" runat="server" Text="Enable" OnClientClick="return enableListBox();" />
    <obout:OboutButton ID="OboutButton2" runat="server" Text="Disable" OnClientClick="return disableListBox();" />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides client-side methods for enabling / disabling the control.<br /><br />
        Use the <span class="option2">enable</span> client-side method to enable the ListBox.<br />
        Use the <span class="option2">disable</span> client-side method to disable the ListBox.
    </span>
    
</asp:Content>