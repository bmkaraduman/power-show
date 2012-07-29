Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Obout.Ajax.UI
Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports Obout.Grid

Partial Public Class ColorPicker_vb_InGrid
    Inherits System.Web.UI.Page
    Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            CreateGrid()
        End If
    End Sub

    Private Sub CreateGrid()
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As New OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, ""mm/dd/yyyy"") AS OrderDateFormatted, FORMAT(RequiredDate, ""mm/dd/yyyy"") AS RequiredDateFormatted, FORMAT(ShippedDate, ""mm/dd/yyyy"") AS ShippedDateFormatted FROM Orders ORDER BY OrderID DESC", myConn)
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

        Dim myComm As New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, ShipColor = @ShipColor, Sent = @Sent, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia, AdditionalInformation=@AdditionalInformation WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record("ShipAddress")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record("ShipRegion")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@ShipColor", OleDbType.VarChar).Value = e.Record("ShipColor")
        myComm.Parameters.Add("@Sent", OleDbType.[Boolean]).Value = e.Record("Sent")
        myComm.Parameters.Add("@OrderDate", OleDbType.[Date]).Value = e.Record("OrderDateFormatted")
        myComm.Parameters.Add("@RequiredDate", OleDbType.[Date]).Value = e.Record("RequiredDateFormatted")
        myComm.Parameters.Add("@ShippedDate", OleDbType.[Date]).Value = e.Record("ShippedDateFormatted")
        myComm.Parameters.Add("@ShipVia", OleDbType.[Integer]).Value = e.Record("ShipVia")
        myComm.Parameters.Add("@AdditionalInformation", OleDbType.VarChar).Value = e.Record("AdditionalInformation")
        myComm.Parameters.Add("@OrderID", OleDbType.[Integer]).Value = e.Record("OrderID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Public Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As New OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, Sent, OrderDate, RequiredDate, ShippedDate, ShipVia, AdditionalInformation, ShipColor) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, @Sent, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @AdditionalInformation, @ShipColor)", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record("ShipAddress")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record("ShipRegion")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@Sent", OleDbType.[Boolean]).Value = e.Record("Sent")
        myComm.Parameters.Add("@OrderDate", OleDbType.[Date]).Value = e.Record("OrderDateFormatted")
        myComm.Parameters.Add("@RequiredDate", OleDbType.[Date]).Value = e.Record("RequiredDateFormatted")
        myComm.Parameters.Add("@ShippedDate", OleDbType.[Date]).Value = e.Record("ShippedDateFormatted")
        myComm.Parameters.Add("@ShipVia", OleDbType.[Integer]).Value = e.Record("ShipVia")
        myComm.Parameters.Add("@AdditionalInformation", OleDbType.VarChar).Value = e.Record("AdditionalInformation")
        myComm.Parameters.Add("@ShipColor", OleDbType.VarChar).Value = e.Record("ShipColor")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    Public Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        CreateGrid()
    End Sub
End Class