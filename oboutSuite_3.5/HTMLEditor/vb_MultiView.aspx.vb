Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports Obout.Ajax.UI.HTMLEditor
Imports Obout.Ajax.UI.HTMLEditor.ToolbarButton
Imports System.Collections.ObjectModel
Imports System.Globalization

Partial Public Class HTMLEditor_vb_MultiView
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII)
            editor.EditPanel.Content = input.ReadToEnd()
            input.Close()
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub

    Protected Sub previewClick(ByVal sender As Object, ByVal e As EventArgs)
        MultiView1.ActiveViewIndex = 1
        editor_content.Text = editor.Content
    End Sub
    Protected Sub backToEditClick(ByVal sender As Object, ByVal e As EventArgs)
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub finishClick(ByVal sender As Object, ByVal e As EventArgs)
        MultiView1.ActiveViewIndex = 2
        htmlLength.Text = editor.Content.Length.ToString()
        plainLength.Text = editor.PlainText.Length.ToString()
    End Sub
    Protected Sub backToPreviewClick(ByVal sender As Object, ByVal e As EventArgs)
        MultiView1.ActiveViewIndex = 1
        editor_content.Text = editor.Content
    End Sub
End Class