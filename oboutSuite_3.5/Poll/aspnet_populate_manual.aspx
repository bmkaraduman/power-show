<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_populate_manual.aspx.cs" Inherits="Poll_aspnet_populate_manual" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Populate with Items - Manual</b></span>
    
    <br />
    <br />

    <obout:Poll runat="server" ID="Poll1"
        VotingMode="SingleAnswer" MinAnswers="1"
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
        The Poll can be manually populated with items using the <b>Items</b> collection. The results can be stored in the Application State object.
    </div>
</asp:Content>

