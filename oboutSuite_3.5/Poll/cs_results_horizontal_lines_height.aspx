<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="cs_results_horizontal_lines_height.aspx.cs" Inherits="Poll_cs_results_horizontal_lines_height" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Results - Height for Horizontal Lines</b></span>
    
    <br />
    <br />

    <div class="tdText">
        The height for the horizontal lines: 
        <obout:OboutDropDownList runat="server" ID="OboutDropDownList1" AutoPostBack="true" Width="100"
            FolderStyle="~/Interface/styles/grand_gray/OboutDropDownList">
            <asp:ListItem Selected="True">15px</asp:ListItem>
            <asp:ListItem>20px</asp:ListItem>
            <asp:ListItem>25px</asp:ListItem>
            <asp:ListItem>30px</asp:ListItem>
            <asp:ListItem>35px</asp:ListItem>
            <asp:ListItem>40px</asp:ListItem>
        </obout:OboutDropDownList>    
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

    <div style="width: 450px;" class="tdText">
        Use the <b>ResultStyle.HorizontalLinesHeight</b> property to specify the height for the horizontal lines displaying the results for each answer.        
    </div>

</asp:Content>


  

 