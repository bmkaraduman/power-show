<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Populating with Data - Declarative</b></span>	
    
    <br /><br />
    
    <obout:ListBox runat="server" ID="ListBox1">
        <obout:ListBoxItem ID="ListBoxItem1" runat="server" Text="Item 1" Value="1" />
        <obout:ListBoxItem ID="ListBoxItem2" runat="server" Text="Item 2" Value="2" />
        <obout:ListBoxItem ID="ListBoxItem3" runat="server" Text="Item 3" Value="3" />
        <obout:ListBoxItem ID="ListBoxItem4" runat="server" Text="Item 4" Value="4" />
        <obout:ListBoxItem ID="ListBoxItem5" runat="server" Text="Item 5" Value="5" />
    </obout:ListBox>
    
    <br /><br />
    
    <span class="tdText">
        The ListBox can be populated from various types of data sources:<br />
        
        <ul>
            <li>DataSourceControls - SqlDataSource, ObjectDataSource, LinqDataSource etc.;</li>
            <li>LINQ - LINQ queries at runtime;</li>
            <li>Collections (generic & non-generic) - IList, IEnumerable, etc.;</li>
            <li>DataSet / DataTable;</li>
            <li>Declarative</li>
        </ul>
        
        <br />
        
        The ListBox presented in this sample is populated declaratively.
    </span>
    
</asp:Content>