Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports Obout.Tree_DB

' derive the page class from the OboutInc.oboutAJAXPage class
Partial Public Class vb_TreeEvents
    Inherits OboutInc.oboutAJAXPage

	Public oTreeDB As TreeDB

	' in the constructor we'll define the connectionstring, table name, and column names/types
	Public Sub New()
		oTreeDB = New TreeDB

		' declaring the connection string:
        'MS SQL Express	
        oTreeDB.ConnectionString = "Server=.\SQLEXPRESS;AttachDBFilename=|DataDirectory|TreeNodes.mdf;Database=TreeNodes;Trusted_Connection=Yes;"

		'MSSQL Server
		'oTreeDB.ConnectionString = "Driver={SQL Server};Server=localhost;UID=obout_usr;PWD=obout_pwd;Database=obout;"

		'MySql
		'oTreeDB.ConnectionString = "DRIVER={MySQL ODBC 3.51 Driver};Server=localhost;UID=root;PWD=root_pwd;Database=test"

		' declaring the table name:		
        oTreeDB.TableName = "treeview"
        oTreeDB.ProviderName = "System.Data.SqlClient"

        oTreeDB.Fields(TreeDB.StandardFields.ID).DbFieldName = "NodeID"
        oTreeDB.Fields(TreeDB.StandardFields.ParentID).DbFieldName = "ParentID"
        oTreeDB.Fields(TreeDB.StandardFields.HTMLValue).DbFieldName = "NodeHTML"
        oTreeDB.Fields(TreeDB.StandardFields.Icon).DbFieldName = "NodeIcon"
        oTreeDB.Fields(TreeDB.StandardFields.Level).SetProperties("NodeLevel", "numeric")
        oTreeDB.Fields(TreeDB.StandardFields.Expanded).SetProperties("Expanded", "numeric")
	End Sub


	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub

	' the server side method that will handle the OnAddNode event
	Public Function OnAddNode(ByVal parentId As String, ByVal childId As String, ByVal textOrHTML As String, ByVal expanded As String, ByVal image As String, ByVal subTreeURL As String) As String
		' specify the type of action that the Tree_DB component should take:
        oTreeDB.EventType = TreeDB.EventTypes.Add
		' prepare tha data for the Tree_DB object - the data should be sent using this format:

        oTreeDB.Fields(TreeDB.StandardFields.ParentID).Value = parentId
        oTreeDB.Fields(TreeDB.StandardFields.ID).Value = childId
        oTreeDB.Fields(TreeDB.StandardFields.HTMLValue).Value = textOrHTML
        oTreeDB.Fields(TreeDB.StandardFields.Icon).Value = image
        oTreeDB.Fields(TreeDB.StandardFields.Expanded).Value = expanded

        ' process the information and returning the result:
        Dim sResult As String = oTreeDB.ExecuteEvent()
        If (sResult <> "1") Then
            Throw New Exception(sResult)
        End If
        Return sResult
    End Function

    ' the server side method that will handle the OnNodeEdit event
    Public Function OnNodeEdit(ByVal id As String, ByVal text As String, ByVal prevText As String) As String
        ' specify the type of action that the Tree_DB component should take:
        oTreeDB.EventType = TreeDB.EventTypes.Edit
        ' prepare tha data for the Tree_DB object - the data should be sent using this format:
        oTreeDB.Fields(TreeDB.StandardFields.ID).Value = id
        oTreeDB.Fields(TreeDB.StandardFields.HTMLValue).Value = text
        ' process the information and returning the result:
        Dim sResult As String = oTreeDB.ExecuteEvent()
        If (sResult <> "1") Then
            Throw New Exception(sResult)
        End If
        Return sResult
    End Function

    ' the server side method that will handle the OnRemoveNode event
    Public Function OnRemoveNode(ByVal id As String) As String
        ' specify the type of action that the Tree_DB component should take:
        oTreeDB.EventType = TreeDB.EventTypes.Remove
        ' prepare tha data for the Tree_DB object - the data should be sent using this format:
        oTreeDB.Fields(TreeDB.StandardFields.ID).Value = id
        ' process the information and returning the result:
        Dim sResult As String = oTreeDB.ExecuteEvent()
        If (sResult <> "1") Then
            Throw New Exception(sResult)
        End If
        Return sResult
    End Function

	' the server side method that will handle the OnNodeDrop event
	Public Function OnNodeDrop(ByVal src As String, ByVal dst As String) As String
		' specify the type of action that the Tree_DB component should take:
        oTreeDB.EventType = TreeDB.EventTypes.UpdateLevel
		' prepare tha data for the Tree_DB object - the data should be sent using this format:
        oTreeDB.Fields(TreeDB.StandardFields.ParentID).Value = dst
        oTreeDB.Fields(TreeDB.StandardFields.ID).Value = src
		' process the information and returning the result:
        Dim sResult As String = oTreeDB.ExecuteEvent()
		If (sResult <> "1") Then
            Throw New Exception(sResult)
		End If
		Return sResult
	End Function
End Class