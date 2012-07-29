Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_templates_header
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(250)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CompanyName"
        ListBox1.DataValueField = "CustomerID"

        ListBox1.HeaderTemplate = New HeaderTemplate3()

        ListBox1Container.Controls.Add(ListBox1)
    End Sub
    Public Class HeaderTemplate3
        Implements ITemplate

        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim Header As Literal = New Literal()
            Header.Text = "<div class=""header"">CUSTOMERS</div>"
            container.Controls.Add(Header)
        End Sub

    End Class
End Class
