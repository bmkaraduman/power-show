<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_validation_multiple_maxanswers.aspx.cs" Inherits="Poll_aspnet_validation_multiple_maxanswers" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Validation - Multiple Votes - Max Answers</b></span>
    
    <br />
    <br />

    <div class="tdText">
        Users may select a maximum of <obout:OboutDropDownList runat="server" ID="OboutDropDownList1" AutoPostBack="true" Width="50">
            <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
        </obout:OboutDropDownList>    
        answers
    </div>

    <br />
    <br />

    <obout:Poll runat="server" ID="Poll1" DataSourceID="SqlDataSource1"
        VotingMode="MultipleAnswers" MinAnswers="1" 
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
        The Poll control offers the <b>MaxAnswers</b> property which can be used to indicate the maximum number of answers a user may select.
    </div>
</asp:Content>

