Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_selection_multi
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

     Sub Page_load(ByVal sender As Object, ByVal e As EventArgs) 
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(400)
        ComboBox1.AllowEdit = False
        ComboBox1.SelectionMode = ListSelectionMode.Multiple
        ComboBox1.EmptyText = "Select multiple countries ..."
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CountryName"
        ComboBox1.DataValueField = "CountryID"

        ComboBox1Container.Controls.Add(ComboBox1)

    End Sub
End Class
