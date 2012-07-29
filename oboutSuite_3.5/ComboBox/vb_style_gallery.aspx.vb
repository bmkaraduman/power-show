Imports Obout.ComboBox
Partial Class ComboBox_vb_style_gallery
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.AllowEdit = False
        ComboBox1.AutoPostBack = True
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        AddHandler ComboBox1.SelectedIndexChanged, AddressOf ComboBox1_SelectedIndexChanged

        ComboBox1.Items.Add(New Obout.ComboBox.ComboBoxItem("black_glass"))
        ComboBox1.Items.Add(New Obout.ComboBox.ComboBoxItem("grand_gray"))
        ComboBox1.Items.Add(New Obout.ComboBox.ComboBoxItem("plain"))
        ComboBox1.Items.Add(New Obout.ComboBox.ComboBoxItem("premiere_blue"))

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub

    Sub ComboBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As ComboBoxItemEventArgs)

        ComboBox1.FolderStyle = "styles/" + e.Item.Value
    End Sub
End Class
