<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_icons_grid.aspx.vb" Inherits="ListBox_vb_icons_grid" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .ob_iLboICBC li, .ob_iLboICBC li b, .ob_iLboICBC li.ih i
        {
            height: 50px !important;
            line-height: 50px !important;
        }
        
        .ob_iLboICBC li b img, .ob_iLboICBC li div img
        {
            margin-top: 3px !important;
            height: 45px !important;
        }
        
        .ob_iLboICBC li.ih, .ob_iLboICBC li.ih b, .ob_iLboICBC li.ih i
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ListBox - Grid-Like Multi-Columns with Icons</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 * FROM Products"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The items of the ListBox can be displayed in a grid-like structure. By using item templates, <br />
        you can display as many columns of data as you wish. A header and a footer can also be displayed, <br />
        to make the list with items look even more like a grid view.<br /><br />
        
        You can display any data field in the item template, by using the <b>Eval</b> method.<br /><br />
        
        When using this approach to display items, your end users will still benefit from the other features of the ListBox:<br />
        load on demand, virtual scrolling, etc. <br /><br />
        
        This sample shows how easy it is to add images for items in the grid-like structure.<br />
        Simply add an ASP.NET Image control in the ItemTemplate and set its ImageUrl property accordingly.
    </span>
</asp:Content>

