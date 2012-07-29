<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="cs_validation_multiple_minanswers.aspx.cs" Inherits="Poll_cs_validation_multiple_minanswers" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Validation - Multiple Votes - Min Answers</b></span>
    
    <br />
    <br />

    <div class="tdText">
        Users should select at least <obout:OboutDropDownList runat="server" ID="OboutDropDownList1" AutoPostBack="true" Width="50">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
        </obout:OboutDropDownList>    
        answers
    </div>

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


    

 