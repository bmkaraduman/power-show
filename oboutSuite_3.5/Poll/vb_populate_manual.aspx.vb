Imports Obout.Ajax.UI.Poll
Imports System.Data
Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Collections.Generic
Imports System.Drawing
Partial Class Poll_vb_populate_manual
    Inherits System.Web.UI.Page
    Dim Poll1 As Poll

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Poll1 = New Poll()
        Poll1.ID = "Poll1"
        Poll1.VotingMode = PollVotingMode.SingleAnswer
        Poll1.MinAnswers = 1
        Poll1.Title = "Favorite Programming Language"
        Poll1.Question = "What is your favorite programming language?"
        Poll1.AllowedVotesPerUser = 100

        Dim item1 As PollItem = New PollItem()
        item1.Text = "C#"
        Poll1.Items.Add(item1)

        Dim item2 As PollItem = New PollItem()
        item2.Text = "JavaScript"
        Poll1.Items.Add(item2)

        Dim item3 As PollItem = New PollItem()
        item3.Text = "Perl"
        Poll1.Items.Add(item3)

        Dim item4 As PollItem = New PollItem()
        item4.Text = "PHP"
        Poll1.Items.Add(item4)

        Dim item5 As PollItem = New PollItem()
        item5.Text = "Ruby"
        Poll1.Items.Add(item5)

        Dim item6 As PollItem = New PollItem()
        item6.Text = "VB"
        Poll1.Items.Add(item6)

        phPoll1.Controls.Add(Poll1)
    End Sub

End Class
