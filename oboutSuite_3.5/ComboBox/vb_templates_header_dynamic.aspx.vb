Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports System.Web
Imports System.Web.UI

Partial Class ComboBox_vb_templates_header_dynamic
    Inherits System.Web.UI.Page
    Dim ComboBox1 As Obout.ComboBox.ComboBox
    Dim ComboBox2 As Obout.ComboBox.ComboBox
    Dim ComboBox3 As Obout.ComboBox.ComboBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New Obout.ComboBox.ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(275)
        ComboBox1.Height = Unit.Pixel(200)
        ComboBox1.AutoPostBack = True
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"
        ComboBox1.AppendDataBoundItems = False

        AddHandler ComboBox1.SelectedIndexChanged, AddressOf ComboBox1_OnSelectedIndexChanged

        ComboBox1Container.Controls.Add(ComboBox1)


        ComboBox2 = New Obout.ComboBox.ComboBox()
        ComboBox2.ID = "ComboBox2"
        ComboBox2.Width = Unit.Pixel(275)
        ComboBox2.Height = Unit.Pixel(200)
        ComboBox2.Enabled = False
        ComboBox2.AutoPostBack = True
        ComboBox2.DataSourceID = "sds2"
        ComboBox2.DataTextField = "OrderID"
        ComboBox2.DataValueField = "OrderID"
        ComboBox2.AppendDataBoundItems = False

        AddHandler ComboBox2.SelectedIndexChanged, AddressOf ComboBox2_OnSelectedIndexChanged

        ComboBox2Container.Controls.Add(ComboBox2)


        ComboBox3 = New Obout.ComboBox.ComboBox()
        ComboBox3.ID = "ComboBox3"
        ComboBox3.Width = Unit.Pixel(275)
        ComboBox3.Height = Unit.Pixel(200)
        ComboBox3.Enabled = False
        ComboBox3.DataSourceID = "sds3"
        ComboBox3.DataTextField = "CompanyName"
        ComboBox3.DataValueField = "SupplierID"
        ComboBox3.AppendDataBoundItems = False

        ComboBox3Container.Controls.Add(ComboBox3)


        If Not IsPostBack Then

            ConfigureHeaderTemplates()
        End If
    End Sub
    Sub ConfigureHeaderTemplates()

        ComboBox1.HeaderTemplate = New HeaderTemplate("CUSTOMERS")
        ComboBox2.HeaderTemplate = New HeaderTemplate((IIf(ComboBox1.SelectedText <> [String].Empty, ComboBox1.SelectedText, "")))
        ComboBox3.HeaderTemplate = New HeaderTemplate((IIf(ComboBox2.SelectedText <> [String].Empty, "Order #" + ComboBox2.SelectedText, "")))

        ComboBox1.DataBind()
        ComboBox2.DataBind()
        ComboBox3.DataBind()
    End Sub

    Sub ComboBox1_OnSelectedIndexChanged(ByVal sender As Object, ByVal e As Obout.ComboBox.ComboBoxItemEventArgs)

        ComboBox2.SelectedText = ""

        ConfigureHeaderTemplates()

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

    Sub ComboBox2_OnSelectedIndexChanged(ByVal sender As Object, ByVal e As Obout.ComboBox.ComboBoxItemEventArgs)

        ComboBox3.SelectedText = ""

        ConfigureHeaderTemplates()

        sds3.SelectParameters(0).DefaultValue = (IIf(ComboBox2.SelectedIndex <> -1, ComboBox2.SelectedValue, ""))

        ComboBox3.Enabled = (ComboBox2.SelectedIndex <> -1)
        ComboBox3.Items.Clear()
        ComboBox3.SelectedIndex = -1
        ComboBox3.DataBind()

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


