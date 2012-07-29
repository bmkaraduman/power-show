<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_customization_align.aspx.vb" Inherits="ListBox_vb_apiserver_events" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Aligning Items</b></span>	
    
    <br /><br />

    <table>
        <tr>
            <td class="tdText">
                Left
            </td>
            <td class="tdText">
                Center
            </td>
            <td class="tdText">
                Right
            </td>
        </tr>
        <tr>
            <td class="tdText">
                <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
            </td>
            <td class="tdText">
                <asp:PlaceHolder runat="server" ID="ListBox2Container" />  
            </td>
            <td class="tdText">
                <asp:PlaceHolder runat="server" ID="ListBox3Container" /> 
            </td>
        </tr>
    </table>

    <br /><br />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <span class="tdText">
        The alignment of the ListBox items can easily be changed using CSS.<br />
        This example showcases the use of three ListBox controls with different alignment types for their items.<br />
    </span>
	
<style type="text/css">
.center .ob_iLboICBC li b {
	text-align: center !important;
}
.right .ob_iLboICBC li b {
	text-align: right !important;
}
</style>
</asp:Content>