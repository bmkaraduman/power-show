Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_icons_columns
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

     Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(200)
        ComboBox1.MenuWidth = Unit.Pixel(450)
        ComboBox1.ShowSelectedImage = True
        ComboBox1.AllowEdit = False
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "ControlName"
        ComboBox1.DataValueField = "ControlID"

        AddHandler ComboBox1.ItemDataBound, AddressOf ComboBox1_ItemDataBound

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub

    Sub ComboBox1_ItemDataBound(ByVal sender As Object, ByVal e As ComboBoxItemEventArgs)
        e.Item.ImageUrl = "resources/images/products/" + DataBinder.Eval(e.Item.DataItem, "ImageName")
    End Sub
End Class
