<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_icons_grid.aspx.cs" Inherits="ComboBox_cs_icons_grid" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .ob_iCboICBC li, .ob_iCboICBC li b, .ob_iCboICBC li.ih i
        {
            height: 50px !important;
            line-height: 50px !important;
        }
        
        .ob_iCboICBC li b img, .ob_iCboICBC li div img
        {
            margin-top: 3px !important;
            height: 45px !important;
        }
        
        .ob_iCboICBC li.ih, .ob_iCboICBC li.ih b, .ob_iCboICBC li.ih i
        {
            background-image: none !important;
            background-color: #CEF0F9 !important;
        }
        
        .item
        {
            position: relative !important;
            display:-moz-inline-stack;
            display:inline-block;
            zoom:1;
            *display:inline;
            overflow: hidden;
            white-space: nowrap;
            height: 50px;
        }
        
        .header
        {
            margin-left: 2px;
        }
   
        .c1
        {
            width: 45px;
        }
        
        .c2
        {
            margin-left: 10px;
            width: 180px;
        }
        
        .c3
        {
            margin-left: 10px;
            width: 90px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Grid-Like Multi-Columns with Icons</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 * FROM Products"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be displayed in a grid-like structure. By using item templates, <br />
        you can display as many columns of data as you wish. A header and a footer can also be displayed, <br />
        to make the list with items look even more like a grid view.<br /><br />
        
        You can display any data field in the item template, by using the <b>Eval</b> method.<br /><br />
        
        When using this approach to display items, your end users will still benefit from the other features of the ComboBox:<br />
        autocomplete, load on demand, virtual scrolling, filtering, etc. <br /><br />
        
        This sample shows how easy it is to add images for items in the grid-like structure.<br />
        Simply add an ASP.NET Image control in the ItemTemplae and set its ImageUrl property accordingly.
    </span>
    
</asp:Content>