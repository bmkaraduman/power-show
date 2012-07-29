<%@ Page Title="" Language="VB" AutoEventWireup="true" MasterPageFile="~/Poll/Poll.master" CodeFile="vb_save_sqldatasource.aspx.vb" Inherits="Poll_vb_save_sqldatasource" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Save Votes - SqlDataSource</b></span>
    
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
        Any DataSourceControl (e.g. SqlDataSource, ObjectDataSource, LinqDataSource, etc.) may be employed to save the votes for a Poll control.
    </div>
</asp:Content>
