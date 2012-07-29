<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_settings_autovalidate.aspx.vb" Inherits="ComboBox_vb_settings_autovalidate" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - AutoValidate</b></span>
    
    <br /><br />
    
    <obout:OboutCheckBox runat="server" ID="OboutCheckBox1" 
        Text="Auto Validate" AutoPostBack="true" Checked="true" OnCheckedChanged="OboutCheckBox1_CheckedChanged" /> 
        
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers ORDER BY CompanyName DESC"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        By default, the ComboBox persists the last auto completed item when the Enter or Tab keys are pressed.<br />
        If the ComboBox loses the focus before one of these two keys is pressed, the last selected item will be reselected.<br />
        If you want to allow end users to persists items also when the focus is lost (e.g. when clicking outside the ComboBox),<br />
        you can set the <b>AutoValidate</b> property to <span class="option2">true</span>.
    </span>
</asp:Content>

