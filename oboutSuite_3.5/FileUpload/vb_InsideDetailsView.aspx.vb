Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Obout.Ajax.UI.FileUpload

Partial Public Class FileUpload_vb_InsideDetailsView
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Page.IsPostBack Then
            label.Text = ""
        End If
    End Sub

    Protected Sub myItemUpdated(ByVal sender As Object, ByVal e As DetailsViewUpdatedEventArgs)
        Dim detailsView As System.Web.UI.WebControls.DetailsView = TryCast(sender, System.Web.UI.WebControls.DetailsView)
        Dim fileUpload As Obout.Ajax.UI.FileUpload.FileUpload = TryCast(detailsView.FindControl("fileUpload1"), Obout.Ajax.UI.FileUpload.FileUpload)
        If fileUpload IsNot Nothing Then
            If fileUpload.PostedFiles.Count > 0 Then
                Dim result As String = ""
                For Each info As PostedFileInfo In fileUpload.PostedFiles
                    ' Here you can place the code to save uploaded files
                    '

                    If result.Length = 0 Then
                        result = "<b>Uploaded files:</b><br><br>"
                        result += "<table border='0' cellspacing='2' cellpadding='2'>"
                        result += "<tr><td style='font-weight: bold; text-align:left;'>File name</td><td style='font-weight: bold; text-align:left;'>Length</td><td style='font-weight: bold; text-align:left;'>Content type</td></tr>"
                    End If
                    result += ("<tr><td style='text-align:left;'>" + info.FileName & "</td><td style='text-align:left;'>" & info.ContentLength.ToString() & "</td><td style='text-align:left;'>") + info.ContentType & "</td></tr>"
                Next
                If result.Length = 0 Then
                    result = "No files uploaded"
                Else
                    result += "</table>"
                End If
                label.Text = result
            End If
        End If
    End Sub
End Class