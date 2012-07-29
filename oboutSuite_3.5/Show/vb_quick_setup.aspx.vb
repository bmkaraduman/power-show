imports OboutInc.Show

Public Class vb_quick_setup
    Inherits System.Web.UI.Page

    Protected Show1 As Show

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

        Show1.StyleFolder = "styles/style5"
        Show1.Width = 625
        Show1.Height = 350
        Show1.ShowType = ShowType.Manual
        Show1.ManualChanger = True
        Show1.Changer.Width = 625
        Show1.Changer.Height = 40
        Show1.Changer.Type = ChangerType.Both
        Show1.Changer.HorizontalAlign = ChangerHorizontalAlign.Center

    End Sub

End Class