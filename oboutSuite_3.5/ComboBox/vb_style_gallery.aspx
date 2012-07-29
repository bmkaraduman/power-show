<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_style_gallery.aspx.vb" Inherits="ComboBox_vb_style_gallery" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Style Gallery</b></span>
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
    
    <br /><br />
    
    <span class="tdText">
        The ComboBox comes with predefined styles which are suited for most page layouts.<br /><br />
        The styles can be switched easily using the <b>FolderStyle</b> property, which needs to contain<br />
        the relative path to the folder containing the style to be used.
    </span>
</asp:Content>

