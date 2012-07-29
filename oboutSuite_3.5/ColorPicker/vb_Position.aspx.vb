
Partial Class ColorPicker_vb_Position
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub color_postback(ByVal sender As Object, ByVal e As Obout.Ajax.UI.ColorPicker.ColorPostBackEventArgs)
        textbox.Style(HtmlTextWriterStyle.BackgroundColor) = e.Color
    End Sub
End Class
