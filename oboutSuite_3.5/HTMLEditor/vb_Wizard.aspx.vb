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

Partial Public Class HTMLEditor_vb_Wizard
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            Dim input As StreamReader
            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII)
            editor.Content = input.ReadToEnd()
            input.Close()
        End If
        Label1.Visible = False
    End Sub

    Public Sub OnActiveStepChanged(ByVal sender As Object, ByVal e As EventArgs)
        If Wizard1.ActiveStepIndex = 1 Then
            previewContent.Text = editor.Content
        ElseIf Wizard1.ActiveStepIndex = 2 Then
            htmlLength.Text = editor.Content.Length.ToString()
            plainLength.Text = editor.PlainText.Length.ToString()
        End If
    End Sub

    Public Sub OnFinishButtonClick(ByVal sender As Object, ByVal e As WizardNavigationEventArgs)
        Label1.Text = "The wizard has been completed."
        Label1.Visible = True
    End Sub
End Class