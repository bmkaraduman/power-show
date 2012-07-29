Imports System.IO
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports Obout.Ajax.UI.HTMLEditor
Imports Obout.Ajax.UI.HTMLEditor.Popups
Imports Obout.Ajax.UI.HTMLEditor.ToolbarButton
Imports Obout.Ajax.UI.HTMLEditor.ContextMenu
Imports System.Collections.ObjectModel

' Declare the customized 'Image properties' popup class
Public Class CuttedImageProperties
    Inherits Obout.Ajax.UI.HTMLEditor.Popups.ImageProperties
    ' Suppress 'CSS class' field in the popup
    Protected Overrides ReadOnly Property ElementCSS() As TextBox
        Get
            Return Nothing
        End Get
    End Property
    ' Suppress 'ID' field in the popup
    Protected Overrides ReadOnly Property ElementID() As TextBox
        Get
            Return Nothing
        End Get
    End Property
    ' Suppress 'Layout' fieldset in the popup
    Protected Overrides ReadOnly Property Layout() As HtmlGenericControl
        Get
            Return Nothing
        End Get
    End Property
    ' Suppress 'Spacing' fieldset in the popup
    Protected Overrides ReadOnly Property Spacing() As HtmlGenericControl
        Get
            Return Nothing
        End Get
    End Property
End Class

Partial Public Class HTMLEditor_vb_CuttedImageProperties
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        ' Find 'Insert image' button in the top toolbar and change the associated popup
        Dim buttons As Collection(Of CommonButton) = editor.TopToolbar.GetButtonsByType(GetType(InsertImage))
        If buttons.Count > 0 Then
            Dim button As InsertImage = TryCast(buttons(0), InsertImage)
            button.RelatedPopupType = GetType(CuttedImageProperties).AssemblyQualifiedName
        End If

        ' Find 'Edit image' item in the context menu and change the associated popup
        buttons = editor.EditPanel.ContextMenu.GetButtonsByType(GetType(EditImageItem))
        If buttons.Count > 0 Then
            Dim item As EditImageItem = TryCast(buttons(0), EditImageItem)
            item.RelatedPopupType = GetType(CuttedImageProperties).AssemblyQualifiedName
        End If
        If Not Page.IsPostBack Then
            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII)
            editor.EditPanel.Content = input.ReadToEnd()
            input.Close()
        End If
    End Sub
End Class