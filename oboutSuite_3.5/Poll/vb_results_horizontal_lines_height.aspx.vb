Imports Obout.Ajax.UI.Poll
Imports System.Data
Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Collections.Generic
Imports System.Drawing
Partial Class Poll_vb_results_horizontal_lines_height
    Inherits System.Web.UI.Page
    Dim Poll1 As Poll

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Poll1 = New Poll()
        Poll1.ID = "Poll1"
        Poll1.DataSourceID = "SqlDataSource1"
        Poll1.VotingMode = PollVotingMode.SingleAnswer
        Poll1.CurrentMode = PollMode.Results
        Poll1.Title = "Favorite Movie"
        Poll1.Question = "What is your favorite movie?"
        Poll1.AllowedVotesPerUser = 100
        Poll1.StyleFile = "~/App_Obout/Poll/styles/grand_gray/style.css"
        Poll1.InterfaceStyleFolder = "~/Interface/styles/grand_gray/OboutDropDownList"
        phPoll1.Controls.Add(Poll1)

        Poll1.ResultStyle.HorizontalLinesHeight = Unit.Parse(OboutDropDownList1.SelectedValue)
    End Sub

End Class
