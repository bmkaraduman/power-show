<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_mode_combobox.aspx.cs" Inherits="ComboBox_aspnet_mode_textbox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - ComboBox Mode</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td>
                <span class="tdText">ComboBox:</span><br />
                <obout:ComboBox runat="server" ID="ComboBox1" Width="250" Height="200"
                    Mode="ComboBox" EmptyText="Select a customer ..."
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
                    />
            </td>
            <td width="20">&#160;</td>
            <td>
                <span class="tdText">ComboBox with Multi-Item Selection:</span><br />
                <obout:ComboBox runat="server" ID="ComboBox2" Width="250" Height="200"
                    Mode="ComboBox" SelectionMode="Multiple" EmptyText="Select a customer ..."
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
                    />
            </td>
            <td width="20">&#160;</td>
            <td>
                <span class="tdText">ComboBox with Load on Demand & Virtual Scrolling:</span><br />
                <obout:ComboBox runat="server" ID="ComboBox3" Width="250" Height="200"
                    Mode="ComboBox" EmptyText="Select a country ..."
                    EnableLoadOnDemand="true" EnableVirtualScrolling="true" 
                    OnLoadingItems="ComboBox3_LoadingItems">
                    <FooterTemplate>
                        Displaying items <%# Container.ItemsCount > 0 ? "1" : "0" %>-<%# Container.ItemsLoadedCount %> out of <%# Container.ItemsCount %>.
                    </FooterTemplate>
                </obout:ComboBox>
            </td>
        </tr>
    </table>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox can work in two modes, which can be configured using the <b>Mode</b> property.
        
        <ul>
            <li>
                <span class="option2">ComboBox</span> - this is the default mode; only the input field is initially visible, <br />
                and the end users have the ability to open the drop down menu with items by clicking <br />
                on the arrow button on the right side of the input field.
            </li>
            <li>
                <span class="option2">TextBox</span> - works similar to the ComboBox mode, but it doesn't render the arrow button <br />
                for opening the drop down menu with items.
            </li>
        </ul>
    </span>
    
</asp:Content>