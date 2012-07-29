Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_apiclient_items_columns
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(400)
        ComboBox1.Height = Unit.Pixel(150)
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "SupplierID"
        ComboBox1.HeaderTemplate = New HeaderTemplate()
        ComboBox1.ItemTemplate = New ItemTemplate(IsPostBack)
        ComboBox1.FooterTemplate = New FooterTemplate()

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub
    Public Class HeaderTemplate
        Implements ITemplate
          Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim ID As Literal = New Literal()
            ID.Text = "<div class=""header c1"">ID</div>"
            Dim companyname As Literal = New Literal()
            companyname.Text = "<div class=""header c2"">COMPANY NAME</div>"
            Dim city As Literal = New Literal()
            city.Text = "<div class=""header c3"">CITY</div>"

            templatePlaceHolder.Controls.Add(ID)
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
            Dim container As ComboBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ComboBoxItemTemlateContainer)
            Dim item As Obout.ComboBox.ComboBoxItem = CType(container.Parent, Obout.ComboBox.ComboBoxItem)


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
            Dim container As ComboBoxFooterTemlateContainer = CType(templatePlaceHolder.NamingContainer, ComboBoxFooterTemlateContainer)

            Dim footer As Literal = New Literal()
            footer.Text = "Displaying " + container.ItemsCount.ToString() + " items."
            Dim countryText1 As Literal = New Literal()

            templatePlaceHolder.Controls.Add(footer)
        End Sub
    End Class
End Class
