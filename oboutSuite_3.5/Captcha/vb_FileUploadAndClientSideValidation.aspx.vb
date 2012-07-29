Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Partial Public Class Captcha_vb_FileUploadAndClientSideValidation
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Page.IsPostBack Then
            If fileUpload1.PostedFiles.Count > 0 Then
                ' form the result HTML
                Dim span As New HtmlGenericControl("span")
                result.Controls.Add(span)
                span.Style(HtmlTextWriterStyle.FontWeight) = "bold"
                span.Controls.Add(New LiteralControl(FirstName.Text + " " + LastName.Text))
                result.Controls.Add(New LiteralControl(":<br /><br />"))
                Dim imageElement As New HtmlImage()
                Dim url As String = Page.Request.Path
                url += (If((url.IndexOf("?") > 0), "&", "?")) & "getimage=true&rnd=" & (New Random().[Next]().ToString())
                imageElement.Src = url
                ' set image's size
                Dim image As New System.Drawing.Bitmap(fileUpload1.PostedFiles(0).InputStream)
                Dim maxHeight As Integer = Integer.Parse(imageheight.Value) - 35
                ' max height of the image
                Dim mWidth As Integer = image.Width
                Dim mHeight As Integer = image.Height

                If mHeight > maxHeight Then
                    mWidth = CInt(Math.Truncate(CDbl(mWidth) * (CDbl(maxHeight) / CDbl(mHeight))))
                    mHeight = maxHeight
                End If
                If mHeight = 0 Then
                    mHeight = 5
                End If
                If mWidth = 0 Then
                    mWidth = 5
                End If

                imageElement.Height = mHeight
                imageElement.Width = mWidth
                result.Controls.Add(imageElement)

                ' save uploaded image to the Session variable
                Dim imageBytes As Byte() = New Byte(fileUpload1.PostedFiles(0).ContentLength - 1) {}
                fileUpload1.PostedFiles(0).InputStream.Seek(0L, System.IO.SeekOrigin.Begin)
                fileUpload1.PostedFiles(0).InputStream.Read(imageBytes, 0, fileUpload1.PostedFiles(0).ContentLength)
                Session("image") = imageBytes
            Else
                result.Controls.Clear()
            End If
        Else
            ' if used as Image's SRC
            If Not [String].IsNullOrEmpty(Page.Request.QueryString("getimage")) Then
                If Session("image") IsNot Nothing Then
                    Page.Response.ContentType = "image/gif"
                    Page.Response.BinaryWrite(DirectCast(Session("image"), Byte()))
                    Page.Response.[End]()
                End If
            End If
        End If
    End Sub
End Class
