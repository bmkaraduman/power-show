Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Obout.Ajax.UI.FileUpload

Partial Public Class FileUpload_vb_SeparatedUploads
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Page.IsPostBack Then
            Label.Text = "Nothing uploaded"
        End If
    End Sub
    Protected Sub submit1_click(ByVal sender As Object, ByVal e As EventArgs)
        If fileUpload1.PostedFiles.Count > 0 Then
            Label.Text = fileUpload1.PostedFiles.Count.ToString() & " images uploaded to 'My photos'"
        End If
    End Sub
    Protected Sub submit2_click(ByVal sender As Object, ByVal e As EventArgs)
        If fileUpload2.PostedFiles.Count > 0 Then
            Label.Text = fileUpload2.PostedFiles.Count.ToString() & " images uploaded to 'Photos of my children'"
        End If
    End Sub
End Class