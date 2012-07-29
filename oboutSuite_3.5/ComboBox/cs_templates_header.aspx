<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_templates_header.aspx.cs" Inherits="ComboBox_cs_templates_header" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <style type="text/css">
        .header
        {
            display: block !important;
            text-decoration: underline;
        }
    </style>

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Header Templates</b></span>	
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />        
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName, Country FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox provides a way to customize the header of the drop down menu, by using the <b>HeaderTemplate</b> property. <br />
        You can embed any content inside the header template, including HTML markup and ASP.NET server controls <br />
        (any control from the Obout suite may be added to the header template).<br /><br />
    </span>
    
</asp:Content>