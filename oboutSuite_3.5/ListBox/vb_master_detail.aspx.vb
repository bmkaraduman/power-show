Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_master_detail
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Dim ListBox2 As Obout.ListBox.ListBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "Master"
        ListBox1.Width = Unit.Pixel(200)
        ListBox1.Height = Unit.Pixel(150)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "ContinentName"
        ListBox1.DataValueField = "ContinentID"

        ListBox1.HeaderTemplate = New HeaderTemplate("CONTINENTS")


        ListBox2 = New Obout.ListBox.ListBox()
        ListBox2.ID = "Detail"
        ListBox2.Width = Unit.Pixel(200)
        ListBox2.Height = Unit.Pixel(150)
        ListBox2.EnableLoadOnDemand = True
        ListBox2.DataSourceID = "sds2"
        ListBox2.DataTextField = "CountryName"
        ListBox2.DataValueField = "CountryID"

        ListBox2.HeaderTemplate = New HeaderTemplate("COUNTRIES")

        AddHandler ListBox2.LoadingItems, AddressOf Detail_LoadingItems

        ListBox1.Details.Add(ListBox2)

        ListBox1Container.Controls.Add(ListBox1)
    End Sub

    Sub Detail_LoadingItems(ByVal sender As Object, ByVal e As ListBoxLoadingItemsEventArgs)
        If Not (String.IsNullOrEmpty(e.Text)) Then

            Dim tryout As Integer = 0
            If Integer.TryParse(e.Text, tryout) Then

                sds2.SelectParameters(0).DefaultValue = e.Text
            End If

        End If
    End Sub
    Public Class HeaderTemplate
        Implements ITemplate

        Private _headerText As String = ""
        Public Sub New(ByVal headerText As String)
            _headerText = headerText
        End Sub
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim header1 As Literal = New Literal()
            header1.Text = "<div class=""header"">" + _headerText + "</div>"
            container.Controls.Add(header1)
        End Sub
    End Class
End Class


