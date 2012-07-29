<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_commands_addonly.aspx.cs" Inherits="SuperForm_cs_commands_addonly" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Add-Only Form</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />
    
    <asp:Panel runat="server" ID="MessagePanel" Visible="false" CssClass="tdText">
        The new order has been saved to the database. <br /><br />
        Thank You!
    </asp:Panel>

    <br /><br />
    
    <span class="tdText">
        The Super Form can be used as an add-only form. In such scenario it doesn't need to be bound to a DataSourceControl.<br />
        You can handle the data provided by the end users in the <b>ItemInserting</b> server-side event.<br />
    </span>
</asp:Content>

