Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_populate_collections
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

     Sub Page_load(ByVal sender As Object, ByVal e As EventArgs) 
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(250)
        ComboBox1.Height = Unit.Pixel(200)
        ComboBox1.DataTextField = "ShipName"
        ComboBox1.DataValueField = "OrderID"

        ComboBox1Container.Controls.Add(ComboBox1)

        If Page.IsPostBack = False Then
            ComboBox1.DataSource = OrdersGenericData.GetGenericOrders()
            ComboBox1.DataBind()
        End If
    End Sub
End Class
