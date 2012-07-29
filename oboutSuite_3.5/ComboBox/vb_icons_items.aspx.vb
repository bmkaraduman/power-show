Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_icons_items
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBox2 As ComboBox

      Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(175)
        ComboBox1.ShowSelectedImage = False
        ComboBox1.SelectedIndex = 2

        Dim item1 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item1.Text = "USA"
        item1.Value = "1"
        item1.ImageUrl = "resources/Images/flags/flag_usa.png"
        ComboBox1.Items.Add(item1)

        Dim item2 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item2.Text = "UK"
        item2.Value = "2"
        item2.ImageUrl = "resources/Images/flags/flag_england.png"
        ComboBox1.Items.Add(item2)

        Dim item3 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item3.Text = "Germany"
        item3.Value = "3"
        item3.ImageUrl = "resources/Images/flags/flag_germany.png"
        ComboBox1.Items.Add(item3)

        Dim item4 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item4.Text = "France"
        item4.Value = "4"
        item4.ImageUrl = "resources/Images/flags/flag_france.png"
        ComboBox1.Items.Add(item4)

        Dim item5 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item5.Text = "Russia"
        item5.Value = "5"
        item5.ImageUrl = "resources/Images/flags/flag_russia.png"
        ComboBox1.Items.Add(item5)

        Dim item6 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item6.Text = "India"
        item6.Value = "6"
        item6.ImageUrl = "resources/Images/flags/flag_india.png"
        ComboBox1.Items.Add(item6)

        Dim item7 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item7.Text = "Japan"
        item7.Value = "7"
        item7.ImageUrl = "resources/Images/flags/flag_japan.png"
        ComboBox1.Items.Add(item7)

        Dim item8 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item8.Text = "China"
        item8.Value = "8"
        item8.ImageUrl = "resources/Images/flags/flag_china.png"
        ComboBox1.Items.Add(item8)


        ComboBox1Container.Controls.Add(ComboBox1)


        ComboBox2 = New ComboBox()
        ComboBox2.ID = "ComboBox2"
        ComboBox2.Width = Unit.Pixel(175)
        ComboBox2.ShowSelectedImage = True
        ComboBox2.SelectedIndex = 5

        Dim item9 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item9.Text = "USA"
        item9.Value = "9"
        item9.ImageUrl = "resources/Images/flags/flag_usa.png"
        ComboBox2.Items.Add(item9)

        Dim item10 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item10.Text = "UK"
        item10.Value = "10"
        item10.ImageUrl = "resources/Images/flags/flag_england.png"
        ComboBox2.Items.Add(item10)

        Dim item11 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item11.Text = "Germany"
        item11.Value = "11"
        item11.ImageUrl = "resources/Images/flags/flag_germany.png"
        ComboBox2.Items.Add(item11)

        Dim item12 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item12.Text = "France"
        item12.Value = "12"
        item12.ImageUrl = "resources/Images/flags/flag_france.png"
        ComboBox2.Items.Add(item12)

        Dim item13 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item13.Text = "Russia"
        item13.Value = "13"
        item13.ImageUrl = "resources/Images/flags/flag_russia.png"
        ComboBox2.Items.Add(item13)

        Dim item14 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item14.Text = "India"
        item14.Value = "14"
        item14.ImageUrl = "resources/Images/flags/flag_india.png"
        ComboBox2.Items.Add(item14)

        Dim item15 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item15.Text = "Japan"
        item15.Value = "15"
        item15.ImageUrl = "resources/Images/flags/flag_japan.png"
        ComboBox2.Items.Add(item15)

        Dim item16 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item16.Text = "China"
        item16.Value = "16"
        item16.ImageUrl = "resources/Images/flags/flag_china.png"
        ComboBox2.Items.Add(item16)

        ComboBox2Container.Controls.Add(ComboBox2)
    End Sub

End Class
