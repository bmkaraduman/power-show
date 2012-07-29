Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_icons_columns
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(430)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "ControlName"
        ListBox1.DataValueField = "ControlID"

        AddHandler ListBox1.ItemDataBound, AddressOf ListBox1_ItemDataBound

        ListBox1Container.Controls.Add(ListBox1)
    End Sub

    Sub ListBox1_ItemDataBound(ByVal sender As Object, ByVal e As ListBoxItemEventArgs)

        e.Item.ImageUrl = "resources/images/products/" + DataBinder.Eval(e.Item.DataItem, "ImageName")
    End Sub
End Class
