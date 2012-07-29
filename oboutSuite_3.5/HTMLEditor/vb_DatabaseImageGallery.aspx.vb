Imports System.IO
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports Obout.Ajax.UI.HTMLEditor
Imports Obout.Ajax.UI.HTMLEditor.Popups
Imports Obout.Ajax.UI.HTMLEditor.ToolbarButton
Imports Obout.Ajax.UI.HTMLEditor.ContextMenu
Imports System.Collections.ObjectModel
Imports System.Data
Imports System.Data.OleDb
Imports System.Text.RegularExpressions

Partial Public Class HTMLEditor_vb_DatabaseImageGallery
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        ' Find 'Insert image' button in the top toolbar and change the associated popup
        Dim buttons As Collection(Of CommonButton) = editor.TopToolbar.GetButtonsByType(GetType(InsertImage))
        If buttons.Count > 0 Then
            Dim button As InsertImage = TryCast(buttons(0), InsertImage)
            button.RelatedPopupType = GetType(ImagePropertiesWithDatabaseBrowse).AssemblyQualifiedName
        End If

        ' Find 'Edit image' item in the context menu and change the associated popup
        buttons = editor.EditPanel.ContextMenu.GetButtonsByType(GetType(EditImageItem))
        If buttons.Count > 0 Then
            Dim item As EditImageItem = TryCast(buttons(0), EditImageItem)
            item.RelatedPopupType = GetType(ImagePropertiesWithDatabaseBrowse).AssemblyQualifiedName
        End If

        If Not Page.IsPostBack Then
            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII)
            editor.EditPanel.Content = input.ReadToEnd()
            input.Close()
        End If
    End Sub

    ' override OnInit to draw the Image
    Protected Overrides Sub OnInit(ByVal e As EventArgs)
        Dim imageID As String = Context.Request.QueryString(MyImageBrowser.ViewParameterName)
        If Not [String].IsNullOrEmpty(imageID) Then
            ' it is the 'file system' gallery image 
            Page.Response.ContentType = "image/gif"
            Page.Response.BinaryWrite((New MyImageBrowser()).GetImageBytes(Integer.Parse(imageID)))
            Page.Response.[End]()
        Else
            MyBase.OnInit(e)
        End If
    End Sub
End Class

#Region "[ Customized 'Image properties' popup class ]"

' Declare the customized 'Image properties' popup class
Public Class ImagePropertiesWithDatabaseBrowse
    Inherits Obout.Ajax.UI.HTMLEditor.Popups.ImageProperties
#Region "[ Fields ]"

    Private _Button As BrowseButton = Nothing

#End Region

#Region "[ Properties ]"

    ' redefine the 'Browse' button of the popup
    Protected Overrides ReadOnly Property Browse() As BrowseButton
        Get
            If _Button Is Nothing Then
                _Button = New MyImageBrowseButton(Me)
                _Button.Style(HtmlTextWriterStyle.Width) = "70px"
            End If
            Return _Button
        End Get
    End Property

#End Region
End Class

#End Region

#Region "[ Custom 'BrowseButton' class ]"

Public Class MyImageBrowseButton
    Inherits BrowseButton
#Region "[ Fields ]"

    Private _relatedPopup As Popup = Nothing

#End Region

