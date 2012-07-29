Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Obout.Ajax.UI.FileUpload

Partial Public Class FileUpload_vb_WithoutUpdatePanel
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        If Page.IsPostBack Then
            Dim result As String = ""
            For Each info As PostedFileInfo In fileUpload1.PostedFiles
                If result.Length = 0 Then
                    result = "<b>Uploaded files:</b><br><br>"
                    result += "<table align='center' border='0' cellspacing='2' cellpadding='2'>"
                    result += "<tr><td style='font-weight: bold; text-align:left;'>File name</td><td style='font-weight: bold; text-align:left;'>Length</td><td style='font-weight: bold; text-align:left;'>Content type</td></tr>"
                End If
                result += "<tr><td style='text-align:left;'>" & info.FileName & "</td><td style='text-align:left;'>" & info.ContentLength & "</td><td style='text-align:left;'>" & info.ContentType & "</td></tr>"
            Next
            If result.Length = 0 Then
                result = "No files uploaded"
            Else
                result += "</table>"
            End If
            Label.Text = result
        End If
    End Sub
End Class