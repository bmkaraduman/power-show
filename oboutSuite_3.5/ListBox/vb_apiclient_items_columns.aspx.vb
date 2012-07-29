Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_apiclient_items_columns
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(400)
        ListBox1.Height = Unit.Pixel(150)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CompanyName"
        ListBox1.DataValueField = "SupplierID"
        ListBox1.HeaderTemplate = New HeaderTemplate()
        ListBox1.ItemTemplate = New ItemTemplate(IsPostBack)
        ListBox1.FooterTemplate = New FooterTemplate()

        ListBox1Container.Controls.Add(ListBox1)
    End Sub

    Public Class HeaderTemplate
        Implements ITemplate

        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim id As Literal = New Literal()
            id.Text = "<div class=""header c1"">ID</div>"
            Dim companyname As Literal = New Literal()
            companyname.Text = "<div class=""header c2"">COMPANY NAME</div>"
            Dim city As Literal = New Literal()
            city.Text = "<div class=""header c3"">CITY</div>"

            templatePlaceHolder.Controls.Add(id)
            templatePlaceHolder.Controls.Add(companyname)
            templatePlaceHolder.Controls.Add(city)
        End Sub

    End Class

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


            Dim containerTemplate As Literal = New Literal()
            If Not isPostBack Then
                containerTemplate.Text = "<div class=""item c1"">" + DataBinder.Eval(item.DataItem, "SupplierID").ToString() + "</div><div class=""item c2"">" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + "</div><div class=""item c3"">" + DataBinder.Eval(item.DataItem, "City").ToString() + "</div>"

                templatePlaceHolder.Controls.Add(containerTemplate)
            End If

        End Sub
    End Class
    Public Class FooterTemplate
        Implements ITemplate

        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)
            AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate
        End Sub

        Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)
            Dim templatePlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
            Dim container As ListBoxFooterTemlateContainer = CType(templatePlaceHolder.NamingContainer, ListBoxFooterTemlateContainer)

            Dim footer As Literal = New Literal()
            footer.Text = "Displaying " + container.ItemsCount.ToString() + " items."
            Dim countryText1 As Literal = New Literal()

            templatePlaceHolder.Controls.Add(footer)
        End Sub
    End Class
End Class
