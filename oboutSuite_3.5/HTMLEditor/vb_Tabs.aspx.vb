Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports Obout.Ajax.UI.HTMLEditor

Partial Public Class HTMLEditor_vb_Tabs
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            editor1.EditPanel.Content = "Some text for <span style=""font-weight: bold"">Tab</span> panel #1"
            editor2.EditPanel.Content = "Some text for <span style=""font-weight: bold"">Tab</span> panel #2"
        End If
    End Sub
End Class