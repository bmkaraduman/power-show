<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_icons_items.aspx.cs" Inherits="ComboBox_cs_icons_items" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Items with Icons</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td>
                <span class="tdText">ShowSelectedImage="false"</span><br />
                <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
                
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">ShowSelectedImage="true"</span><br />
                <asp:PlaceHolder runat="server" ID="ComboBox2Container" />
               
            </td>
        </tr>
    </table>    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can contain an icon next to the text. <br />
        The source of this image is specified using the <b>ImageUrl</b> property.<br /><br />
        
        The icon of the selected item can be displayed in the input field of the ComboBox, <br />
        by setting the <b>ShowSelectedImage</b> property to <span class="option2">true</span>.
        
        <br /><br />
        
        You can display icons for items even when the ComboBox is populated from a data source control.<br />
        In this case, the <b>ImageUrl</b> for each item can be set in the event handler of the <b>ItemDataBound</b> event.<br />
        
    </span>
    
</asp:Content>