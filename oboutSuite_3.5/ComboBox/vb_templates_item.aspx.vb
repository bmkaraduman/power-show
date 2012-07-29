Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_templates_item
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(325)
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        ComboBox1.ItemTemplate = New ItemTemplate(IsPostBack)

        ComboBox1Container.Controls.Add(ComboBox1)
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
            Dim container As ComboBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ComboBoxItemTemlateContainer)
            Dim item As Obout.ComboBox.ComboBoxItem = CType(container.Parent, Obout.ComboBox.ComboBoxItem)

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
