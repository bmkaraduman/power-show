Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls

Partial Class ComboBox_vb_templates_header
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(250)
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        ComboBox1.HeaderTemplate = New HeaderTemplate3()

        ComboBox1Container.Controls.Add(ComboBox1)
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
