<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_templates_item.aspx.vb" Inherits="ComboBox_vb_templates_item" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
          .template-name
        {
            text-decoration: underline;
        }
        
        .template-country
        {
            font-style: italic;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
 <span class="tdText"><b>ASP.NET ComboBox - Item Templates</b></span>	
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName, Country FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be customized using templates. You can embed any content inside an item template, <br />
        including HTML markup and ASP.NET server controls (any control from the Obout suite may be added to a template).<br /><br />
        
        In order to set up an item template, use the <b>ItemTemplate</b> property of the ComboBox.<br />
        To extract data from the data item, use the <b>Eval</b> method which expects as a parameter <br />
        the name of the data field from which to load the data.
    </span>
</asp:Content>

