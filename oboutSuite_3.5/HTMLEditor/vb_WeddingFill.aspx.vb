Imports System.IO
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
Imports System.Collections.ObjectModel
Imports System.Globalization
Imports System.Data.OleDb

Partial Public Class HTMLEditor_vb_WeddingFill
    Inherits System.Web.UI.Page
    Private m_connString As String

    Private Sub Page_Load(ByVal o As Object, ByVal e As EventArgs)
        m_connString = "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE={0};"
        m_connString = [String].Format(m_connString, Server.MapPath("../App_Data/db.mdb"))
        BindGrid()
        forWedding.Text = GetContent()
    End Sub

    Private Sub BindGrid()
        ' Command  and connection string
        Dim strCmd As [String] = "SELECT * FROM tbWeddings"

        Dim da As New OleDbDataAdapter(strCmd, m_connString)
        Dim ds As New DataSet()
        da.Fill(ds, "tbWeddings")

        ds.Tables("tbWeddings").Columns.Add("checked", System.Type.[GetType]("System.Boolean"))
        For Each row As DataRow In ds.Tables("tbWeddings").Rows
            row("checked") = False
        Next

        If Page.IsPostBack Then
            If Request.Form("grpSelect") IsNot Nothing Then
                Dim selectedId As String = Request.Form("grpSelect").ToString()
                Dim rows As DataRow() = ds.Tables("tbWeddings").[Select]("id=" & selectedId)

                rows(0)("checked") = True

                Dim content As String = GetContent()

                content = content.Replace("[[parents]]", DirectCast(rows(0)("fldParents"), String))
                content = content.Replace("[[child's sex]]", DirectCast(rows(0)("fldChildSex"), String))
                content = content.Replace("[[child's name]]", DirectCast(rows(0)("fldChildName"), String))
                content = content.Replace("[[fiance(e)]]", DirectCast(rows(0)("fldFiance"), String))
                content = content.Replace("[[date]]", CType(rows(0)("fldDate"), DateTime).ToLongDateString())
                content = content.Replace("[[church]]", DirectCast(rows(0)("fldChurch"), String))
                content = content.Replace("[[city]]", DirectCast(rows(0)("fldCity"), String))
                content = content.Replace("[[state]]", DirectCast(rows(0)("fldState"), String))

                editor.Content = content
            End If
        End If

        MyDataGrid.DataSource = ds
        MyDataGrid.DataBind()
    End Sub

    Protected Sub SubmitClicked(ByVal sender As Object, ByVal e As EventArgs)
        Preview.Visible = False
        Edit.Visible = True
    End Sub

    Protected Sub CancelClicked(ByVal sender As Object, ByVal e As EventArgs)
        Preview.Visible = True
        Edit.Visible = False
    End Sub

    Private Function GetContent() As String
        Dim strCmd As [String] = "SELECT * FROM tbTemplates"

        Dim da As New OleDbDataAdapter(strCmd, m_connString)
        Dim ds As New DataSet()
        da.Fill(ds, "tbTemplates")

        Dim rows As DataRow() = ds.Tables("tbTemplates").[Select]("fldTitle='Wedding Announcement'")

        If rows.Length > 0 Then
            Return DirectCast(rows(0)("fldContent"), String)
        Else
            Return ""
        End If
    End Function

    Protected Function GetChecked(ByVal p As Boolean) As String
        If p Then
            Return " checked=true"
        Else
            Return ""
        End If
    End Function
End Class