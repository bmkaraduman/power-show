Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_apiserver_events
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Dim ListBox2 As Obout.ListBox.ListBox
    Dim ListBox3 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(200)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CompanyName"
        ListBox1.DataValueField = "CustomerID"

        ListBox1Container.Controls.Add(ListBox1)

        ListBox2 = New Obout.ListBox.ListBox()
        ListBox2.ID = "ListBox2"
        ListBox2.Width = Unit.Pixel(200)
        ListBox2.DataSourceID = "sds1"
        ListBox2.DataTextField = "CompanyName"
        ListBox2.DataValueField = "CustomerID"
        ListBox2.CssSettings.ItemsContainer = "ob_iLboIC center"

        ListBox2Container.Controls.Add(ListBox2)

        ListBox3 = New Obout.ListBox.ListBox()
        ListBox3.ID = "ListBox3"
        ListBox3.Width = Unit.Pixel(200)
        ListBox3.DataSourceID = "sds1"
        ListBox3.DataTextField = "CompanyName"
        ListBox3.DataValueField = "CustomerID"
        ListBox3.CssSettings.ItemsContainer = "ob_iLboIC right"

        ListBox3Container.Controls.Add(ListBox3)
    End Sub
End Class
