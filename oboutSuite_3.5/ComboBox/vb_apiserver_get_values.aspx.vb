Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports System.Web
Imports System.Web.UI
Partial Class ComboBox_vb_apiserver_get_values
    Inherits System.Web.UI.Page
    Dim ComboBox1 As Obout.ComboBox.ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New Obout.ComboBox.ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(400)
        ComboBox1.Height = Unit.Pixel(150)
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "SupplierID"
        ComboBox1.AutoPostBack = True
        ComboBox1.EmptyText = "Please select an item ..."


        ComboBox1.HeaderTemplate = New HeaderTemplate()
        ComboBox1.ItemTemplate = New ItemTemplate()
        ComboBox1.FooterTemplate = New FooterTemplate()

        AddHandler ComboBox1.SelectedIndexChanged, AddressOf ComboBox1_SelectedIndexChanged

        ComboBox1Container.Controls.Add(ComboBox1)
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
            Dim container As ComboBoxFooterTemlateContainer = CType(templatePlaceHolder.NamingContainer, ComboBoxFooterTemlateContainer)

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

            Dim cont11 As Literal = New Literal()
            cont11.Text = "<div class=""item c1"">"

            Dim Container1 As Literal = New Literal()
            Container1.ID = "Container1"

            Dim cont12 As Literal = New Literal()
            cont12.Text = "</div>"

            Dim cont21 As Literal = New Literal()
            cont21.Text = "<div class=""item c2"">"

            Dim Container2 As Literal = New Literal()
            Container2.ID = "Container2"

            Dim cont22 As Literal = New Literal()
            cont22.Text = "</div>"

            Dim cont31 As Literal = New Literal()
            cont31.Text = "<div class=""item c3"">"

            Dim Container3 As Literal = New Literal()
            Container3.ID = "Container3"

            Dim cont32 As Literal = New Literal()
            cont32.Text = "</div>"

            templatePlaceHolder.Controls.Add(cont11)
            templatePlaceHolder.Controls.Add(Container1)
            templatePlaceHolder.Controls.Add(cont12)
            templatePlaceHolder.Controls.Add(cont21)
            templatePlaceHolder.Controls.Add(Container2)
            templatePlaceHolder.Controls.Add(cont22)
            templatePlaceHolder.Controls.Add(cont31)
            templatePlaceHolder.Controls.Add(Container3)
            templatePlaceHolder.Controls.Add(cont32)
        End Sub
        Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)
            Dim templatePlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
            Dim container As ComboBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ComboBoxItemTemlateContainer)
            Dim item As Obout.ComboBox.ComboBoxItem = CType(container.Parent, Obout.ComboBox.ComboBoxItem)

            Dim Container1 As Literal = CType(item.FindControl("Container1"), Literal)
            Container1.Text = DataBinder.Eval(item.DataItem, "SupplierID").ToString()

            Dim Container2 As Literal = CType(item.FindControl("Container2"), Literal)
            Container2.Text = DataBinder.Eval(item.DataItem, "CompanyName").ToString()

            Dim Container3 As Literal = CType(item.FindControl("Container3"), Literal)
            Container3.Text = DataBinder.Eval(item.DataItem, "City").ToString()
        End Sub
    End Class
    Sub ComboBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As ComboBoxItemEventArgs)
        Dim container1 As Literal = CType(e.Item.FindControl("Container1"), Literal)
        Dim container2 As Literal = CType(e.Item.FindControl("Container2"), Literal)
        Dim container3 As Literal = CType(e.Item.FindControl("Container3"), Literal)

        Dim getValue As String = "<br /><br />"

        getValue += "<b>Supplier ID</b>: " + container1.Text
        getValue += "<br />"
        getValue += "<b>Company Name</b>: " + container2.Text
        getValue += "<br />"
        getValue += "<b>City</b>: " + container3.Text

        Details.Text = getValue
    End Sub
End Class

