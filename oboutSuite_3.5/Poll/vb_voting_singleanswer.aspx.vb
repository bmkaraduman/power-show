Imports Obout.Ajax.UI.Poll
Imports System.Data
Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Collections.Generic
Imports System.Drawing
Partial Class Poll_vb_voting_singleanswer
    Inherits System.Web.UI.Page
    Dim Poll1 As Poll

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Poll1 = New Poll()
        Poll1.ID = "Poll1"
        Poll1.DataSourceID = "SqlDataSource1"
        Poll1.Title = "Favorite Sport"
        Poll1.Question = "Pick your favorite movies"
        Poll1.AllowedVotesPerUser = 100
        Poll1.VotingMode = PollVotingMode.SingleAnswer
        Poll1.MinAnswers = 1
        phPoll1.Controls.Add(Poll1)
    End Sub

End Class
