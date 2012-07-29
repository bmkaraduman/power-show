Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class Captcha_vb_ValidationSummary
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
    End Sub
    Protected Sub Submit1_click(sender As Object, e As EventArgs)
        CaptchaIn.Text = ""
    End Sub
End Class
