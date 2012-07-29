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

Partial Public Class HTMLEditor_vb_ShowHideToolbar
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
        ' add our custom 'Close toolbar' button
        TopToolbar.AddButtons.Add(New CloseToolbarButton())
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII)
            EditPanel1.Content = input.ReadToEnd()
            input.Close()
        End If
    End Sub

    ' declare our custom button
    Public Class CloseToolbarButton
        Inherits Obout.Ajax.UI.HTMLEditor.ToolbarButton.ImageButton
#Region "[ Properties ]"

        ' this button should be visible in all edit modes
        Public NotOverridable Overrides ReadOnly Property ActiveModes() As Collection(Of ActiveModeType)
            Get
                Dim arr As New Collection(Of ActiveModeType)()
                arr.Add(ActiveModeType.Design)
                arr.Add(ActiveModeType.Html)
                arr.Add(ActiveModeType.Preview)
                Return arr
            End Get
        End Property

        ' what client-side type to initiate (it is declared in the ASPX file)
        Protected Overrides ReadOnly Property ClientControlType() As String
            Get
                Return "CustomToolbarButton.CloseToolbarButton"
            End Get
        End Property

        ' use an existing images ("DeleteButton_n.gif"and "DeleteButton_a.gif") from the DLL
        Protected Overrides ReadOnly Property BaseImageName() As String
            Get
                Return "DeleteButton"
            End Get
        End Property

        ' tooltip if not found in Localization
        Public Overrides ReadOnly Property DefaultToolTip() As String
            Get
                Return "Close the toolbar"
            End Get
        End Property

#End Region

#Region "[ Methods ]"

        ' we need to change the default style of the button
        Protected Overrides Function CreateControlStyle() As Style
            Dim style As New CloseToolbarButtonStyle(ViewState)
            Return style
        End Function

#End Region

#Region "[ CloseToolbarButtonStyle ]"

        ' our button will have some additional CSSstyles
        Private NotInheritable Class CloseToolbarButtonStyle
            Inherits Style
            Public Sub New(ByVal state As StateBag)
                MyBase.New(state)
            End Sub

            Protected Overrides Sub FillStyleAttributes(ByVal attributes As CssStyleCollection, ByVal urlResolver As IUrlResolutionService)
                MyBase.FillStyleAttributes(attributes, urlResolver)
                ' here are the additional CSS styles
                attributes.Add("float", "right")
                ' move it to the right in the toolbar
                attributes.Add("margin-left", "2px")
                ' ensure some left padding
            End Sub
        End Class

#End Region
    End Class
End Class