#Region "[ Constructors ]"

    ''' <summary>
    ''' Initializes a new button
    ''' </summary>
    Public Sub New(ByVal ownerPopup As Popup)
        MyBase.New(ownerPopup)
    End Sub

#End Region

#Region "[ Properties ]"

    Public NotOverridable Overrides ReadOnly Property RelatedPopup() As Popup
        Get
            If _relatedPopup Is Nothing Then
                _relatedPopup = New MyImageBrowser()
            End If
            Return _relatedPopup
        End Get
    End Property

#End Region
End Class

#End Region

#Region "[ Custom 'ImageBrowser' class ]"

Public Class MyImageBrowser
    Inherits ImageBrowser
    ' Virtual path of the database
    Protected Overridable ReadOnly Property DbPath() As String
        Get
            Return "~/App_Data/FilesRepository.mdb"
        End Get
    End Property

    ' Connection string
    Protected Overridable ReadOnly Property ConnectionString() As String
        Get
            Return "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & System.Web.HttpContext.Current.Server.MapPath(ResolveUrl(DbPath)) & ";"
        End Get
    End Property

    ' Path to the image viewer
    Protected Overridable ReadOnly Property ViewerPath() As String
        Get
            Return System.Web.HttpContext.Current.Request.Path
        End Get
    End Property

    ' Name of 'id' parameter for the Viewer
    Public Shared ReadOnly Property ViewParameterName() As String
        Get
            Return "databaseimageid"
        End Get
    End Property

    ' Name of database 'protocol'
    Protected Overridable ReadOnly Property DatabaseProtocol() As String
        Get
            Return "database:"
        End Get
    End Property

    ' override the property: get the structure of the tree for the Browser popup
    Protected Overrides ReadOnly Property XmlTextReaderObject() As System.Xml.XmlTextReader()
        Get
            Dim xmlData As String = "<root>" & vbLf

            Dim connection As New OleDbConnection()
            Try
                connection.ConnectionString = ConnectionString
                connection.Open()
                xmlData += DbFolderDive(connection, 0, DatabaseProtocol & "/", "DataBase Image Gallery", True)
            Finally
                connection.Close()
                connection.Dispose()
            End Try

            xmlData += "</root>"

            ' we use the base 'file system' image gallery also here
            Return New System.Xml.XmlTextReader() {MyBase.XmlTextReaderObject(0), New System.Xml.XmlTextReader(New StringReader(xmlData))}
        End Get
    End Property

    ' Parse the database's virtual folder
    Protected Overridable Function DbFolderDive(ByVal connection As OleDbConnection, ByVal id As Integer, ByVal folderUrl As String, ByVal folderName As String, ByVal expanded As Boolean) As String
        ' section leaf
        Dim result As String = "<section text=""" & folderName & """ expanded=""" & expanded.ToString().ToLower() & """"
        result += " url=""" & folderUrl & """"
        result += " >" & vbLf
        Dim temp As String = ""

        ' inspect for child folders
        Dim sqlString As String = "Select * from tbFolder Where fldFolderId=" & id.ToString()
        Dim eAdapter As New OleDbDataAdapter(sqlString, connection)
        Dim eTable As New DataTable()

        eAdapter.Fill(eTable)
        For i As Integer = 0 To eTable.Rows.Count - 1
            Dim row As DataRow = eTable.Rows(i)
            Dim childFolderName As String = DirectCast(row("fldName"), String)
            Dim childFolderID As Integer = CInt(row("id"))
            temp += DbFolderDive(connection, childFolderID, folderUrl & childFolderName & "/", childFolderName, False)
        Next
        eAdapter.Dispose()
        eTable.Dispose()

        ' inspect for child images
        sqlString = "Select * from tbImage Where fldFolderId=" & id.ToString()
        eAdapter = New OleDbDataAdapter(sqlString, connection)
        eTable = New DataTable()

        eAdapter.Fill(eTable)
        For i As Integer = 0 To eTable.Rows.Count - 1
            Dim row As DataRow = eTable.Rows(i)
            Dim name As String = DirectCast(row("fldName"), String)
            Dim description As String = DirectCast(row("fldDescription"), String)
            Dim content As Byte() = DirectCast(row("fldContent"), Byte())
            Dim imageID As Integer = CInt(row("id"))

            ' get the width and height of the image
            Dim width As String = ""
            Dim height As String = ""
            Dim objStream As New MemoryStream(content)
            objStream.Position = 0
            Try
                Dim objImage As System.Drawing.Image = System.Drawing.Image.FromStream(objStream)
                width = objImage.Width.ToString()
                height = objImage.Height.ToString()
                objImage.Dispose()
            Catch
            End Try
            objStream.Close()

            ' item node
            temp += "<item text=""" & name & """ virtualpath=""" & folderUrl & name & """ title=""" & description & """ url=""" & (ViewerPath & "?" & ViewParameterName & "=" & imageID) & """"
            temp += " height=""" & height & """ width=""" & width & """"
            temp += " />" & vbLf
        Next
        eAdapter.Dispose()
        eTable.Dispose()

        If temp.Length = 0 Then
            temp += "<item text="""" title="""" height="""" width="""" url="""" />" & vbLf
        End If
        result += temp
        result += "</section>" & vbLf
        Return result
    End Function

    ' OleDbCommand for SELECT @@IDENTITY statement
    Private cmdGetIdentity As OleDbCommand

    ' override the 'Create new folder' method
    Protected Overrides Sub ExecAddFolderCommand(ByVal sourceUrl As String, ByVal name As String)
        Dim regex As New Regex("^" & DatabaseProtocol, RegexOptions.Compiled)
        If Not regex.IsMatch(sourceUrl) Then
            ' it is the 'file system' gallery command 
            ' call the base method
            MyBase.ExecAddFolderCommand(sourceUrl, name)
            Return
        End If
        Dim url As String = regex.Replace(sourceUrl, "")

        Dim temp As String = url
        If temp.Substring(temp.Length - 1, 1) = "/" Then
            temp = temp.Substring(0, temp.Length - 1)
        End If
        If temp.Substring(0, 1) = "/" Then
            temp = temp.Substring(1, temp.Length - 1)
        End If
        Dim folders As String() = temp.Split(New Char() {"/"c})
        Dim parentId As Integer = 0

        Dim connection As New OleDbConnection()
        Try
            connection.ConnectionString = ConnectionString
            connection.Open()
            For i As Integer = 0 To folders.Length - 1
                Dim folderName As String = folders(i)
                ' inspect for child folders
                Dim sqlString As String = "Select * from tbFolder Where fldFolderId=" & parentId.ToString()
                Dim eAdapter As New OleDbDataAdapter(sqlString, connection)

                Dim eTable As New DataTable()

                eAdapter.Fill(eTable)
                Dim found As Boolean = False
                ' search for the folder
                For j As Integer = 0 To eTable.Rows.Count - 1
                    Dim row As DataRow = eTable.Rows(j)
                    Dim childFolderName As String = DirectCast(row("fldName"), String)
                    If childFolderName = folderName Then
                        parentId = CInt(row("id"))
                        found = True
                        Exit For
                    End If
                Next

                ' not found - create it
                If Not found Then
                    Dim cmdInsert As New OleDbCommand("INSERT INTO tbFolder (fldName, fldFolderId) VALUES(?, ?)", connection)

                    cmdInsert.Parameters.Add(New OleDbParameter("fldName", OleDbType.VarChar, 100, "fldName"))
                    cmdInsert.Parameters.Add(New OleDbParameter("fldFolderId", OleDbType.[Integer], 0, "fldFolderId"))
                    eAdapter.InsertCommand = cmdInsert

                    ' Create a command to get IDENTITY Value
                    cmdGetIdentity = New OleDbCommand("SELECT @@IDENTITY", connection)

                    AddHandler eAdapter.RowUpdated, New OleDbRowUpdatedEventHandler(AddressOf HandleRowUpdated)

                    Dim newRow As DataRow = eTable.NewRow()
                    newRow("fldName") = folderName
                    newRow("fldFolderId") = parentId
                    eTable.Rows.Add(newRow)
                    eAdapter.Update(eTable)

                    parentId = CInt(newRow("id"))

                    ' Release the Resources
                    cmdGetIdentity = Nothing
                    cmdInsert = Nothing
                End If

                eAdapter.Dispose()
                eTable.Dispose()
            Next
        Finally
            connection.Close()
            connection.Dispose()
        End Try
    End Sub

    ' Event Handler for RowUpdated Event
    Private Sub HandleRowUpdated(ByVal sender As Object, ByVal e As OleDbRowUpdatedEventArgs)
        If e.Status = UpdateStatus.[Continue] AndAlso e.StatementType = StatementType.Insert Then
            ' Get the Identity column value
            e.Row("id") = Int32.Parse(cmdGetIdentity.ExecuteScalar().ToString())
            e.Row.AcceptChanges()
        End If
    End Sub

    ' override the 'Delete file/folder' method
    Protected Overrides Sub ExecDeleteCommand(ByVal sourceUrl As String, ByVal name As String)
        Dim regex1 As New Regex("^" & DatabaseProtocol, RegexOptions.Compiled)
        Dim regex2 As New Regex(ViewParameterName & "=", RegexOptions.Compiled)
        If Not regex1.IsMatch(sourceUrl) AndAlso Not regex2.IsMatch(sourceUrl) Then
            ' it is the 'file system' gallery command 
            ' call the base method
            MyBase.ExecDeleteCommand(sourceUrl, name)
            Return
        End If
        Dim url As String = sourceUrl
        If regex1.IsMatch(sourceUrl) Then
            url = regex1.Replace(sourceUrl, "")
        End If

        Dim isFolder As Boolean = Not regex2.IsMatch(url)

        If isFolder Then
            ' folder deleting
            Dim connection As New OleDbConnection()
            Try
                connection.ConnectionString = ConnectionString
                connection.Open()
                Dim folderId As Integer = findFolderId(connection, url)
                If folderId > 0 Then
                    Dim myComm As New OleDbCommand("DELETE FROM tbFolder WHERE id = @FolderID", connection)
                    myComm.Parameters.Add("@FolderID", OleDbType.[Integer]).Value = folderId
                    myComm.ExecuteNonQuery()
                End If
            Finally
                connection.Close()
                connection.Dispose()
            End Try
        Else
            ' image deleting
            Dim regex As New Regex("(.+\?" & ViewParameterName & "=)(\d+)", RegexOptions.Compiled)
            Dim idStr As String = regex.Replace(url, "$2")

            Dim connection As New OleDbConnection()
            Try
                connection.ConnectionString = ConnectionString
                connection.Open()
                Dim myComm As New OleDbCommand("DELETE FROM tbImage Where id=" & idStr, connection)
                myComm.ExecuteNonQuery()
            Finally
                connection.Close()
                connection.Dispose()
            End Try
        End If
    End Sub

    ' override the 'Save uploaded file' method
    Protected Overrides Function SaveUploadedFile(ByVal folder As String, ByVal name As String, ByVal title As String, ByVal stream As Stream) As String
        Dim regex As New Regex("^" & DatabaseProtocol, RegexOptions.Compiled)
        If Not regex.IsMatch(folder) Then
            ' it is the 'file system' gallery command 
            ' call the base method
            Return MyBase.SaveUploadedFile(folder, name, title, stream)
        End If
        Dim url As String = regex.Replace(folder, "")

        Dim connection As New OleDbConnection()
        Try
            connection.ConnectionString = ConnectionString
            connection.Open()
            Dim folderId As Integer = findFolderId(connection, url)
            If folderId >= 0 Then
                Dim sqlString As String = "Select * from tbImage Where fldFolderId=" & folderId.ToString() & " AND fldName=""" & name & """"
                Dim eAdapter As New OleDbDataAdapter(sqlString, connection)
                Dim eTable As New DataTable()
                eAdapter.Fill(eTable)

                ' Delete the duplicate if it is present
                If eTable.Rows.Count > 0 Then
                    Dim myComm As New OleDbCommand("DELETE FROM tbImage Where fldFolderId=" & folderId.ToString() & " AND fldName=""" & name & """", connection)
                    myComm.ExecuteNonQuery()
                End If

                eAdapter.Dispose()
                eTable.Dispose()

                sqlString = "Select * from tbImage Where fldFolderId=" & folderId.ToString()
                eAdapter = New OleDbDataAdapter(sqlString, connection)
                eTable = New DataTable()
                eAdapter.Fill(eTable)

                Dim cmdInsert As New OleDbCommand("INSERT INTO tbImage (fldName, fldFolderId, fldDescription, fldContent) VALUES(?, ?, ?, ?)", connection)
                cmdInsert.Parameters.Add(New OleDbParameter("fldName", OleDbType.VarChar, 50, "fldName"))
                cmdInsert.Parameters.Add(New OleDbParameter("fldFolderId", OleDbType.[Integer], 0, "fldFolderId"))
                cmdInsert.Parameters.Add(New OleDbParameter("fldDescription", OleDbType.VarChar, 100, "fldDescription"))
                cmdInsert.Parameters.Add(New OleDbParameter("fldContent", OleDbType.Binary, 0, "fldContent"))
                eAdapter.InsertCommand = cmdInsert

                Dim newRow As DataRow = eTable.NewRow()
                newRow("fldName") = name
                newRow("fldFolderId") = folderId
                newRow("fldDescription") = title
                Dim content As Byte() = New Byte(stream.Length - 1) {}
                stream.Read(content, 0, CInt(stream.Length))

                newRow("fldContent") = content

                eTable.Rows.Add(newRow)
                eAdapter.Update(eTable)

                ' Release the Resources
                cmdInsert = Nothing
                eAdapter.Dispose()
                eTable.Dispose()
            End If
        Finally
            connection.Close()
            connection.Dispose()
        End Try
        Return name
    End Function

    Public Overloads Function GetImageBytes(ByVal id As Integer) As Byte()
        Dim content As Byte() = Nothing
        Dim connection As New OleDbConnection()
        Try
            connection.ConnectionString = ConnectionString
            connection.Open()
            Dim sqlString As String = "Select * from tbImage Where id=" & id.ToString()
            Dim eAdapter As New OleDbDataAdapter(sqlString, connection)
            Dim eTable As New DataTable()
            eAdapter.Fill(eTable)

            If eTable.Rows.Count > 0 Then
                content = DirectCast(eTable.Rows(0)("fldContent"), Byte())
            End If

            eAdapter.Dispose()
            eTable.Dispose()
        Finally
            connection.Close()
            connection.Dispose()
        End Try
        Return content
    End Function

    ' override the function that gets Image's binary content
    Public Overrides Function GetImageBytes(ByVal url As String) As Byte()
        Dim regex As New Regex(ViewParameterName & "=", RegexOptions.Compiled)
        If Not regex.IsMatch(url) Then
            ' it is the 'file system' gallery image 
            Return MyBase.GetImageBytes(url)
        End If

        regex = New Regex("(.+\?" & ViewParameterName & "=)(\d+)", RegexOptions.Compiled)
        Dim idStr As String = regex.Replace(url, "$2")
        Return GetImageBytes(Integer.Parse(idStr))
    End Function

    ' override the function that gets the typeof Image
    Public Overrides Function GetImageType(ByVal url As String) As String
        Dim regex As New Regex(ViewParameterName & "=", RegexOptions.Compiled)
        If Not regex.IsMatch(url) Then
            ' it is the 'file system' gallery image 
            Return MyBase.GetImageType(url)
        End If
        regex = New Regex("(.+\?" & ViewParameterName & "=)(\d+)", RegexOptions.Compiled)
        Dim idStr As String = regex.Replace(url, "$2")
        Dim extension As String = ""

        Dim connection As New OleDbConnection()
        Try
            connection.ConnectionString = ConnectionString
            connection.Open()
            Dim sqlString As String = "Select * from tbImage Where id=" & idStr
            Dim eAdapter As New OleDbDataAdapter(sqlString, connection)
            Dim eTable As New DataTable()
            eAdapter.Fill(eTable)

            If eTable.Rows.Count > 0 Then
                extension = Path.GetExtension(DirectCast(eTable.Rows(0)("fldName"), String)).ToLower().Replace(".", "")
            End If

            eAdapter.Dispose()
            eTable.Dispose()
        Finally
            connection.Close()
            connection.Dispose()
        End Try
        Return extension
    End Function

    ' override the function that gets the Image's description
    Public Overrides Function GetImageDescription(ByVal url As String) As String
        Dim regex As New Regex(ViewParameterName & "=", RegexOptions.Compiled)
        If Not regex.IsMatch(url) Then
            ' it is the 'file system' gallery image 
            Return MyBase.GetImageDescription(url)
        End If
        regex = New Regex("(.+\?" & ViewParameterName & "=)(\d+)", RegexOptions.Compiled)
        Dim idStr As String = regex.Replace(url, "$2")
        Dim description As String = ""

        Dim connection As New OleDbConnection()
        Try
            connection.ConnectionString = ConnectionString
            connection.Open()
            Dim sqlString As String = "Select * from tbImage Where id=" & idStr
            Dim eAdapter As New OleDbDataAdapter(sqlString, connection)
            Dim eTable As New DataTable()
            eAdapter.Fill(eTable)

            If eTable.Rows.Count > 0 Then
                description = DirectCast(eTable.Rows(0)("fldDescription"), String)
            End If

            eAdapter.Dispose()
            eTable.Dispose()
        Finally
            connection.Close()
            connection.Dispose()
        End Try
        Return description
    End Function

    ' find the ID of the folder by its url
    Private Function findFolderId(ByVal connection As OleDbConnection, ByVal url As String) As Integer
        Dim temp As String = url
        If temp.Length > 0 Then
            If temp.Substring(temp.Length - 1, 1) = "/" Then
                temp = temp.Substring(0, temp.Length - 1)
            End If
        End If
        If temp.Length > 0 Then
            If temp.Substring(0, 1) = "/" Then
                temp = temp.Substring(1, temp.Length - 1)
            End If
        End If
        Dim folders As String() = temp.Split(New Char() {"/"c})
        Dim folderId As Integer = 0

        For i As Integer = 0 To folders.Length - 1
            Dim folderName As String = folders(i)
            If folderName.Length = 0 Then
                Continue For
            End If
            ' inspect for child folders
            Dim sqlString As String = "Select * from tbFolder Where fldFolderId=" & folderId.ToString()
            Dim eAdapter As New OleDbDataAdapter(sqlString, connection)

            Dim eTable As New DataTable()

            eAdapter.Fill(eTable)
            Dim found As Boolean = False
            ' search for the folder
            For j As Integer = 0 To eTable.Rows.Count - 1
                Dim row As DataRow = eTable.Rows(j)
                Dim childFolderName As String = DirectCast(row("fldName"), String)
                If childFolderName = folderName Then
                    folderId = CInt(row("id"))
                    found = True
                    Exit For
                End If
            Next

            If Not found Then
                folderId = -1
                Exit For
            End If

            eAdapter.Dispose()
            eTable.Dispose()
        Next

        Return folderId
    End Function
End Class

#End Region