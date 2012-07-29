Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_columns_grid_tooltips
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox3"
        ListBox1.Width = Unit.Pixel(400)
        ListBox1.Height = Unit.Pixel(150)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CompanyName"
        ListBox1.DataValueField = "SupplierID"

        ListBox1.HeaderTemplate = New HeaderTemplate()
        ListBox1.ItemTemplate = New ItemTemplate()
        ListBox1.FooterTemplate = New FooterTemplate()

        ListBox1Container.Controls.Add(ListBox1)
    End Sub
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
    Public Class ItemTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)
            AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate
        End Sub
        Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)
            Dim templatePlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
            Dim container As ListBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ListBoxItemTemlateContainer)
            Dim item As Obout.ListBox.ListBoxItem = CType(container.Parent, Obout.ListBox.ListBoxItem)

            Dim Title As Literal = New Literal()
            Title.Text = "<div title=""" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + " from " + DataBinder.Eval(item.DataItem, "City").ToString() + """ > "

            Dim supplierIDText As Literal = New Literal()
            supplierIDText.Text = "<div class=""item c1"">" + DataBinder.Eval(item.DataItem, "SupplierID").ToString() + "</div>"

            Dim companyNameText As Literal = New Literal()
            companyNameText.Text = "<div class=""item c2"">" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + "</div>"

            Dim cityText As Literal = New Literal()
            cityText.Text = " <div class=""item c3"">" + DataBinder.Eval(item.DataItem, "City").ToString() + "</div>"

            Dim endTitle As Literal = New Literal()
            endTitle.Text = "</div>"

            templatePlaceHolder.Controls.Add(Title)
            templatePlaceHolder.Controls.Add(supplierIDText)
            templatePlaceHolder.Controls.Add(companyNameText)
            templatePlaceHolder.Controls.Add(cityText)
            templatePlaceHolder.Controls.Add(endTitle)
        End Sub
    End Class
End Class
