Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_apiserver_events
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs) 
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(250)
        ComboBox1.EmptyText = "Select a customer ..."
        ComboBox1.AutoPostBack = True
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        AddHandler ComboBox1.SelectedIndexChanged, AddressOf ComboBox1_SelectedIndexChanged

        ComboBox1Container.Controls.Add(ComboBox1)

    End Sub

    Sub ComboBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As ComboBoxItemEventArgs)
        EventLogger.Text = "<br /><br /><b>The selection has been changed to:</b> " + e.Item.Text
    End Sub
End Class
