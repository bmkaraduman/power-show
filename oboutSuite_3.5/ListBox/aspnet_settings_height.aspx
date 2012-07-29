<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Height</b></span>
    
    <br /><br />
    
    <table>
        <tr>
            <td>
                <span class="tdText">auto</span>
                
                <br />
                
                <obout:ListBox runat="server" ID="ListBox1"
                    DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
                    Width="150"
                    />
            </td>
            <td width="25">&#160;</td>
            <td valign="top">
                <span class="tdText">Height="150"</span>
                
                <br />
                
                <obout:ListBox runat="server" ID="ListBox2"
                    DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
                    Width="150" Height="150"
                    />
            </td>
        </tr>
    </table>       
        
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 CountryID, CountryName FROM Country ORDER BY CountryName DESC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The <b>Height</b> property is used to control the height of the drop down menu of the ListBox.<br />
        If the property is not set, the drop down menu will expand to fit all the items in the list (no scrollbars).<br />
        If the property is set, but there are only a few items (less than the specified height), <br />
        no scrollbars will be displayed.
    </span>
</asp:Content>

