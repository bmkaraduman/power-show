Imports Obout.Ajax.UI.Poll
Imports System.Data
Imports Obout.Interface
Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Collections.Generic
Imports System.Drawing
Partial Class Poll_vb_validation_message
    Inherits System.Web.UI.Page
    Dim Poll1 As Poll

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Poll1 = New Poll()
        Poll1.ID = "Poll1"
        Poll1.DataSourceID = "SqlDataSource1"
        Poll1.VotingMode = PollVotingMode.MultipleAnswers
        Poll1.MinAnswers = 2
        Poll1.MaxAnswers = 4
        Poll1.AnswersRangeErrorMessage = "Please select between 2 and 4 answers."
        Poll1.SecurityErrorMessage = "You already voted on this poll."
        Poll1.Title = "Favorite Movie"
        Poll1.Question = "What is your favorite movie?"
        Poll1.AllowedVotesPerUser = 100
        phPoll1.Controls.Add(Poll1)
    End Sub

End Class
