Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_master_detail_cascading
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBox2 As ComboBox
    Dim ComboBox3 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(275)
        ComboBox1.Height = Unit.Pixel(250)
        ComboBox1.AutoPostBack = True
        ComboBox1.EmptyText = "Select a customer ..."
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        AddHandler ComboBox1.SelectedIndexChanged, AddressOf ComboBox1_OnSelectedIndexChanged

        ComboBox1Container.Controls.Add(ComboBox1)


        ComboBox2 = New ComboBox()
        ComboBox2.ID = "ComboBox2"
        ComboBox2.Width = Unit.Pixel(275)
        ComboBox2.Enabled = False
        ComboBox2.AutoPostBack = True
        ComboBox2.EmptyText = "Select an order ..."
        ComboBox2.DataSourceID = "sds2"
        ComboBox2.DataTextField = "OrderID"
        ComboBox2.DataValueField = "OrderID"

        AddHandler ComboBox2.SelectedIndexChanged, AddressOf ComboBox2_OnSelectedIndexChanged

        ComboBox2Container.Controls.Add(ComboBox2)


        ComboBox3 = New ComboBox()
        ComboBox3.ID = "ComboBox3"
        ComboBox3.Width = Unit.Pixel(275)
        ComboBox3.Enabled = False
        ComboBox3.EmptyText = "Select a supplier ..."
        ComboBox3.DataSourceID = "sds3"
        ComboBox3.DataTextField = "CompanyName"
        ComboBox3.DataValueField = "SupplierID"

        ComboBox3Container.Controls.Add(ComboBox3)

    End Sub
    Sub ComboBox1_OnSelectedIndexChanged(ByVal sender As Object, ByVal e As ComboBoxItemEventArgs)

        sds2.SelectParameters(0).DefaultValue = ComboBox1.SelectedValue
        sds3.SelectParameters(0).DefaultValue = ""

        ComboBox2.Enabled = True
        ComboBox2.Items.Clear()
        ComboBox2.SelectedIndex = -1
        ComboBox2.SelectedValue = ""
        ComboBox2.DataBind()

        ComboBox3.Enabled = False
        ComboBox3.Items.Clear()
        ComboBox3.SelectedIndex = -1
    End Sub
    Sub ComboBox2_OnSelectedIndexChanged(ByVal sender As Object, ByVal e As ComboBoxItemEventArgs)

        sds3.SelectParameters(0).DefaultValue = IIf(ComboBox2.SelectedIndex <> -1, ComboBox2.SelectedValue, "")

        ComboBox3.Enabled = (ComboBox2.SelectedIndex <> -1)
        ComboBox3.Items.Clear()
        ComboBox3.SelectedIndex = -1
        ComboBox3.DataBind()
    End Sub
End Class
