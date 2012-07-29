<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_customization_align.aspx.cs" Inherits="ComboBox_cs_settings_width" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Aligning Items</b></span>	
    
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
                <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
            </td>
            <td class="tdText">
                <asp:PlaceHolder runat="server" ID="ComboBox2Container" />
            </td>
            <td class="tdText">
                <asp:PlaceHolder runat="server" ID="ComboBox3Container" />
            </td>
        </tr>
    </table>

    <br /><br />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <span class="tdText">
        The alignment of the ComboBox items can easily be changed using CSS.<br />
        This example showcases the use of three ComboBox controls with different alignment types for their items.<br />
    </span>
	
<style type="text/css">
.center .ob_iCboICBC li b {
	text-align: center !important;
}
.right .ob_iCboICBC li b {
	text-align: right !important;
}
</style>
</asp:Content>