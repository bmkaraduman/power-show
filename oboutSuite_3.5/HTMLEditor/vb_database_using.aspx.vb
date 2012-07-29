Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Data.OleDb

Partial Public Class HTMLEditor_vb_database_using
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        Dim Connection As New OleDbConnection()
        Connection.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Page.Server.MapPath("../App_Data/db.mdb") & ";"
        Connection.Open()

        If Page.IsPostBack Then
            '
            '   Here one can save postbacked HTML content (editor.Content)
            '
            Dim myCommand As OleDbCommand
            Dim sqlString As String = "Update tbTest Set fldContent=? Where id=?"
            myCommand = New OleDbCommand(sqlString, Connection)

            myCommand.Parameters.Add(New OleDbParameter("@fldContent", OleDbType.VarChar))
            myCommand.Parameters("@fldContent").Value = editor.Content

            myCommand.Parameters.Add(New OleDbParameter("@id", OleDbType.[Integer]))
            myCommand.Parameters("@id").Value = 1

            myCommand.ExecuteNonQuery()
        Else
            '
            '   Here one can set initial HTML content of Editor
            '
            Dim sqlString As String = "Select fldContent from tbTest Where id=1"
            Dim eAdapter As New OleDbDataAdapter(sqlString, Connection)
            Dim eTable As New DataTable()
            Dim CommandBuilder As New OleDbCommandBuilder(eAdapter)

            eAdapter.Fill(eTable)
            editor.Content = DirectCast(eTable.Rows(0)(0), String)

            eAdapter.Dispose()
            eTable.Dispose()
        End If

        Connection.Close()
        Connection.Dispose()
    End Sub

    Protected Sub Submit_click(ByVal sender As Object, ByVal e As EventArgs)
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditorResponse", "alert('Submitted:\n\n" + editor.EditPanel.Content.Replace("""", "\""").Replace(vbLf, "\n").Replace(vbCr, "").Replace("'", "\'") & "');", True)
    End Sub
End Class