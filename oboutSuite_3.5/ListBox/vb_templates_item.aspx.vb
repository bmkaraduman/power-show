Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_templates_item
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(325)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CompanyName"
        ListBox1.DataValueField = "CustomerID"

        ListBox1.ItemTemplate = New ItemTemplate(IsPostBack)

        ListBox1Container.Controls.Add(ListBox1)
    End Sub

    Public Class ItemTemplate
        Implements ITemplate

        Private isPostBack As Boolean

        Public Sub New(ByVal _isPostBack As Boolean)
            isPostBack = _isPostBack
        End Sub


        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)
            AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate
        End Sub

        Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)
            Dim templatePlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
            Dim container As ListBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ListBoxItemTemlateContainer)
            Dim item As Obout.ListBox.ListBoxItem = CType(container.Parent, Obout.ListBox.ListBoxItem)

            Dim companyNameText As Literal = New Literal()
            If Not isPostBack Then
                companyNameText.Text = "<span class=""template-name"">" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + "</span>"
            End If

            Dim countryText1 As Literal = New Literal()
            If Not isPostBack Then
                countryText1.Text = " / <span class=""template-country"">" + DataBinder.Eval(item.DataItem, "Country").ToString() + " "
            End If

            Dim flag As Image = New Image()
            If Not isPostBack Then
                flag.ImageUrl = GetCountryFlag(DataBinder.Eval(item.DataItem, "Country").ToString())
            End If

            Dim countryText2 As Literal = New Literal()
            If Not isPostBack Then
                countryText2.Text = "</span>"
            End If

            templatePlaceHolder.Controls.Add(companyNameText)
            templatePlaceHolder.Controls.Add(countryText1)
            templatePlaceHolder.Controls.Add(flag)
            templatePlaceHolder.Controls.Add(countryText2)
        End Sub

        Function GetCountryFlag(ByVal countryName As String) As String
            Select Case countryName
                Case "UK"
                    countryName = "England"
            End Select

            Return "resources/Images/flags/flag_" + countryName.ToLower() + ".png"
        End Function
    End Class
End Class