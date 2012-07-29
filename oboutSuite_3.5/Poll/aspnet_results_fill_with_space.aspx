<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_results_fill_with_space.aspx.cs" Inherits="Poll_aspnet_results_fill_with_space" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Results - Fill With Empty Space</b></span>
    
    <br />
    <br />

    <obout:OboutCheckBox runat="server" ID="OboutCheckBox1" Text="Fill With Empty Space" AutoPostBack="true" />

    <br />
    <br />

    <obout:Poll runat="server" ID="Poll1" DataSourceID="SqlDataSource1"
        VotingMode="SingleAnswer" CurrentMode="Results"
        Title="Favorite Movie" Question="What is your favorite movie?" 
        AllowedVotesPerUser="100">
        <ResultStyle DisplayVotes="true" />
    </obout:Poll>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PollConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:PollConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Answers] WHERE PollID = 1"
        UpdateCommand="UPDATE Answers SET Votes = Votes + 1 WHERE AnswerID = @AnswerID" />

    <br /><br /><br />

    <div style="width: 450px;" class="tdText">
        Use the <b>ResultStyle.FillWithEmptySpace</b> property to indicate whether the results should be filled with empty space.
    </div>

</asp:Content>

