Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Text.RegularExpressions
Imports Obout.Grid

Partial Public Class FileUpload_vb_InsideOboutGrid
    Inherits System.Web.UI.Page
    Protected Sub Page_load(sender As Object, e As EventArgs)
        If Not Page.IsPostBack Then
            CreateGrid()
        Else
            ServerResponse.Value = ""
        End If

        CreateGrid()
    End Sub

    Protected Sub CreateGrid()
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As New OleDbCommand("SELECT * FROM Products ORDER BY ProductID ASC", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()


        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
    End Sub

    Protected Sub UpdateRecord(sender As Object, e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As New OleDbCommand("UPDATE Products SET ProductName = @ProductName, UnitPrice = @UnitPrice WHERE ProductID = @ProductID", myConn)

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record("ProductName")
        myComm.Parameters.Add("@UnitPrice", OleDbType.VarChar).Value = e.Record("UnitPrice")
        myComm.Parameters.Add("@ProductID", OleDbType.[Integer]).Value = e.Record("ProductID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    Protected Sub InsertRecord(sender As Object, e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As New OleDbCommand("INSERT INTO Products (ProductName, UnitPrice) VALUES(@ProductName, @UnitPrice)", myConn)

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record("ProductName")
        myComm.Parameters.Add("@UnitPrice", OleDbType.VarChar).Value = e.Record("UnitPrice")

        myComm.ExecuteNonQuery()
        myConn.Close()
        ' trick here to go to the last page of the Grid
        grid1.CurrentPageIndex = 1000000
    End Sub

    Protected Sub DeleteRecord(sender As Object, e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As New OleDbCommand("DELETE FROM Products WHERE ProductID = @ProductID", myConn)

        myComm.Parameters.Add("@ProductID", OleDbType.[Integer]).Value = e.Record("ProductID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Protected Sub RebindGrid(sender As Object, e As EventArgs)
        CreateGrid()
    End Sub
    Protected Sub getImages(sender As Object, e As EventArgs)
        For i As Integer = 0 To grid1.Templates(0).Controls.Count - 1
            Dim fileUpload As Obout.Ajax.UI.FileUpload.FileUpload = TryCast(grid1.Templates(0).Controls(i).FindControl("fuIcone"), Obout.Ajax.UI.FileUpload.FileUpload)
            If fileUpload IsNot Nothing Then
                If fileUpload.PostedFiles.Count > 0 Then
                    If fileUpload.PostedFiles(0).ContentLength > 0 Then
                        Dim imagesPath As String = "../Grid/resources/images/products/"
                        Dim photoPath As String = ""
                        Dim photoName As String = ""
                        Dim reg As New Regex("((?:[^\\]*\\)*)(\S+)", RegexOptions.Compiled)
                        photoName = DateTime.Now.Ticks.ToString() & "_" & reg.Replace(fileUpload.PostedFiles(0).FileName, "$2")
                        photoPath = imagesPath & photoName

                        fileUpload.PostedFiles(0).SaveAs(Page.MapPath(photoPath))

                        Dim ProductID As String = Page.Request("ServerResponse")

                        If ProductID IsNot Nothing Then
                            If ProductID.Length > 0 AndAlso Not String.IsNullOrEmpty(photoName) Then
                                Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
                                myConn.Open()

                                Dim myComm As New OleDbCommand("UPDATE Products SET [Image] = @Image WHERE ProductID = @ProductID", myConn)

                                myComm.Parameters.Add("@Image", OleDbType.VarChar).Value = photoName
                                myComm.Parameters.Add("@ProductID", OleDbType.[Integer]).Value = ProductID

                                myComm.ExecuteNonQuery()
                                myConn.Close()
                                CreateGrid()
                            End If
                        End If
                    End If
                End If
                Exit For
            End If
        Next
    End Sub
End Class
