Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_master_detail_unlimited
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Dim ListBox2 As Obout.ListBox.ListBox
    Dim ListBox3 As Obout.ListBox.ListBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "CustomersList"
        ListBox1.Width = Unit.Pixel(275)
        ListBox1.Height = Unit.Pixel(150)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CompanyName"
        ListBox1.DataValueField = "CustomerID"

        ListBox1.HeaderTemplate = New HeaderTemplate("CUSTOMERS")


        ListBox2 = New Obout.ListBox.ListBox()
        ListBox2.ID = "OrdersList"
        ListBox2.Width = Unit.Pixel(200)
        ListBox2.Height = Unit.Pixel(150)
        ListBox2.EnableLoadOnDemand = True
        ListBox2.DataSourceID = "sds2"
        ListBox2.DataTextField = "OrderID"
        ListBox2.DataValueField = "OrderID"

        ListBox2.HeaderTemplate = New HeaderTemplate("ORDERS")
        ListBox2.ItemTemplate = New ItemTemplate()

        AddHandler ListBox2.LoadingItems, AddressOf OrdersList_LoadingItems

        ListBox1.Details.Add(ListBox2)


        ListBox3 = New Obout.ListBox.ListBox()
        ListBox3.ID = "ProductsList"
        ListBox3.Width = Unit.Pixel(200)
        ListBox3.Height = Unit.Pixel(150)
        ListBox3.EnableLoadOnDemand = True
        ListBox3.DataSourceID = "sds3"
        ListBox3.DataTextField = "ProductName"
        ListBox3.DataValueField = "ProductID"

        ListBox3.HeaderTemplate = New HeaderTemplate("PRODUCTS")

        AddHandler ListBox3.LoadingItems, AddressOf ProductsList_LoadingItems

        ListBox2.Details.Add(ListBox3)


        ComboBox1Container.Controls.Add(ListBox1)
    End Sub
    Sub OrdersList_LoadingItems(ByVal sender As Object, ByVal e As ListBoxLoadingItemsEventArgs)

        If Not (String.IsNullOrEmpty(e.Text)) Then

            sds2.SelectParameters(0).DefaultValue = e.Text
        End If

    End Sub

    Sub ProductsList_LoadingItems(ByVal sender As Object, ByVal e As ListBoxLoadingItemsEventArgs)

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
            Dim container As ListBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ListBoxItemTemlateContainer)
            Dim item As Obout.ListBox.ListBoxItem = CType(container.Parent, Obout.ListBox.ListBoxItem)

            Dim itemText As Literal = New Literal()
            itemText.Text = "#" + DataBinder.Eval(item.DataItem, "OrderID").ToString()

            templatePlaceHolder.Controls.Clear()
            templatePlaceHolder.Controls.Add(itemText)
        End Sub

    End Class
End Class

