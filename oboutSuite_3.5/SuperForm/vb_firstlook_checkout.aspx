<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_firstlook_checkout.aspx.vb" Inherits="SuperForm_vb_firstlook_checkout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

    
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    
    <span class="tdText"><b>ASP.NET Super Form - Checkout</b></span>
    
    <br /><br />

    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:Panel runat="server" ID="MessagePanel" Visible="false" CssClass="tdText">
        Thank you for your order. <br /><br />
        You will receive an e-mail confirmation soon.
    </asp:Panel>

    <asp:SqlDataSource ID="CountriesDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:CountriesConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CountriesConnectionString.ProviderName %>"
        SelectCommand="SELECT CountryID, CountryName FROM Country ORDER BY CountryName ASC" />

    <asp:ObjectDataSource ID="StatesDataSource" runat="server" TypeName="State" SelectMethod="GetStates" />

    <br /><br />
    
    <span class="tdText">
        The Super Form exposes many built-in features that allow developers to quickly generate complex forms <br />
        without writing any line of code (everything can be done at design time).

        Some of the features showcased in this example are:<br />

        <ul>
            <li>Generation of Interface Controls instead of standard ASP.NET input fields;</li>
            <li>Built-in validation;</li>
            <li>Support for edit masks & filters;</li>
            <li>Ability to group fields into field sets;</li>
            <li>Horizontal or vertical direction for fields.</li>
        </ul>
    </span>
</asp:Content>

