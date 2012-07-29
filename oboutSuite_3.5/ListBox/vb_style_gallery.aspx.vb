Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_style_gallery
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

     Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.AutoPostBack = True

        AddHandler ListBox1.SelectedIndexChanged, AddressOf ListBox1_SelectedIndexChanged

        ListBox1.Items.Add(New ListBoxItem("black_glass"))
        ListBox1.Items.Add(New ListBoxItem("grand_gray"))
        ListBox1.Items.Add(New ListBoxItem("plain"))
        ListBox1.Items.Add(New ListBoxItem("premiere_blue"))
        ListBox1Container.Controls.Add(ListBox1)

    End Sub

    Sub ListBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As ListBoxItemEventArgs)
        ListBox1.FolderStyle = "styles/" + e.Item.Value
    End Sub
End Class
