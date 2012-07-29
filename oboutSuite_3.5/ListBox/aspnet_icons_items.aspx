<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Items with Icons</b></span>	
    
    <br /><br />
    
    <obout:ListBox runat="server" ID="ListBox1" SelectedIndex="2" Width="175">
        <Items>
            <obout:ListBoxItem ID="ListBoxItem1" runat="server" Text="USA" Value="1" ImageUrl="resources/Images/flags/flag_usa.png" />
            <obout:ListBoxItem ID="ListBoxItem2" runat="server" Text="UK" Value="2" ImageUrl="resources/Images/flags/flag_england.png" />
            <obout:ListBoxItem ID="ListBoxItem3" runat="server" Text="Germany" Value="3" ImageUrl="resources/Images/flags/flag_germany.png" />
            <obout:ListBoxItem ID="ListBoxItem4" runat="server" Text="France" Value="4" ImageUrl="resources/Images/flags/flag_france.png" />
            <obout:ListBoxItem ID="ListBoxItem5" runat="server" Text="Russia" Value="5" ImageUrl="resources/Images/flags/flag_russia.png" />
            <obout:ListBoxItem ID="ListBoxItem6" runat="server" Text="India" Value="6" ImageUrl="resources/Images/flags/flag_india.png" />
            <obout:ListBoxItem ID="ListBoxItem7" runat="server" Text="Japan" Value="7" ImageUrl="resources/Images/flags/flag_japan.png" />
            <obout:ListBoxItem ID="ListBoxItem8" runat="server" Text="China" Value="8" ImageUrl="resources/Images/flags/flag_china.png" />
        </Items>
    </obout:ListBox>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ListBox can contain an icon next to the text. <br />
        The source of this image is specified using the <b>ImageUrl</b> property.<br /><br />
        
        <br /><br />
        
        You can display icons for items even when the ListBox is populated from a data source control.<br />
        In this case, the <b>ImageUrl</b> for each item can be set in the event handler of the <b>ItemDataBound</b> event.<br />
        
    </span>
    
</asp:Content>