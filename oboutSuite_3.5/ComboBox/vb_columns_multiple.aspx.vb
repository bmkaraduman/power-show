Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_columns_multiple
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBox2 As ComboBox
    Dim ComboBox3 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.MenuWidth = Unit.Pixel(325)
        ComboBox1.Width = Unit.Pixel(150)
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CountryName"
        ComboBox1.DataValueField = "CountryID"

        ComboBox1Container.Controls.Add(ComboBox1)


        ComboBox2 = New ComboBox()
        ComboBox2.ID = "ComboBox2"
        ComboBox2.MenuWidth = Unit.Pixel(475)
        ComboBox2.Width = Unit.Pixel(150)
        ComboBox2.DataSourceID = "sds1"
        ComboBox2.DataTextField = "CountryName"
        ComboBox2.DataValueField = "CountryID"

        ComboBox2Container.Controls.Add(ComboBox2)

        ComboBox3 = New ComboBox()
        ComboBox3.ID = "ComboBox3"
        ComboBox3.MenuWidth = Unit.Pixel(650)
        ComboBox3.Width = Unit.Pixel(150)
        ComboBox3.DataSourceID = "sds1"
        ComboBox3.DataTextField = "CountryName"
        ComboBox3.DataValueField = "CountryID"

        ComboBox3Container.Controls.Add(ComboBox3)
    End Sub
End Class
