<%@ Page Title="" Language="VB" AutoEventWireup="true" MasterPageFile="~/Poll/Poll.master" CodeFile="vb_validation_single_minanswers.aspx.vb" Inherits="Poll_vb_validation_single_minanswers" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Validation - Single Vote - Min Answers</b></span>
    
    <br />
    <br />

    <obout:OboutCheckBox runat="server" ID="OboutCheckBox1" Text="Users need to select an answer" Checked="true" AutoPostBack="true" />    

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
        The Poll control offers the <b>MinAnswers</b> property which can be used to indicate the minimum number of answers a user is required to select.
        For Polls using the single answer voting mode the possible values for <b>MinAnswers</b> are <span class="option2">1</span> and <span class="option2">0</span>.
    </div>
</asp:Content>

    

 