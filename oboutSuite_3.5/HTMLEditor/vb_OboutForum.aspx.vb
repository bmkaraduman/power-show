Imports System.IO
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Obout.Ajax.UI.HTMLEditor

Partial Public Class HTMLEditor_vb_OboutForum
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content4.txt"), System.Text.Encoding.ASCII)
            editor.EditPanel.Content = input.ReadToEnd()
            input.Close()
        End If
    End Sub

    Protected Sub Preview_click(ByVal sender As Object, ByVal e As EventArgs)
        editorPanel.Visible = False
        previewPanel.Visible = True
        preview.Text = editor.Content.Replace(vbLf, "") ' for correct PRE
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "PrettyPrint", "prettyPrint();", True)
    End Sub

    Protected Sub BackToEdit_click(ByVal sender As Object, ByVal e As EventArgs)
        editorPanel.Visible = True
        previewPanel.Visible = False
    End Sub
End Class
