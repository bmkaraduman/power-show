Imports System
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Data.OleDb
Imports Obout.Grid
Imports OboutInc.EasyMenu_Pro

' add Partial for .NET2.0
Public Class GridWithEm
    Inherits Page

    Dim grid1 As Grid = New Grid()

    'remove these 2 lines for .NET2.0
    Public ph1 As PlaceHolder
    Public EasyMenu1 As EasyMenu

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.GenerateRecordIds = True
        grid1.ClientSideEvents.OnClientCallback = "attachMenuToRecords"
		grid1.AllowMultiRecordSelection = true
		grid1.AllowAddingRecords=false

        ' setting the event handlers
        AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
        AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
        AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "150"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol5)

        ' add the grid to the controls collection of the PlaceHolder
        ph1.Controls.Add(grid1)

        If Not Page.IsPostBack Then
            BindGrid()
        End If

        'very important
        EasyMenu1.AttachTo = ""
    End Sub

    Sub BindGrid()
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()
        'Dim da = new OleDbDataAdapter()
        'Dim ds = new DataSet()
        'da.SelectCommand = myComm
        'da.Fill(ds, "Orders")
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()


        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
    End Sub

    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = " + e.Record("OrderID").ToString(), myConn)
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName='" + e.Record("ShipName").ToString().Replace("'", "''") + "', ShipCity='" + e.Record("ShipCity").ToString().Replace("'", "''") + "', ShipCountry='" + e.Record("ShipCountry").ToString().Replace("'", "''") + "' WHERE OrderID = " + e.Record("OrderID").ToString(), myConn)
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipCountry) VALUES('" + e.Record("ShipName").ToString().Replace("'", "''") + "', '" + e.Record("ShipCity").ToString().Replace("'", "''") + "', '" + e.Record("ShipCountry").ToString().Replace("'", "''") + "')", myConn)
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        BindGrid()
    End Sub

End Class
