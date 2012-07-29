<%@ Page Title="" Language="VB" AutoEventWireup="true" MasterPageFile="~/Poll/Poll.master" CodeFile="vb_results_fill_with_space.aspx.vb" Inherits="Poll_vb_results_fill_with_space" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Results - Fill With Empty Space</b></span>
    
    <br />
    <br />

    <obout:OboutCheckBox runat="server" ID="OboutCheckBox1" Text="Fill With Empty Space" AutoPostBack="true" />

    <br />
    <br />

    <asp:PlaceHolder ID="phPoll1" runat="server"></asp:PlaceHolder>
    
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
