Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_populate_declarative
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"

        Dim item1 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item1.Text = "Item 1"
        item1.Value = "1"
        ComboBox1.Items.Add(item1)

        Dim item2 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item2.Text = "Item 2"
        item2.Value = "2"
        ComboBox1.Items.Add(item2)

        Dim item3 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item3.Text = "Item 3"
        item3.Value = "3"
        ComboBox1.Items.Add(item3)

        Dim item4 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item4.Text = "Item 4"
        item4.Value = "4"
        ComboBox1.Items.Add(item4)

        Dim item5 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item5.Text = "Item 5"
        item5.Value = "5"
        ComboBox1.Items.Add(item5)

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub
End Class
