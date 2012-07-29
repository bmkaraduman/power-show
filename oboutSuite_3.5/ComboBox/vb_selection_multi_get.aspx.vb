Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_solutions_multi_get
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

   Sub Page_load(ByVal sender As Object, ByVal e As EventArgs) 
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(300)
        ComboBox1.Height = Unit.Pixel(200)
        ComboBox1.SelectionMode = ListSelectionMode.Multiple
        ComboBox1.AllowEdit = False
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub

    Sub Postback(ByVal sender As Object, ByVal e As EventArgs)

        Dim details As String = "<br /><br />"
        Dim item As Obout.ComboBox.ComboBoxItem

        Dim hasSelectedItems As Boolean = False

        For Each item In ComboBox1.Items

            If (item.Selected) Then

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
