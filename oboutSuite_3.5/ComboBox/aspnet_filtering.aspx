<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Filtering</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" Width="300" Height="200"
        FilterType="StartsWith" EmptyText="Search for customers ..."
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
        />    
    
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