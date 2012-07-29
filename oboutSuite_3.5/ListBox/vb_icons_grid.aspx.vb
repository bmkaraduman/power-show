Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_icons_grid
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(400)
        ListBox1.Height = Unit.Pixel(230)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "ProductName"
        ListBox1.DataValueField = "ProductID"

        ListBox1.HeaderTemplate = New HeaderTemplate()
        ListBox1.ItemTemplate = New ItemTemplate(IsPostBack)
        ListBox1.FooterTemplate = New FooterTemplate()

        ListBox1Container.Controls.Add(ListBox1)
    End Sub
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
            footer.Text = "Displaying " + container.ItemsCount.ToString()
            Dim countryText1 As Literal = New Literal()

            templatePlaceHolder.Controls.Add(footer)
        End Sub
    End Class
    Public Class HeaderTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim header As Literal = New Literal()
            header.Text = "<div class=""header c1"">&#160;</div>"
            container.Controls.Add(header)

            Dim header2 As Literal = New Literal()
            header2.Text = "<div class=""header c2"">PRODUCT NAME</div>"
            container.Controls.Add(header2)

            Dim header3 As Literal = New Literal()
            header3.Text = "<div class=""header c3"">PRICE</div>"
            container.Controls.Add(header3)
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

            Dim item11 As Literal = New Literal()
            item11.Text = "<div class=""item c1"">"

            Dim img As Image = New Image()
            img.ImageUrl = "~/Grid/resources/images/products/" + DataBinder.Eval(item.DataItem, "Image").ToString()

            Dim item12 As Literal = New Literal()
            item12.Text = "</div>"

            Dim item21 As Literal = New Literal()
            item21.Text = "<div class=""item c2"">"

            Dim item22 As Literal = New Literal()
            item22.Text = DataBinder.Eval(item.DataItem, "ProductName").ToString()

            Dim item23 As Literal = New Literal()
            item23.Text = "</div>"


            Dim item31 As Literal = New Literal()
            item31.Text = "<div class=""item c3"">"

            Dim item32 As Literal = New Literal()
            item32.Text = Convert.ToDouble(DataBinder.Eval(item.DataItem, "UnitPrice").ToString()).ToString("$#,##0.00;($#,##0.00);Zero")

            Dim item33 As Literal = New Literal()
            item33.Text = "</div>"

            templatePlaceHolder.Controls.Add(item11)
            templatePlaceHolder.Controls.Add(img)
            templatePlaceHolder.Controls.Add(item12)
            templatePlaceHolder.Controls.Add(item21)
            templatePlaceHolder.Controls.Add(item22)
            templatePlaceHolder.Controls.Add(item23)
            templatePlaceHolder.Controls.Add(item31)
            templatePlaceHolder.Controls.Add(item32)
            templatePlaceHolder.Controls.Add(item33)
        End Sub
    End Class
End Class

