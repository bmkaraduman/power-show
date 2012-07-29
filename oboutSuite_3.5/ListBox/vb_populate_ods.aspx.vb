Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_populate_ods
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(200)
        ListBox1.Height = Unit.Pixel(200)
        ListBox1.DataSourceID = "ods1"
        ListBox1.DataTextField = "ShipName"
        ListBox1.DataValueField = "OrderID"

        ListBox1Container.Controls.Add(ListBox1)
    End Sub
End Class
