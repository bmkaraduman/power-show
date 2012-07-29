<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="cs_populate_runtime.aspx.cs" Inherits="Poll_cs_populate_runtime" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Populate with Items - At Runtime</b></span>
    
    <br />
    <br />

    <asp:PlaceHolder ID="phPoll1" runat="server"></asp:PlaceHolder>
    
    <br /><br /><br />

    <div style="width: 400px;" class="tdText">
        The Poll can be manually populated with items using the <b>Items</b> collection. The results can be stored in the Application State object.
    </div>
</asp:Content>
   
    

    

 