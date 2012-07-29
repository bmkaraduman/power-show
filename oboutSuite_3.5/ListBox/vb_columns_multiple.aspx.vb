Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_columns_multiple
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Dim ListBox2 As Obout.ListBox.ListBox
    Dim ListBox3 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(345)
        ListBox1.Height = Unit.Pixel(265)
        ListBox1.FolderStyle = "styles/premiere_blue"
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CountryName"
        ListBox1.DataValueField = "CountryID"

        ListBox1Container.Controls.Add(ListBox1)

        ListBox2 = New Obout.ListBox.ListBox()
        ListBox2.ID = "ListBox2"
        ListBox2.Width = Unit.Pixel(475)
        ListBox2.FolderStyle = "styles/premiere_blue"
        ListBox2.DataSourceID = "sds1"
        ListBox2.DataTextField = "CountryName"
        ListBox2.DataValueField = "CountryID"

        ListBox2Container.Controls.Add(ListBox2)

        ListBox3 = New Obout.ListBox.ListBox()
        ListBox3.ID = "ListBox3"
        ListBox3.Width = Unit.Pixel(650)
        ListBox3.FolderStyle = "styles/premiere_blue"
        ListBox3.DataSourceID = "sds1"
        ListBox3.DataTextField = "CountryName"
        ListBox3.DataValueField = "CountryID"

        ListBox3Container.Controls.Add(ListBox3)
    End Sub

End Class
