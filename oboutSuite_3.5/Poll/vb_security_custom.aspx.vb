Imports Obout.Ajax.UI.Poll
Imports System.Data
Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Collections.Generic
Imports System.Drawing
Partial Class Poll_vb_appearance_customizestyles
    Inherits System.Web.UI.Page
    Dim Poll1 As Poll
    Dim UserID As Guid = New Guid("12345678-1234-1234-1234-123456789012")

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Poll1 = New Poll()
        Poll1.ID = "Poll1"
        Poll1.DataSourceID = "SqlDataSource1"
        Poll1.Title = "Favorite Sport"
        Poll1.Question = "What is your favorite sport?"
        Poll1.AllowedVotesPerUser = 1
        Poll1.SecurityMethod = PollSecurityMethod.Custom
        AddHandler Poll1.Voted, AddressOf Poll1_Voted
        AddHandler Poll1.SecurityChecking, AddressOf Poll1_SecurityChecking
        phPoll1.Controls.Add(Poll1)
    End Sub

    Sub Poll1_Voted(ByVal sender As Object, ByVal e As PollItemEventArgs)

        Dim conn As New OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings("PollConnectionString").ConnectionString)

        conn.Open()

        Dim logVoteQuery As String = "INSERT INTO UserVotes(AnswerID, UserID) VALUES(@AnswerID, @UserID)"
        Dim logVoteCommand As New OleDbCommand(logVoteQuery, conn)
        logVoteCommand.Parameters.AddWithValue("@AnswerID", e.Item.Value)
        logVoteCommand.Parameters.AddWithValue("@UserID", UserID.ToString())

        logVoteCommand.ExecuteNonQuery()

        conn.Close()
    End Sub

    Sub Poll1_SecurityChecking(ByVal sender As Object, ByVal e As PollSecurityCheckingEventArgs)

        Dim conn As OleDbConnection = New OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings("PollConnectionString").ConnectionString)

        conn.Open()

        Dim checkVotingAllowedQuery As String = "SELECT COUNT(*) FROM UserVotes UV"
        checkVotingAllowedQuery += " INNER JOIN Answers A ON UV.AnswerID = A.AnswerID WHERE UV.UserID = @UserID AND A.PollID = 3"

        Dim checkVotingAllowedCommand As New OleDbCommand(checkVotingAllowedQuery, conn)
        checkVotingAllowedCommand.Parameters.AddWithValue("@UserID", UserID.ToString())

        Dim numberOfVotes As Object = checkVotingAllowedCommand.ExecuteScalar()

        conn.Close()

        If Integer.Parse(numberOfVotes.ToString()) >= Poll1.AllowedVotesPerUser Then
            e.AllowVoting = False
        Else
            e.AllowVoting = True
        End If

    End Sub

End Class
