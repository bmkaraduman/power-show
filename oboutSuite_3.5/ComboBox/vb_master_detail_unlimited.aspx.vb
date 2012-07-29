Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_master_detail_unlimited
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBox2 As ComboBox
    Dim ComboBox3 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "CustomersCombo"
        ComboBox1.Width = Unit.Pixel(275)
        ComboBox1.Height = Unit.Pixel(150)
        ComboBox1.EmptyText = "Select a product ..."
        ComboBox1.AutoClose = False
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        ComboBox1.HeaderTemplate = New HeaderTemplate("CUSTOMERS")


        ComboBox2 = New ComboBox()
        ComboBox2.ID = "OrdersCombo"
        ComboBox2.Width = Unit.Pixel(200)
        ComboBox2.Height = Unit.Pixel(150)
        ComboBox2.EnableLoadOnDemand = True
        ComboBox2.EmptyText = "Select a product ..."
        ComboBox2.AutoClose = False
        ComboBox2.DataSourceID = "sds2"
        ComboBox2.DataTextField = "OrderID"
        ComboBox2.DataValueField = "OrderID"

        ComboBox2.HeaderTemplate = New HeaderTemplate("ORDERS")
        ComboBox2.ItemTemplate = New ItemTemplate()

        AddHandler ComboBox2.LoadingItems, AddressOf OrdersCombo_LoadingItems

        ComboBox1.Details.Add(ComboBox2)


        ComboBox3 = New ComboBox()
        ComboBox3.ID = "OrdersCombo"
        ComboBox3.Width = Unit.Pixel(200)
        ComboBox3.Height = Unit.Pixel(150)
        ComboBox3.EnableLoadOnDemand = True
        ComboBox3.EmptyText = "Select a product ..."
        ComboBox3.DataSourceID = "sds3"
        ComboBox3.DataTextField = "ProductName"
        ComboBox3.DataValueField = "ProductID"

        ComboBox3.HeaderTemplate = New HeaderTemplate("PRODUCTS")

        AddHandler ComboBox3.LoadingItems, AddressOf ProductsCombo_LoadingItems

        ComboBox2.Details.Add(ComboBox3)


        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub
    Sub OrdersCombo_LoadingItems(ByVal sender As Object, ByVal e As ComboBoxLoadingItemsEventArgs)

        If Not (String.IsNullOrEmpty(e.Text)) Then

            sds2.SelectParameters(0).DefaultValue = e.Text
        End If

    End Sub

    Sub ProductsCombo_LoadingItems(ByVal sender As Object, ByVal e As ComboBoxLoadingItemsEventArgs)

        If Not (String.IsNullOrEmpty(e.Text)) Then

            sds3.SelectParameters(0).DefaultValue = e.Text

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
    Public Class ItemTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)
            AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate
        End Sub
        Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)
            Dim templatePlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
            Dim container As ComboBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ComboBoxItemTemlateContainer)
            Dim item As Obout.ComboBox.ComboBoxItem = CType(container.Parent, Obout.ComboBox.ComboBoxItem)

            Dim itemText As Literal = New Literal()
            itemText.Text = "#" + DataBinder.Eval(item.DataItem, "OrderID").ToString()

            templatePlaceHolder.Controls.Clear()
            templatePlaceHolder.Controls.Add(itemText)
        End Sub

    End Class
End Class
