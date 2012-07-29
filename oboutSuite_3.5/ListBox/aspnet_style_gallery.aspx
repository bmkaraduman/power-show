<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="aspnet_style_gallery.aspx.cs" Inherits="ListBox_aspnet_selection_retrieve" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Style Gallery</b></span>
    
    <br /><br />
    
    <obout:ListBox runat="server" ID="ListBox1"
        AutoPostBack="true" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged">
        <Items>
            <obout:ListBoxItem ID="ListBoxItem1" runat="server" Text="black_glass" />
            <obout:ListBoxItem ID="ListBoxItem2" runat="server" Text="grand_gray" />
            <obout:ListBoxItem ID="ListBoxItem4" runat="server" Text="plain" />
            <obout:ListBoxItem ID="ListBoxItem3" runat="server" Text="premiere_blue" />
        </Items>
    </obout:ListBox>
    
    <br /><br />
    
    <span class="tdText">
        The ListBox comes with predefined styles which are suited for most page layouts.<br /><br />
        The styles can be switched easily using the <b>FolderStyle</b> property, which needs to contain<br />
        the relative path to the folder containing the style to be used.
    </span>
</asp:Content>

