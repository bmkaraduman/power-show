<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Autocomplete</b></span>	
    
    <br /><br />
    
    <span class="tdText">Select a customer:</span><br />
    <obout:ComboBox runat="server" ID="ComboBox1" Width="300" Height="200"
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
        />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox control provides the autocomplete feature, which assists the end users in finding items faster.<br />
        As soon as the user types something, the ComboBox will locate the first matching item (in alphabetical order) and it will autocomplete it.<br /><br />
        The autocomplete operation is performed on the client-side and thus it is extremly fast.
    </span>
    
</asp:Content>