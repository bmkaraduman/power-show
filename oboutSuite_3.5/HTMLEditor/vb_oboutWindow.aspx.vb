Imports System.IO
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls


Partial Public Class HTMLEditor_vb_oboutWindow
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII)
            ContentPanel.Text = input.ReadToEnd()
            editor.Content = ContentPanel.Text
            input.Close()
        End If
    End Sub

    Protected Sub SubmitClick(ByVal sender As Object, ByVal e As EventArgs)
        ContentPanel.Text = editor.Content
    End Sub
End Class