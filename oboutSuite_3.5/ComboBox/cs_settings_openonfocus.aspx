<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_settings_openonfocus.aspx.cs" Inherits="ComboBox_cs_settings_openonfocus" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - OpenOnFocus</b></span>
    
    <br /><br />
    
    <obout:OboutCheckBox runat="server" ID="OboutCheckBox1" 
        Text="Open On Focus" AutoPostBack="true" Checked="true" OnCheckedChanged="OboutCheckBox1_CheckedChanged" /> 
        
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" /> 
   
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        By default, the ComboBox expands its drop down menu when the input field receives the focus.<br />
        This behavior can be changed, by using the <b>OpenOnFocus</b> property. If it's set to false, <br />
        the drop down menu can be expanded only by clicking the arrow button next to the input field.
    </span>
</asp:Content>

