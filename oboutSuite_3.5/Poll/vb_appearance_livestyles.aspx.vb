Imports Obout.Ajax.UI.Poll
Imports System.Data
Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Collections.Generic
Imports System.Drawing
Imports Obout.ListBox.ListBox
Partial Class Poll_vb_appearance_livestyles
    Inherits System.Web.UI.Page
    Dim Poll1 As Poll

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Poll1 = New Poll()
        Poll1.ID = "Poll1"
        Poll1.DataSourceID = "SqlDataSource1"
        Poll1.VotingMode = PollVotingMode.SingleAnswer
        Poll1.MinAnswers = 1
        Poll1.Title = "Favorite Movie"
        Poll1.Question = "What is your favorite movie?"
        Poll1.AllowedVotesPerUser = 100
        phPoll1.Controls.Add(Poll1)

        If (IsPostBack) Then

            Poll1.StyleFile = "~/App_Obout/Poll/styles/" + ListBox1.SelectedValue + "/style.css"
        End If
    End Sub

    Sub ListBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)

        Poll1.InterfaceStyleFolder = "~/Interface/styles/" + ListBox1.SelectedValue

    End Sub

End Class
