Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_settings_width
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Dim ListBox2 As Obout.ListBox.ListBox
    Dim ListBox3 As Obout.ListBox.ListBox
    Dim ListBox4 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CountryName"
        ListBox1.DataValueField = "CountryID"

        ListBox1Container.Controls.Add(ListBox1)

        ListBox2 = New Obout.ListBox.ListBox()
        ListBox2.ID = "ListBox2"
        ListBox2.Width = Unit.Pixel(250)
        ListBox2.Height = Unit.Pixel(150)
        ListBox2.DataSourceID = "sds1"
        ListBox2.DataTextField = "CountryName"
        ListBox2.DataValueField = "CountryID"

        ListBox2Container.Controls.Add(ListBox2)

        ListBox3 = New Obout.ListBox.ListBox()
        ListBox3.ID = "ListBox3"
        ListBox3.Width = Unit.Percentage(25)
        ListBox3.Height = Unit.Pixel(150)
        ListBox3.DataSourceID = "sds1"
        ListBox3.DataTextField = "CountryName"
        ListBox3.DataValueField = "CountryID"

        ListBox3Container.Controls.Add(ListBox3)

        ListBox4 = New Obout.ListBox.ListBox()
        ListBox4.ID = "ListBox4"
        ListBox4.Width = Unit.Percentage(50)
        ListBox4.Height = Unit.Pixel(150)
        ListBox4.DataSourceID = "sds1"
        ListBox4.DataTextField = "CountryName"
        ListBox4.DataValueField = "CountryID"

        ListBox4Container.Controls.Add(ListBox4)

    End Sub
End Class
