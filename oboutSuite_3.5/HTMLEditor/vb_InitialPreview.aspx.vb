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
Imports System.Collections.ObjectModel
Imports System.Globalization

Partial Public Class HTMLEditor_vb_InitialPreview
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
        ' Configure the bottom toolbar 
        Editor.BottomToolbar.ShowDesignButton = False
        Editor.BottomToolbar.ShowHtmlTextButton = False
        Editor.BottomToolbar.ShowPreviewButton = False
        editor.BottomToolbar.AddButtons.Add(New CustomToolbarButtons.DesignModeNoP_vb())
        editor.BottomToolbar.AddButtons.Add(New CustomToolbarButtons.HtmlModeNoP_vb())
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        Editor.EditPanel.ActiveMode = Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview

        If Not Page.IsPostBack Then
            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII)
            editor.EditPanel.Content = input.ReadToEnd()
            input.Close()
        Else
            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditorResponse", "alert('Submitted:\n\n" + editor.EditPanel.Content.Replace("""", "\""").Replace(vbLf, "\n").Replace(vbCr, "").Replace("'", "\'") & "');", True)
        End If
    End Sub
End Class

Namespace CustomToolbarButtons
    ' Switch to 'Design' mode button - invisible in 'Preview' mode
    Public Class DesignModeNoP_vb
        Inherits Obout.Ajax.UI.HTMLEditor.ToolbarButton.DesignMode
        Public Overrides ReadOnly Property ActiveModes() As Collection(Of ActiveModeType)
            Get
                Dim arr As New Collection(Of ActiveModeType)
                arr.Add(ActiveModeType.Design)
                arr.Add(ActiveModeType.Html)
                Return arr
            End Get
        End Property
    End Class

    ' Switch to 'HTML text' mode button - invisible in 'Preview' mode
    Public Class HtmlModeNoP_vb
        Inherits Obout.Ajax.UI.HTMLEditor.ToolbarButton.HtmlMode
        Public Overrides ReadOnly Property ActiveModes() As Collection(Of ActiveModeType)
            Get
                Dim arr As New Collection(Of ActiveModeType)
                arr.Add(ActiveModeType.Design)
                arr.Add(ActiveModeType.Html)
                Return arr
            End Get
        End Property
    End Class
End Namespace