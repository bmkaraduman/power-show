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
Imports Obout.Ajax.UI.HTMLEditor.Popups
Imports Obout.Ajax.UI.HTMLEditor.ContextMenu
Imports System.Collections.ObjectModel
Imports System.Globalization
Imports System.ComponentModel
Imports System.ComponentModel.Design

Partial Public Class HTMLEditor_vb_CustomSelectButton
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
        ' add separator to top toolbar
        editor.TopToolbar.AddButtons.Add(New HorizontalSeparator())
        ' add our custom 'select' buttons to the the top toolbar
        editor.TopToolbar.AddButtons.Add(New TranslateFrom())
        editor.TopToolbar.AddButtons.Add(New TranslateTo())
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content3.txt"), System.Text.Encoding.ASCII)
            editor.Content = input.ReadToEnd()
            input.Close()
        End If
    End Sub

    ' abstract class dor our custom 'select' buttons
    Public MustInherit Class SelectLanguage
        Inherits DesignModeSelectButton
#Region "[ Properties ]"

        ' tooltip if not found in Localization
        Public Overrides ReadOnly Property DefaultToolTip() As String
            Get
                Return "Select a language"
            End Get
        End Property

        ' options for the select
        Protected Overrides ReadOnly Property PreDefinedOptions() As Collection(Of SelectOption)
            Get
                Dim options As New Collection(Of SelectOption)()
                Dim selectOption As SelectOption

                selectOption = New SelectOption()
                selectOption.Value = "en"
                selectOption.Text = "English"
                options.Add(selectOption)
                selectOption = New SelectOption()
                selectOption.Value = "es"
                selectOption.Text = "Spanish"
                options.Add(selectOption)
                selectOption = New SelectOption()
                selectOption.Value = "de"
                selectOption.Text = "German"
                options.Add(selectOption)
                selectOption = New SelectOption()
                selectOption.Value = "fr"
                selectOption.Text = "French"
                options.Add(selectOption)
                selectOption = New SelectOption()
                selectOption.Value = "ru"
                selectOption.Text = "Russian"
                options.Add(selectOption)
                selectOption = New SelectOption()
                selectOption.Value = "ro"
                selectOption.Text = "Romanian"
                options.Add(selectOption)
                selectOption = New SelectOption()
                selectOption.Value = "bg"
                selectOption.Text = "Bulgarian"
                options.Add(selectOption)

                Return options
            End Get
        End Property

        ' override the default width of the select DOM element
        <Category("Appearance")> _
        Public Overrides Property SelectWidth() As Unit
            Get
                Return Unit.Pixel(90)
            End Get
            Set(ByVal value As Unit)
            End Set
        End Property

#End Region
    End Class

    ' Custom 'TranslateTo' button
    <ParseChildren(True)> _
    <PersistChildren(False)> _
    Public Class TranslateTo
        Inherits SelectLanguage
#Region "[ Properties ]"

        ' what client-side type to initiate (it is declared in the ASPX file)
        Protected Overrides ReadOnly Property ClientControlType() As String
            Get
                Return "CustomButton.TranslateTo"
            End Get
        End Property

        ' Label of the 'Select' button if not found in Localization
        Public Overrides ReadOnly Property DefaultLabel() As String
            Get
                Return "to"
            End Get
        End Property

        ' default empty option if not found in Localization
        Public Overrides ReadOnly Property DefaultOptionText() As String
            Get
                Return "[none]"
            End Get
        End Property

#End Region
    End Class

    ' Custom 'TranslateFrom' button
    <ParseChildren(True)> _
    <PersistChildren(False)> _
    Public Class TranslateFrom
        Inherits SelectLanguage
#Region "[ Properties ]"

        ' what client-side type to initiate (it is declared in the ASPX file)
        Protected Overrides ReadOnly Property ClientControlType() As String
            Get
                Return "CustomButton.TranslateFrom"
            End Get
        End Property

        ' Label of the 'Select' button if not found in Localization
        Public Overrides ReadOnly Property DefaultLabel() As String
            Get
                Return "Translate from"
            End Get
        End Property

        ' default empty option if not found in Localization
        Public Overrides ReadOnly Property DefaultOptionText() As String
            Get
                Return "auto"
            End Get
        End Property

#End Region
    End Class
End Class