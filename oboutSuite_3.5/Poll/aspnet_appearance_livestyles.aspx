<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_appearance_livestyles.aspx.cs" Inherits="Poll_aspnet_appearance_livestyles" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Live Styles</b></span>
    
    <br />
    <br />

    <obout:ListBox runat="server" ID="ListBox1" AutoPostBack="true" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged">
        <obout:ListBoxItem runat="server" Text="black_glass" Selected="true" />
        <obout:ListBoxItem runat="server" Text="grand_gray" />
        <obout:ListBoxItem runat="server" Text="plain" />
        <obout:ListBoxItem runat="server" Text="premiere_blue" />
    </obout:ListBox>

    <br />
    <br />

    <obout:Poll runat="server" ID="Poll1" DataSourceID="SqlDataSource1"
        VotingMode="SingleAnswer" MinAnswers="1" 
        Title="Favorite Movie" Question="What is your favorite movie?" 
        AllowedVotesPerUser="100">
    </obout:Poll>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PollConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:PollConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Answers] WHERE PollID = 1"
        UpdateCommand="UPDATE Answers SET Votes = Votes + 1 WHERE AnswerID = @AnswerID" />

    <br /><br />

    <div class="tdText" style="width: 500px;">
        The Poll comes with predefined styles which are suited for most page layouts.<br /><br />
        The styles can be switched easily using the <b>StyleFile</b> property, which needs to contain the relative path to the .css file used by the control.<br /><br />
        Use the <b>InterfaceFolderStyle</b> property to specify the path to the folder containing the styles for the Interface Controls used by the Poll (radio buttons, check boxes, buttons.) 
    </div>

</asp:Content>

