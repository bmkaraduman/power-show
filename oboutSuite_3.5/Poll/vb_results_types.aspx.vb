Imports Obout.Ajax.UI.Poll
Imports System.Data
Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Collections.Generic
Imports System.Drawing
Partial Class Poll_vb_voting_multipleanswers
    Inherits System.Web.UI.Page
    Dim Poll1 As Poll

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Poll1 = New Poll()
        Poll1.ID = "Poll1"
        Poll1.DataSourceID = "SqlDataSource1"
        Poll1.VotingMode = PollVotingMode.SingleAnswer
        Poll1.CurrentMode = PollMode.Results
        Poll1.VotingMode = PollVotingMode.SingleAnswer
        Poll1.Title = "Favorite Movie"
        Poll1.Question = "What is your favorite movie?"
        Poll1.AllowedVotesPerUser = 100
        Poll1.ResultStyle.DisplayVotes = True

        phPoll1.Controls.Add(Poll1)

        If (ChartTypeHorizontalLines.Checked) Then

            Poll1.ResultStyle.ResultType = PollResultType.HorizontalLines

        ElseIf (ChartTypeTextOnly.Checked) Then

            Poll1.ResultStyle.ResultType = PollResultType.TextOnly

        ElseIf (ChartTypePieChart3D.Checked) Then

            Poll1.ResultStyle.ResultType = PollResultType.PieChart3D

        ElseIf (ChartTypePieChart.Checked) Then

            Poll1.ResultStyle.ResultType = PollResultType.PieChart

        ElseIf (ChartTypePyramidChart3DWithPointGaps.Checked) Then

            Poll1.ResultStyle.ResultType = PollResultType.PyramidChart3DWithPointGaps

        ElseIf (ChartTypePyramidChartWithPointGaps.Checked) Then

            Poll1.ResultStyle.ResultType = PollResultType.PyramidChartWithPointGaps

        ElseIf (ChartTypeFunnelChart3DWithPointGaps.Checked) Then

            Poll1.ResultStyle.ResultType = PollResultType.FunnelChart3DWithPointGaps

        ElseIf (ChartTypeFunnelChartWithPointGaps.Checked) Then

            Poll1.ResultStyle.ResultType = PollResultType.FunnelChartWithPointGaps

        End If

    End Sub

End Class
