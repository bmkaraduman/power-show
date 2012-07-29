Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_icons_items
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox


    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(175)
        ListBox1.SelectedIndex = 2

        Dim item1 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item1.Text = "USA"
        item1.Value = "1"
        item1.ImageUrl = "resources/Images/flags/flag_usa.png"
        ListBox1.Items.Add(item1)

        Dim item2 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item2.Text = "UK"
        item2.Value = "2"
        item2.ImageUrl = "resources/Images/flags/flag_england.png"
        ListBox1.Items.Add(item2)

        Dim item3 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item3.Text = "Germany"
        item3.Value = "3"
        item3.ImageUrl = "resources/Images/flags/flag_germany.png"
        ListBox1.Items.Add(item3)

        Dim item4 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item4.Text = "France"
        item4.Value = "4"
        item4.ImageUrl = "resources/Images/flags/flag_france.png"
        ListBox1.Items.Add(item4)

        Dim item5 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item5.Text = "Russia"
        item5.Value = "5"
        item5.ImageUrl = "resources/Images/flags/flag_russia.png"
        ListBox1.Items.Add(item5)

        Dim item6 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item6.Text = "India"
        item6.Value = "6"
        item6.ImageUrl = "resources/Images/flags/flag_india.png"
        ListBox1.Items.Add(item6)

        Dim item7 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item7.Text = "Japan"
        item7.Value = "7"
        item7.ImageUrl = "resources/Images/flags/flag_japan.png"
        ListBox1.Items.Add(item7)

        Dim item8 As Obout.ListBox.ListBoxItem = New Obout.ListBox.ListBoxItem()
        item8.Text = "China"
        item8.Value = "8"
        item8.ImageUrl = "resources/Images/flags/flag_china.png"
        ListBox1.Items.Add(item8)

        ListBox1Container.Controls.Add(ListBox1)
    End Sub
End Class
