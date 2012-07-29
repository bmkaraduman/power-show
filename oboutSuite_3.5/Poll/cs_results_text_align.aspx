<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="cs_results_text_align.aspx.cs" Inherits="Poll_cs_results_text_align" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Results - Text Align</b></span>
    
    <br />
    <br />

    <obout:OboutRadioButton runat="server" ID="OboutRadioButton1" Text="Left Aligned" AutoPostBack="true" Checked="true" GroupName="TextAlign" />
    <obout:OboutRadioButton runat="server" ID="OboutRadioButton2" Text="Right Aligned" AutoPostBack="true" GroupName="TextAlign" />

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
        Use the <b>ResultStyle.TextAlign</b> property to specify the alignment for the results text (when the results are not filled with empty space).
        Possible values are <span class="option2>TextAlign.Left</span> and <span class="option2>TextAlign.Right</span>.
    </div>

</asp:Content>
