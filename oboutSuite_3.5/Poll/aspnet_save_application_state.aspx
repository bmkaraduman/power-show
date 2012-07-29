<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_save_application_state.aspx.cs" Inherits="Poll_aspnet_save_application_state" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Save Votes - Application State</b></span>
    
    <br />
    <br />

    <obout:Poll runat="server" ID="Poll1"
        Title="Favorite Programming Language" Question="What is your favorite programming language?" 
        AllowedVotesPerUser="100">
        <Items>
            <obout:PollItem Text="C#" />
            <obout:PollItem Text="Java" />
            <obout:PollItem Text="JavaScript" />
            <obout:PollItem Text="Perl" />
            <obout:PollItem Text="PHP" />
            <obout:PollItem Text="Ruby" />
            <obout:PollItem Text="VB" />
        </Items>
    </obout:Poll>

    <br /><br /><br />

    <div style="width: 400px;" class="tdText">
        By default, if no DataSourceControl is used and if the Voting event is not handled, the votes will be stored in the Application State object.
    </div>
</asp:Content>

