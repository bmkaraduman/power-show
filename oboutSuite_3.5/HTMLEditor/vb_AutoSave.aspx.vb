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

Partial Public Class HTMLEditor_vb_AutoSave
    Inherits System.Web.UI.Page
    Implements System.Web.UI.ICallbackEventHandler
    Protected sCallbackInvocation As String = ""
    Private sCallbackResult As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            sCallbackInvocation = Page.ClientScript.GetCallbackEventReference(Me, "args", "Callback", "", False)

            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII)
            editor.EditPanel.Content = input.ReadToEnd()
            input.Close()
        End If
    End Sub

    Public Function GetCallbackResult() As String Implements ICallbackEventHandler.GetCallbackResult
        Return sCallbackResult
    End Function

    Public Sub RaiseCallbackEvent(ByVal editorContent As String) Implements ICallbackEventHandler.RaiseCallbackEvent
        saveContent(editorContent)
        sCallbackResult = System.DateTime.Now.ToString()
    End Sub

    Private Sub saveContent(ByVal editorContent As String)
        ' here you can save Editor's content to database
    End Sub
End Class