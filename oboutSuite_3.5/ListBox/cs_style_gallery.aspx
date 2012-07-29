<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="cs_style_gallery.aspx.cs" Inherits="ListBox_cs_style_gallery" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Style Gallery</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ListBox1Container" />  
    
    
    <br /><br />
    
    <span class="tdText">
        The ListBox comes with predefined styles which are suited for most page layouts.<br /><br />
        The styles can be switched easily using the <b>FolderStyle</b> property, which needs to contain<br />
        the relative path to the folder containing the style to be used.
    </span>
</asp:Content>

