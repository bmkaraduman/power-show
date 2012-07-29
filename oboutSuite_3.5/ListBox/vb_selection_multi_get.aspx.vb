Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_selection_multi_get
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(300)
        ListBox1.Height = Unit.Pixel(200)
        ListBox1.SelectionMode = ListSelectionMode.Multiple
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CompanyName"
        ListBox1.DataValueField = "CustomerID"

        ListBox1Container.Controls.Add(ListBox1)
    End Sub

    Sub Postback(ByVal sender As Object, ByVal e As EventArgs)
        Dim details As String = "<br /><br />"
        Dim hasSelectedItems As Boolean = False
        Dim item As Obout.ListBox.ListBoxItem

        For Each item In ListBox1.Items
            If item.Selected = True Then

                If hasSelectedItems = False Then

                    details += "<br /><b>Selected items:</b>"
                    hasSelectedItems = True
                End If

                details += "<br />" + item.Text
            End If
        Next

        Literal1.Text = details
    End Sub
End Class
