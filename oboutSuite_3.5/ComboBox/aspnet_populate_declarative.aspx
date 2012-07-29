<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Populating with Data - Declarative</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1">
        <obout:ComboBoxItem ID="ComboBoxItem1" runat="server" Text="Item 1" Value="1" />
        <obout:ComboBoxItem ID="ComboBoxItem2" runat="server" Text="Item 2" Value="2" />
        <obout:ComboBoxItem ID="ComboBoxItem3" runat="server" Text="Item 3" Value="3" />
        <obout:ComboBoxItem ID="ComboBoxItem4" runat="server" Text="Item 4" Value="4" />
        <obout:ComboBoxItem ID="ComboBoxItem5" runat="server" Text="Item 5" Value="5" />
    </obout:ComboBox>
    
    <br /><br />
    
    <span class="tdText">
        The ComboBox can be populated from various types of data sources:<br />
        
        <ul>
            <li>DataSourceControls - SqlDataSource, ObjectDataSource, LinqDataSource etc.;</li>
            <li>LINQ - LINQ queries at runtime;</li>
            <li>Collections (generic & non-generic) - IList, IEnumerable, etc.;</li>
            <li>DataSet / DataTable;</li>
            <li>Declarative</li>
        </ul>
        
        <br />
        
        The ComboBox presented in this sample is populated declaratively.
    </span>
    
</asp:Content>