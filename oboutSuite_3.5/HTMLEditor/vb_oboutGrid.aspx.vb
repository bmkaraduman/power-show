Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.OleDb
Imports Obout.Ajax.UI.HTMLEditor
Imports Obout.Grid

Partial Public Class HTMLEditor_vb_oboutGrid
    Inherits System.Web.UI.Page
    Public Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            CreateGrid()
        End If

        EditorID.Value = DirectCast(grid1.Templates(0).Container.FindControl("Editor"), Editor).ClientID
    End Sub

    Public Sub CreateGrid()
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As New OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, ""mm/dd/yyyy"") AS OrderDateFormatted FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
    End Sub

    Public Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@OrderID", OleDbType.[Integer]).Value = e.Record("OrderID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Public Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, AdditionalInformationHTML=@AdditionalInformationHTML WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record("AdditionalInformationHTML")
        myComm.Parameters.Add("@OrderID", OleDbType.[Integer]).Value = e.Record("OrderID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Public Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As New OleDbCommand("INSERT INTO Orders (ShipName, AdditionalInformation) VALUES(@ShipName, @AdditionalInformation)", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record("AdditionalInformationHTML")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Public Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        CreateGrid()
    End Sub
End Class