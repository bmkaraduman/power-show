Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_settings_width
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBox2 As ComboBox
    Dim ComboBox3 As ComboBox
    Dim ComboBox4 As ComboBox

     Sub Page_load(ByVal sender As Object, ByVal e As EventArgs) 
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.EmptyText = "Select a country ..."
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CountryName"
        ComboBox1.DataValueField = "CountryID"

        ComboBox1Container.Controls.Add(ComboBox1)

        ComboBox2 = New ComboBox()
        ComboBox2.ID = "ComboBox2"
        ComboBox2.Width = Unit.Pixel(250)
        ComboBox2.EmptyText = "Select a country ..."
        ComboBox2.DataSourceID = "sds1"
        ComboBox2.DataTextField = "CountryName"
        ComboBox2.DataValueField = "CountryID"

        ComboBox2Container.Controls.Add(ComboBox2)

        ComboBox3 = New ComboBox()
        ComboBox3.ID = "ComboBox3"
        ComboBox3.Width = Unit.Percentage(25)
        ComboBox3.EmptyText = "Select a country ..."
        ComboBox3.DataSourceID = "sds1"
        ComboBox3.DataTextField = "CountryName"
        ComboBox3.DataValueField = "CountryID"

        ComboBox3Container.Controls.Add(ComboBox3)

        ComboBox4 = New ComboBox()
        ComboBox4.ID = "ComboBox4"
        ComboBox4.Width = Unit.Percentage(50)
        ComboBox4.EmptyText = "Select a country ..."
        ComboBox4.DataSourceID = "sds1"
        ComboBox4.DataTextField = "CountryName"
        ComboBox4.DataValueField = "CountryID"

        ComboBox4Container.Controls.Add(ComboBox4)
    End Sub
End Class
