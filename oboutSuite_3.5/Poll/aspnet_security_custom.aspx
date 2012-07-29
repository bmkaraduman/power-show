<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_security_custom.aspx.cs" Inherits="Poll_aspnet_security_custom" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Security - Custom</b></span>
    
    <br />
    <br />

    <obout:Poll runat="server" ID="Poll1" DataSourceID="SqlDataSource1"
        Title="Favorite Sport" Question="What is your favorite sport?"
        AllowedVotesPerUser="1" SecurityMethod="Custom" 
        OnVoted="Poll1_Voted" OnSecurityChecking="Poll1_SecurityChecking">
    </obout:Poll>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PollConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:PollConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Answers] WHERE PollID = 3"
        UpdateCommand="UPDATE Answers SET Votes = Votes + 1 WHERE AnswerID = @AnswerID" />

    <br /><br /><br />

    <div style="width: 600px;" class="tdText">
        The Poll control offers a built-in security mechanism, which can be used to prevent users from voting multiple times.
        Use the <b>AllowedVotesPerUser</b> property to indicate the number of times a user is allowed to vote and the 
        <b>SecurityMethod</b> property to indicate how the security will be handled:
        <ul>
            <li>
                <b>Cookies</b> - a cookie will be created when a user votes. The advantage of this security method is that it doesn't require any 
                coding to be performed by developers. The drawback is that the cookies are stored on the client-side (browser), and thus the users can vote 
                multiple times if they clear their cookies, use a different browser or a different computer.<br />
                Use this method for simple polls where the results are not mission-critical. This is the default security method employed by the Poll.
                <br /><br />
            </li>            
            <li>
                <b>Session</b> - a session variable will be created when a user votes. The advantage of this security method is that it doesn't require any 
                coding to be performed by developers. The drawback is that the sessions are lost when the browser is closed, and thus the users can vote 
                multiple times if they close their browser, use a different browser or a different computer.<br />
                Use this method for simple polls where the results are not mission-critical.
                <br /><br />
            </li>
            <li>
                <b>Custom</b> - the security checks will be performed by the developers, by handling the <b>SecurityChecking</b> event.
                This approach allows developers to check whether a user is allowed to vote using various approaches, like comparing the user's identity
                with the history of votes from the database, checking the user's IP address, etc. By using this security method the poll results can be more reliable
                and thus it is recommended for applications where the results are important.
            </li>
        </ul>
        This example showcases the use of the <b>Custom</b> security method. <b>AllowedVotesPerUser</b> is set to 1, 
        so you will be able to vote only once. You will be able to vote only once no matter what, 
        because the user identity (User ID) is searched in the database to see whether the current user already voted for this poll.
        For this sample, we hardcoded the User ID in the code behind class of the page, but in a real application you'll probably end up using the 
        user identity provided by the ASP.NET built-in authetication / authorization features (or the one provided by any custom auth framework that you might be using).<br /><br />
        We used the <b>Voted</b> event to store the ID of the user that performed the vote, along with the selected answer; the <b>SecurityChecking</b> event was used to check whether the current user is allowed to vote.
    </div>
</asp:Content>

