<%@ Page Title="" Language="VB" AutoEventWireup="true" MasterPageFile="~/Poll/Poll.master" CodeFile="vb_populate_manual.aspx.vb" Inherits="Poll_vb_populate_manual" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Populate with Items - Manual</b></span>
    
    <br />
    <br />

    <asp:PlaceHolder ID="phPoll1" runat="server"></asp:PlaceHolder>  

    <br /><br /><br />

    <div style="width: 400px;" class="tdText">
        The Poll can be manually populated with items using the <b>Items</b> collection. The results can be stored in the Application State object.
    </div>
</asp:Content>

 
