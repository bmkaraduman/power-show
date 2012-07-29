<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_validation_message.aspx.cs" Inherits="Poll_aspnet_validation_message" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Validation - Custom Error Message</b></span>
    
    <br />
    <br />

    <obout:Poll runat="server" ID="Poll1" DataSourceID="SqlDataSource1"
        VotingMode="MultipleAnswers" MinAnswers="2" MaxAnswers="4"
        AnswersRangeErrorMessage="Please select between 2 and 4 answers."
        Title="Favorite Movie" Question="What is your favorite movie?" 
        AllowedVotesPerUser="100">
    </obout:Poll>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PollConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:PollConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Answers] WHERE PollID = 1"
        UpdateCommand="UPDATE Answers SET Votes = Votes + 1 WHERE AnswerID = @AnswerID" />

    <br /><br /><br />

    <div style="width: 400px;" class="tdText">
        The Poll control offers the <b>AnswersRangeErrorMessage</b> property which can be used to specify the error message that will be displayed when the number of selected answers
        is outside the range indicated by the <b>MinAnswers</b> and <b>MaxAnswers</b> properties.
    </div>
</asp:Content>

