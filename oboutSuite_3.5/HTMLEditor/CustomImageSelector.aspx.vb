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

Partial Public Class HTMLEditor_CustomImageSelector_vb
    Inherits System.Web.UI.Page
    ' folder with images
    Public relativeUrl As String = "~/App_Obout/HTMLEditor/ImageGallery/Nature"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        ' resolved URL
        Dim folderUrl As String = ResolveUrl(relativeUrl)
        ' path to the folder with images
        Dim folderPath As String = Page.MapPath(folderUrl)
        If Directory.Exists(folderPath) Then
            ' such folder exists
            ' get all entires
            Dim entires As String() = Directory.GetFileSystemEntries(folderPath)
            For Each entire As String In entires
                Dim attr As FileAttributes = File.GetAttributes(entire)
                Dim name As String = Path.GetFileName(entire)
                ' get files only
                If Not ((attr And FileAttributes.Directory) = FileAttributes.Directory) Then
                    Dim ext As String = Path.GetExtension(entire).ToLower()
                    ' images only
                    If ext = ".gif" OrElse ext = ".jpg" OrElse ext = ".jpeg" OrElse ext = ".bmp" OrElse ext = ".png" Then
                        Dim width As String = "", height As String = ""
                        GetWidthHeight(entire, width, height)
                        Dim title As String = GetTitle(entire)
                        Dim url As String = Path.Combine(folderUrl, name).Replace("\", "/")
                        ' put the 'preview' image into the page
                        Dim str As String = "<img align=""top"" title=""" & (ext.Substring(1) & " " & width & "x" & height) & """ alt="""" style=""cursor: pointer; border-style: solid; border-color: white; border-width:3px"" onmouseout=""if(!this.selected) this.style.borderColor = 'white';"" onmouseover=""if(!this.selected) this.style.borderColor = 'gray';"" onclick=""_setResult(this);"" ondblclick=""_returnResult(this);"" width=""100"" src=""" & url & """ source-url=""" & url & """ source-height=""" & height & """ source-width=""" & width & """ source-title=""" & title & """ />"
                        Literal1.Text += str & vbLf
                    End If
                End If
            Next
        End If
    End Sub
    ' gets the image's title
    Private Function GetTitle(ByVal filename As String) As String
        Return ""
        ' you can override it
    End Function

    ' gets the image's sizes
    Private Sub GetWidthHeight(ByVal filename As String, ByRef width As String, ByRef height As String)
        width = ""
        height = ""
        Dim objImage As System.Drawing.Image
        Dim objStream As MemoryStream

        Dim binStream As FileStream = File.OpenRead(filename)
        Dim buf As Byte() = New Byte(binStream.Length - 1) {}

        Dim myCallback As New System.Drawing.Image.GetThumbnailImageAbort(AddressOf ThumbnailCallback)

        binStream.Read(buf, 0, CInt(binStream.Length))
        binStream.Close()

        objStream = New MemoryStream(buf)
        objStream.Position = 0
        Try
            objImage = System.Drawing.Image.FromStream(objStream)
            width = objImage.Width.ToString()
            height = objImage.Height.ToString()
            objImage.Dispose()
        Catch
        End Try
        objStream.Close()
    End Sub
    Private Function ThumbnailCallback() As Boolean
        Return False
    End Function
End Class