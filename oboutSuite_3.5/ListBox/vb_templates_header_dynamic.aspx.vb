Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_templates_header_dynamic
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
        ListBox1.AppendDataBoundItems = False

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
        ListBox2.AppendDataBoundItems = False

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
        ListBox3.AppendDataBoundItems = False

        ListBox3Container.Controls.Add(ListBox3)


        If Not IsPostBack Then

            ConfigureHeaderTemplates()
        End If
    End Sub
    Sub ConfigureHeaderTemplates()

        ListBox1.HeaderTemplate = New HeaderTemplate("CUSTOMERS")
        ListBox2.HeaderTemplate = New HeaderTemplate((IIf(ListBox1.SelectedText <> [String].Empty, ListBox1.SelectedText, "")))
        ListBox3.HeaderTemplate = New HeaderTemplate((IIf(ListBox2.SelectedText <> [String].Empty, "Order #" + ListBox2.SelectedText, "")))

        ListBox1.DataBind()
        ListBox2.DataBind()
        ListBox3.DataBind()
    End Sub

    Sub ListBox1_OnSelectedIndexChanged(ByVal sender As Object, ByVal e As Obout.ListBox.ListBoxItemEventArgs)

        ListBox2.SelectedText = ""

        ConfigureHeaderTemplates()

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

    Sub ListBox2_OnSelectedIndexChanged(ByVal sender As Object, ByVal e As Obout.ListBox.ListBoxItemEventArgs)

        ListBox3.SelectedText = ""

        ConfigureHeaderTemplates()

        sds3.SelectParameters(0).DefaultValue = (IIf(ListBox2.SelectedIndex <> -1, ListBox2.SelectedValue, ""))

        ListBox3.Enabled = (ListBox2.SelectedIndex <> -1)
        ListBox3.Items.Clear()
        ListBox3.SelectedIndex = -1
        ListBox3.DataBind()

    End Sub
End Class

Public Class HeaderTemplate
    Implements ITemplate

    Private _text As String

    Sub New(ByVal text As String)

        _text = text

    End Sub
    Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
        Dim Header As Literal = New Literal()
        Header.Text = _text
        container.Controls.Add(Header)
    End Sub

End Class


