<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="cs_save_application_state.aspx.cs" Inherits="Poll_cs_save_application_state" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Save Votes - Application State</b></span>
    
    <br />
    <br />
 
    <asp:PlaceHolder ID="phPoll1" runat="server"></asp:PlaceHolder>
    
    <br /><br /><br />

    <div style="width: 400px;" class="tdText">
        By default, if no DataSourceControl is used and if the Voting event is not handled, the votes will be stored in the Application State object.
    </div>
</asp:Content>

 