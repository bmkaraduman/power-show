Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Obout.Ajax.UI

Partial Public Class ColorPicker_vb_CustomColors
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub color_postback(ByVal sender As Object, ByVal e As Obout.Ajax.UI.ColorPicker.ColorPostBackEventArgs)
        textbox.Style(HtmlTextWriterStyle.BackgroundColor) = e.Color
    End Sub
End Class