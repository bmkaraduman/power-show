Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_customization_align
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBox2 As ComboBox
    Dim ComboBox3 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(200)
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        ComboBox1Container.Controls.Add(ComboBox1)

        ComboBox2 = New ComboBox()
        ComboBox2.ID = "ComboBox2"
        ComboBox2.Width = Unit.Pixel(200)
        ComboBox2.DataSourceID = "sds1"
        ComboBox2.DataTextField = "CompanyName"
        ComboBox2.DataValueField = "CustomerID"
        ComboBox2.CssSettings.ItemsContainer = "ob_iCboIC center"

        ComboBox2Container.Controls.Add(ComboBox2)

        ComboBox3 = New ComboBox()
        ComboBox3.ID = "ComboBox3"
        ComboBox3.Width = Unit.Pixel(200)
        ComboBox3.DataSourceID = "sds1"
        ComboBox3.DataTextField = "CompanyName"
        ComboBox3.DataValueField = "CustomerID"
        ComboBox3.CssSettings.ItemsContainer = "ob_iCboIC right"

        ComboBox3Container.Controls.Add(ComboBox3)
    End Sub
End Class
