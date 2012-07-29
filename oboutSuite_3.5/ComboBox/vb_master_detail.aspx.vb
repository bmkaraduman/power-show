Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_master_detail
    Inherits System.Web.UI.Page
    Dim ComboBox1 As Obout.ComboBox.ComboBox
    Dim ComboBox2 As Obout.ComboBox.ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "Master"
        ComboBox1.Width = Unit.Pixel(200)
        ComboBox1.Height = Unit.Pixel(150)
        ComboBox1.AutoClose = False
        ComboBox1.EmptyText = "Select a country ..."
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "ContinentName"
        ComboBox1.DataValueField = "ContinentID"

        ComboBox1.HeaderTemplate = New HeaderTemplate("CONTINENTS")


        ComboBox2 = New ComboBox()
        ComboBox2.ID = "Detail"
        ComboBox2.Width = Unit.Pixel(200)
        ComboBox2.Height = Unit.Pixel(150)
        ComboBox2.EnableLoadOnDemand = True
        ComboBox2.EmptyText = "Select a country ..."
        ComboBox2.DataSourceID = "sds2"
        ComboBox2.DataTextField = "CountryName"
        ComboBox2.DataValueField = "CountryID"

        ComboBox2.HeaderTemplate = New HeaderTemplate("COUNTRIES")

        AddHandler ComboBox2.LoadingItems, AddressOf Detail_LoadingItems

        ComboBox1.Details.Add(ComboBox2)

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub

    Sub Detail_LoadingItems(ByVal sender As Object, ByVal e As ComboBoxLoadingItemsEventArgs)
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
