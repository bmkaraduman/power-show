Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Obout.Ajax.UI.Captcha

Partial Public Class Captcha_vb_FirstLook
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
    End Sub
    Protected Sub Submit1_click(sender As Object, e As EventArgs)
        CaptchaIn.Text = ""
    End Sub
    Protected Sub ddl1_SelectedIndexChanged(sender As Object, e As EventArgs)
        Captcha1.TextLength = Integer.Parse(ddl1.SelectedValue)
    End Sub
    Protected Sub ddl2_SelectedIndexChanged(sender As Object, e As EventArgs)
        Captcha1.FontFamily = ddl2.SelectedValue
    End Sub
    Protected Sub ddl3_SelectedIndexChanged(sender As Object, e As EventArgs)
        Captcha1.ForeColor = System.Drawing.Color.FromName(ddl3.SelectedValue.Replace(" ", ""))
    End Sub
    Protected Sub ddl4_SelectedIndexChanged(sender As Object, e As EventArgs)
        Captcha1.BackColor = System.Drawing.Color.FromName(ddl4.SelectedValue.Replace(" ", ""))
    End Sub
    Protected Sub ddl5_SelectedIndexChanged(sender As Object, e As EventArgs)
        Captcha1.BrushFillerColor = System.Drawing.Color.FromName(ddl5.SelectedValue.Replace(" ", ""))
    End Sub
    Protected Sub ddl6_SelectedIndexChanged(sender As Object, e As EventArgs)
        Select Case ddl6.SelectedValue
            Case "Solid"
                Captcha1.TextBrush = BrushType.Solid
                Exit Select
            Case "Confetti"
                Captcha1.TextBrush = BrushType.Confetti
                Exit Select
            Case "Horizontal"
                Captcha1.TextBrush = BrushType.Horizontal
                Exit Select
            Case "Vertical"
                Captcha1.TextBrush = BrushType.Vertical
                Exit Select
        End Select
    End Sub
    Protected Sub ddl7_SelectedIndexChanged(sender As Object, e As EventArgs)
        Select Case ddl7.SelectedValue
            Case "Solid"
                Captcha1.BackBrush = BrushType.Solid
                Exit Select
            Case "Confetti"
                Captcha1.BackBrush = BrushType.Confetti
                Exit Select
            Case "Horizontal"
                Captcha1.BackBrush = BrushType.Horizontal
                Exit Select
            Case "Vertical"
                Captcha1.BackBrush = BrushType.Vertical
                Exit Select
        End Select
    End Sub
    Protected Sub ddl8_SelectedIndexChanged(sender As Object, e As EventArgs)
        Select Case ddl8.SelectedValue
            Case "None"
                Captcha1.LineNoise = NoiseLevel.None
                Exit Select
            Case "Low"
                Captcha1.LineNoise = NoiseLevel.Low
                Exit Select
            Case "Medium"
                Captcha1.LineNoise = NoiseLevel.Medium
                Exit Select
            Case "High"
                Captcha1.LineNoise = NoiseLevel.High
                Exit Select
        End Select
    End Sub
    Protected Sub ddl9_SelectedIndexChanged(sender As Object, e As EventArgs)
        Select Case ddl9.SelectedValue
            Case "None"
                Captcha1.BackgroundNoise = NoiseLevel.None
                Exit Select
            Case "Low"
                Captcha1.BackgroundNoise = NoiseLevel.Low
                Exit Select
            Case "Medium"
                Captcha1.BackgroundNoise = NoiseLevel.Medium
                Exit Select
            Case "High"
                Captcha1.BackgroundNoise = NoiseLevel.High
                Exit Select
        End Select
    End Sub
    Protected Sub ddl10_SelectedIndexChanged(sender As Object, e As EventArgs)
        Select Case ddl10.SelectedValue
            Case "None"
                Captcha1.FontWarpLevel = NoiseLevel.None
                Exit Select
            Case "Low"
                Captcha1.FontWarpLevel = NoiseLevel.Low
                Exit Select
            Case "Medium"
                Captcha1.FontWarpLevel = NoiseLevel.Medium
                Exit Select
            Case "High"
                Captcha1.FontWarpLevel = NoiseLevel.High
                Exit Select
        End Select
    End Sub
    Protected Sub ddl11_SelectedIndexChanged(sender As Object, e As EventArgs)
        Select Case ddl11.SelectedValue
            Case "None"
                Captcha1.BorderWidth = Unit.Empty
                Exit Select
            Case Else
                Captcha1.BorderWidth = New Unit(ddl11.SelectedValue)
                Exit Select
        End Select
    End Sub
    Protected Sub ddl12_SelectedIndexChanged(sender As Object, e As EventArgs)
        Captcha1.BorderColor = If((ddl12.SelectedValue <> "None"), System.Drawing.Color.FromName(ddl12.SelectedValue.Replace(" ", "")), System.Drawing.Color.Empty)
    End Sub
End Class
