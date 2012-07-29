imports OboutInc.Show

Public Class vb_show_image
    Inherits System.Web.UI.Page

    Protected Show1 As Show

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

        Show1.Width = 506
        Show1.Height = 340
        Show1.ShowType = ShowType.Show
        Show1.TransitionType = TransitionType.Fading
        Show1.ImagesShowPath = "images/cosmic"
        Show1.SelectedPanel = 10

    End Sub

End Class
