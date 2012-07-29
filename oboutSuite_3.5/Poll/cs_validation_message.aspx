<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="cs_validation_message.aspx.cs" Inherits="Poll_cs_validation_message" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Validation - Custom Error Message</b></span>
    
    <br />
    <br />

    <asp:PlaceHolder ID="phPoll1" runat="server"></asp:PlaceHolder>
    
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


    

 