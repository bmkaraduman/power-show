<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_style_gallery.aspx.cs" Inherits="ComboBox_aspnet_selection_retrieve" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Style Gallery</b></span>
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" AllowEdit="false"
        AutoPostBack="true" OnSelectedIndexChanged="ComboBox1_SelectedIndexChanged">
        <Items>
            <obout:ComboBoxItem ID="ComboBoxItem1" runat="server" Text="black_glass" />
            <obout:ComboBoxItem ID="ComboBoxItem2" runat="server" Text="grand_gray" />
            <obout:ComboBoxItem ID="ComboBoxItem4" runat="server" Text="plain" />
            <obout:ComboBoxItem ID="ComboBoxItem3" runat="server" Text="premiere_blue" />
        </Items>
    </obout:ComboBox>
    
    <br /><br />
    
    <span class="tdText">
        The ComboBox comes with predefined styles which are suited for most page layouts.<br /><br />
        The styles can be switched easily using the <b>FolderStyle</b> property, which needs to contain<br />
        the relative path to the folder containing the style to be used.
    </span>
</asp:Content>

