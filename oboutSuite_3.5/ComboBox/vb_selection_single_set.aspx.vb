Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_selection_single_set
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBox2 As ComboBox
    Dim ComboBox3 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs) 
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(200)
        ComboBox1.Height = Unit.Pixel(200)
        ComboBox1.SelectedIndex = 2
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        ComboBox1Container.Controls.Add(ComboBox1)

        ComboBox2 = New ComboBox()
        ComboBox2.ID = "ComboBox2"
        ComboBox2.Width = Unit.Pixel(200)
        ComboBox2.Height = Unit.Pixel(200)
        ComboBox2.SelectedValue = "ALFKI"
        ComboBox2.DataSourceID = "sds1"
        ComboBox2.DataTextField = "CompanyName"
        ComboBox2.DataValueField = "CustomerID"

        ComboBox2Container.Controls.Add(ComboBox2)

        ComboBox3 = New ComboBox()
        ComboBox3.ID = "ComboBox3"
        ComboBox3.Width = Unit.Pixel(200)
        ComboBox3.Height = Unit.Pixel(200)
        ComboBox3.DataSourceID = "sds1"
        ComboBox3.DataTextField = "CompanyName"
        ComboBox3.DataValueField = "CustomerID"
        AddHandler ComboBox3.ItemDataBound, AddressOf ComboBox3_ItemDataBound

        ComboBox3Container.Controls.Add(ComboBox3)

    End Sub

    Sub ComboBox3_ItemDataBound(ByVal sender As Object, ByVal e As ComboBoxItemEventArgs)
        If (e.Item.Value = "AROUT") = True Then
            e.Item.Selected = True
        End If

    End Sub
End Class
