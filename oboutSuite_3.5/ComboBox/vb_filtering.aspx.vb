Imports Obout.ComboBox
Partial Class ComboBox_vb_filtering
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(300)
        ComboBox1.Height = Unit.Pixel(200)
        ComboBox1.FilterType = ComboBoxFilterType.StartsWith
        ComboBox1.EmptyText = "Search for customers ..."
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub
End Class
