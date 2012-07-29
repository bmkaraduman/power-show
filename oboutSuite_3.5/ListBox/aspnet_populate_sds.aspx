<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Populating with Data - SqlDataSource</b></span>	
    
    <br /><br />
    
    <obout:ListBox runat="server" ID="ListBox1" 
        DataSourceID="sds1" DataValueField="CountryID" DataTextField="CountryName" />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CountryID, CountryName FROM Country ORDER BY CountryName DESC"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>	
    
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
        
        The ListBox presented in this sample is populated from a <b>SqlDataSource</b> control.<br />
        This is done by setting the <b>DataSourceID</b> property of the ListBox to be the ID <br />
        of the SqlDataSource control. Also, the <b>DataValueField</b> and <b>DataTextField</b> properties<br />
        need to be used to specify the name of the database fields that will be used to populate the <br />
        Value and Text properties of the generated ListBoxItems.
    </span>
    
</asp:Content>