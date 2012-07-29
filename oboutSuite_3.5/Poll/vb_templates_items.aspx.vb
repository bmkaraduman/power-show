Imports Obout.Ajax.UI.Poll
Imports System.Data
Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Collections.Generic
Imports System.Drawing
Imports Obout.Interface
Partial Class Poll_vb_templates_items
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
        Poll1.ResultStyle.DisplayVotes = True
        AddHandler Poll1.GetSelectedItem, AddressOf Poll1_GetSelectedItem
        AddHandler Poll1.SetSelectedItem, AddressOf Poll1_SetSelectedItem

        Poll1.AnswerTemplate = New AnswerTemplate(IsPostBack)

        phPoll1.Controls.Add(Poll1)
    End Sub

    Public Class AnswerTemplate
        Implements ITemplate
        Private isPostBack As Boolean

        Public Sub New(ByVal _isPostBack As Boolean)
            isPostBack = _isPostBack
        End Sub

        Public Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate
        End Sub

        Public Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)
            Dim templatePlaceHolder As PlaceHolder = TryCast(sender, PlaceHolder)
            Dim container As PollAnswerTemplateContainer = CType(templatePlaceHolder.NamingContainer, PollAnswerTemplateContainer)
            Dim item As PollAnswer = DirectCast(container.Parent, PollAnswer)

            Dim image As New Literal()

            image.Text = "<img src=""resources/images/" + container.Item.Text.ToString() + ".jpg"" + alt=''" + "height='80' />"

            Dim OboutRadioButton1 As New Obout.Interface.OboutRadioButton()

            OboutRadioButton1.ID = "OboutRadioButton1"
            OboutRadioButton1.Text = container.Item.Text.ToString()
            OboutRadioButton1.GroupName = "PollItem"

            templatePlaceHolder.Controls.Add(image)
            templatePlaceHolder.Controls.Add(OboutRadioButton1)
        End Sub

    End Class
    Protected Sub Poll1_GetSelectedItem(ByVal sender As Object, ByVal e As PollAnswerEventArgs)
        Dim OboutRadioButton1 As OboutRadioButton = TryCast(e.Answer.FindControl("OboutRadioButton1"), OboutRadioButton)
        e.Answer.Item.Selected = OboutRadioButton1.Checked
    End Sub

    Protected Sub Poll1_SetSelectedItem(ByVal sender As Object, ByVal e As PollAnswerEventArgs)
        Dim OboutRadioButton1 As OboutRadioButton = TryCast(e.Answer.FindControl("OboutRadioButton1"), OboutRadioButton)
        OboutRadioButton1.Checked = e.Answer.Item.Selected
    End Sub
End Class
