Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_different_styles
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBox2 As ComboBox
    Dim ComboBox3 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(250)
        ComboBox1.EmptyText = "Select a customer ..."
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"
        ComboBox1.FolderStyle = "styles/black_glass"

        ComboBoxContainer1.Controls.Add(ComboBox1)

        ComboBox2 = New ComboBox()
        ComboBox2.ID = "ComboBox2"
        ComboBox2.Width = Unit.Pixel(250)
        ComboBox2.EmptyText = "Select a customer ..."
        ComboBox2.DataSourceID = "sds1"
        ComboBox2.DataTextField = "CompanyName"
        ComboBox2.DataValueField = "CustomerID"
        ComboBox2.FolderStyle = "_"

        ComboBoxContainer2.Controls.Add(ComboBox2)

        ComboBox3 = New ComboBox()
        ComboBox3.ID = "ComboBox3"
        ComboBox3.Width = Unit.Pixel(250)
        ComboBox3.EmptyText = "Select a customer ..."
        ComboBox3.DataSourceID = "sds1"
        ComboBox3.DataTextField = "CompanyName"
        ComboBox3.DataValueField = "CustomerID"
        ComboBox3.FolderStyle = "_"

        ComboBoxContainer3.Controls.Add(ComboBox3)
    End Sub
End Class
