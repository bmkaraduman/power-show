<%@ Page Title="" Language="C#" MasterPageFile="~/Poll/Poll.master" AutoEventWireup="true" CodeFile="aspnet_results_types.aspx.cs" Inherits="Poll_aspnet_results_types" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Results - Result Types</b></span>
    
    <br />
    <br />
    
    <table>
        <tr>
            <td>
                <obout:Poll runat="server" ID="Poll1" DataSourceID="SqlDataSource1"
                    VotingMode="SingleAnswer" CurrentMode="Results"
                    Title="Favorite Movie" Question="What is your favorite movie?" 
                    AllowedVotesPerUser="100">
                    <ResultStyle DisplayVotes="true" />
                </obout:Poll>
            </td>
            <td width="25">&#160;</td>
            <td valign="top">
                <obout:OboutRadioButton ID="ChartTypeHorizontalLines" runat="server" Checked="true" Text="Horizontal Lines" AutoPostBack="true" GroupName="ChartType" Width="140" />
                <obout:OboutRadioButton ID="ChartTypeTextOnly" runat="server" Checked="false" Text="Text Only" AutoPostBack="true" GroupName="ChartType" Width="140" />
                <br /><br />
                <obout:OboutRadioButton ID="ChartTypePieChart3D" runat="server" Text="Pie Chart 3D" AutoPostBack="true" GroupName="ChartType" Width="140" />
                <br />
                <obout:OboutRadioButton ID="ChartTypePieChart" runat="server" Text="Pie Chart" AutoPostBack="true" GroupName="ChartType" Width="140" />
                <br />
                <obout:OboutRadioButton ID="ChartTypePyramidChart3DWithPointGaps" runat="server" Text="Pyramid Chart 3D with Point Gaps" AutoPostBack="true" GroupName="ChartType"/>
                <br />
                <obout:OboutRadioButton ID="ChartTypePyramidChartWithPointGaps" runat="server" Text="Pyramid Chart with Point Gaps" AutoPostBack="true" GroupName="ChartType"/>
                <br />                        
                <obout:OboutRadioButton ID="ChartTypeFunnelChart3DWithPointGaps" runat="server" Text="Funnel Chart 3D with Point Gaps" AutoPostBack="true" GroupName="ChartType" />                        
                <br />
                <obout:OboutRadioButton ID="ChartTypeFunnelChartWithPointGaps" runat="server" Text="Funnel Chart with Point Gaps" AutoPostBack="true" GroupName="ChartType" />
            </td>
        </tr>
    </table>    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PollConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:PollConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Answers] WHERE PollID = 1"
        UpdateCommand="UPDATE Answers SET Votes = Votes + 1 WHERE AnswerID = @AnswerID" />

    <br /><br /><br />

    <div style="width: 450px;" class="tdText">
        Use the <b>ResultStyle.ResultType</b> property to indicate the type of result that you want to display for the Poll. 
        A wide range of charts is available out of the box. <br /><br />
        <b>IMPORTANT:</b> in order to use the built-in charts you need to install the <a target="_blank" href="http://www.microsoft.com/download/en/details.aspx?id=14422">Microsoft Charting Controls</a>.
    </div>

</asp:Content>

