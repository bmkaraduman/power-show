imports System
imports OboutInc

Public Class vb_login
    Inherits OboutInc.oboutAJAXPage

    Protected callbackPanelLogin As CallbackPanel
    Protected callbackPanelSearchInDatabase As CallbackPanel
    Protected callbackPanelProcessing As CallbackPanel

    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

        ' this event is used for a better view of the client side panel update 
        AddHandler callbackPanelLogin.BeforePanelUpdate, AddressOf oboutAJAXPage_BeforePanelUpdate
        AddHandler callbackPanelSearchInDatabase.BeforePanelUpdate, AddressOf oboutAJAXPage_BeforePanelUpdate
        AddHandler callbackPanelProcessing.BeforePanelUpdate, AddressOf oboutAJAXPage_BeforePanelUpdate

        If IsCallback And IsSearchInDatabase Then

            ' search the database 

        End If

        If IsCallback And IsProcessing Then

            ' processing 

        End If

    End Sub

    ' this event is used for a better view over the client side panel update */
    Private Function oboutAJAXPage_BeforePanelUpdate(ByVal PanelId As String, ByVal UpdateContainer As String) As Boolean

        System.Threading.Thread.Sleep(2000)
        Return True

    End Function

    Public Function Login(ByVal username As String, ByVal password As String) As Boolean

        If username = "root" And password = "root" Then

            IsLogin = True

        Else

            IsLogin = False

        End If

        Return IsLogin

    End Function

    Public Sub SearchInDatabase()

        IsSearchInDatabase = True

    End Sub

    Public Sub Processing()

        IsProcessing = True

    End Sub

    Private Property IsLogin() As Boolean

        Get
            If Session("IsLogin") = Nothing Then
                Return False
            Else
                Return Boolean.Parse(Session("IsLogin").ToString())
            End If
        End Get
        Set(ByVal value As Boolean)
            Session("IsLogin") = Value
        End Set

    End Property

    Private Property IsSearchInDatabase() As Boolean

        Get
            If Session("IsSearchInDatabase") = Nothing Then
                Return False
            Else
                Return Boolean.Parse(Session("IsSearchInDatabase").ToString())
            End If
        End Get
        Set(ByVal value As Boolean)
            Session("IsSearchInDatabase") = Value
        End Set

    End Property

    Private Property IsProcessing() As Boolean

        Get
            If Session("IsProcessing") = Nothing Then
                Return False
            Else
                Return Boolean.Parse(Session("IsProcessing").ToString())
            End If
        End Get
        Set(ByVal value As Boolean)
            Session("IsProcessing") = Value
        End Set

    End Property

End Class