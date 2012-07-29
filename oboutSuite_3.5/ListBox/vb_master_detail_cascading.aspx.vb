Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_master_detail_cascading
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Dim ListBox2 As Obout.ListBox.ListBox
    Dim ListBox3 As Obout.ListBox.ListBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(275)
        ListBox1.Height = Unit.Pixel(200)
        ListBox1.AutoPostBack = True
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CompanyName"
        ListBox1.DataValueField = "CustomerID"

        AddHandler ListBox1.SelectedIndexChanged, AddressOf ListBox1_OnSelectedIndexChanged

        ListBox1Container.Controls.Add(ListBox1)


        ListBox2 = New Obout.ListBox.ListBox()
        ListBox2.ID = "ListBox2"
        ListBox2.Width = Unit.Pixel(275)
        ListBox2.Height = Unit.Pixel(200)
        ListBox2.Enabled = False
        ListBox2.AutoPostBack = True
        ListBox2.DataSourceID = "sds2"
        ListBox2.DataTextField = "OrderID"
        ListBox2.DataValueField = "OrderID"

        AddHandler ListBox2.SelectedIndexChanged, AddressOf ListBox2_OnSelectedIndexChanged

        ListBox2Container.Controls.Add(ListBox2)


        ListBox3 = New Obout.ListBox.ListBox()
        ListBox3.ID = "ListBox3"
        ListBox3.Width = Unit.Pixel(275)
        ListBox3.Height = Unit.Pixel(200)
        ListBox3.Enabled = False
        ListBox3.DataSourceID = "sds3"
        ListBox3.DataTextField = "CompanyName"
        ListBox3.DataValueField = "SupplierID"

        ListBox3Container.Controls.Add(ListBox3)

    End Sub
    Sub ListBox1_OnSelectedIndexChanged(ByVal sender As Object, ByVal e As ListBoxItemEventArgs)

        sds2.SelectParameters(0).DefaultValue = ListBox1.SelectedValue
        sds3.SelectParameters(0).DefaultValue = ""

        ListBox2.Enabled = True
        ListBox2.Items.Clear()
        ListBox2.SelectedIndex = -1
        ListBox2.SelectedValue = ""
        ListBox2.DataBind()

        ListBox3.Enabled = False
        ListBox3.Items.Clear()
        ListBox3.SelectedIndex = -1
    End Sub
    Sub ListBox2_OnSelectedIndexChanged(ByVal sender As Object, ByVal e As ListBoxItemEventArgs)

        sds3.SelectParameters(0).DefaultValue = IIf(ListBox2.SelectedIndex <> -1, ListBox2.SelectedValue, "")

        ListBox3.Enabled = (ListBox2.SelectedIndex <> -1)
        ListBox3.Items.Clear()
        ListBox3.SelectedIndex = -1
        ListBox3.DataBind()
    End Sub
End Class


