Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_populate_declarative
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"

        Dim item1 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item1.Text = "Item 1"
        item1.Value = "1"
        ListBox1.Items.Add(item1)

        Dim item2 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item2.Text = "Item 2"
        item2.Value = "2"
        ListBox1.Items.Add(item2)

        Dim item3 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item3.Text = "Item 3"
        item3.Value = "3"
        ListBox1.Items.Add(item3)

        Dim item4 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item4.Text = "Item 4"
        item4.Value = "4"
        ListBox1.Items.Add(item4)

        Dim item5 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item5.Text = "Item 5"
        item5.Value = "5"
        ListBox1.Items.Add(item5)

        ListBox1Container.Controls.Add(ListBox1)

    End Sub

End Class
