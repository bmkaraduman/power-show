<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_save_voting.aspx.cs" Inherits="Poll_aspnet_save_voting" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Save Votes - Voting Event</b></span>
    
    <br />
    <br />

    <obout:Poll runat="server" ID="Poll1" DataSourceID="SqlDataSource1"
        Title="Favorite Movie" Question="What is your favorite movie?" 
        AllowedVotesPerUser="100" OnVoting="Poll1_Voting">
    </obout:Poll>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PollConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:PollConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Answers] WHERE PollID = 1" />

    <br /><br /><br />

    <div style="width: 400px;" class="tdText">
        The <b>Voting</b> event may be employed to save the vote into the database.
    </div>
</asp:Content>

