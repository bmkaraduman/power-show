Imports Obout.Ajax.UI.Poll
Imports System.Data
Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Collections.Generic
Imports System.Drawing
Partial Class Poll_vb_populate_runtime
    Inherits System.Web.UI.Page
    Dim Poll1 As Poll

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Poll1 = New Poll()
        Poll1.ID = "Poll1"
        Poll1.Title = "Favorite Programming Language"
        Poll1.Question = "What is your favorite programming language?"
        Poll1.AllowedVotesPerUser = 100

        Poll1.Items.Add(New PollItem("C#"))
        Poll1.Items.Add(New PollItem("Java"))
        Poll1.Items.Add(New PollItem("JavaScript"))
        Poll1.Items.Add(New PollItem("Perl"))
        Poll1.Items.Add(New PollItem("PHP"))
        Poll1.Items.Add(New PollItem("Ruby"))
        Poll1.Items.Add(New PollItem("VB"))
        phPoll1.Controls.Add(Poll1)
    End Sub

End Class
