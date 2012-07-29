Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_settings_height
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBox2 As ComboBox

   Sub Page_load(ByVal sender As Object, ByVal e As EventArgs) 
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(150)
        ComboBox1.EmptyText = "Select a country ..."
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CountryName"
        ComboBox1.DataValueField = "CountryID"

        ComboBox1Container.Controls.Add(ComboBox1)


        ComboBox2 = New ComboBox()
        ComboBox2.ID = "ComboBox2"
        ComboBox2.Width = Unit.Pixel(150)
        ComboBox2.Height = Unit.Pixel(150)
        ComboBox2.EmptyText = "Select a country ..."
        ComboBox2.DataSourceID = "sds1"
        ComboBox2.DataTextField = "CountryName"
        ComboBox2.DataValueField = "CountryID"

        ComboBox2Container.Controls.Add(ComboBox2)
    End Sub
End Class
