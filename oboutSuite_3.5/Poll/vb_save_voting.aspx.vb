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
        Poll1.Title = "Favorite Movie"
        Poll1.Question = "What is your favorite movie?"
        Poll1.AllowedVotesPerUser = 100
        AddHandler Poll1.Voting, AddressOf Poll1_Voting

        phPoll1.Controls.Add(Poll1)
    End Sub
    Sub Poll1_Voting(ByVal sender As Object, ByVal e As PollItemEventArgs)

        Dim conn As OleDbConnection = New OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings("PollConnectionString").ConnectionString)

        conn.Open()

        Dim answer As PollAnswer

        For Each answer In Poll1.Answers

            If (answer.Selected) Then

                Dim logVoteQuery As String = "UPDATE Answers SET Votes = Votes + 1 WHERE AnswerID = @AnswerID"
                Dim logVoteCommand As OleDbCommand = New OleDbCommand(logVoteQuery, conn)
                logVoteCommand.Parameters.AddWithValue("@AnswerID", answer.Item.Value)

                logVoteCommand.ExecuteNonQuery()

                Exit For

            End If
        Next

        conn.Close()
    End Sub

End Class
