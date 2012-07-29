Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_state_currentpage
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.AutoGenerateColumns = False
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowFiltering = False
        grid1.AllowPageSizeSelection = False

        AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
        AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
        AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"
        oCol1.ReadOnly = True

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCountry"
        oCol4.HeaderText = "COUNTRY"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.HeaderText = "EDIT"
        oCol5.AllowEdit = True
        oCol5.AllowDelete = True
        oCol5.Width = "125"

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        phGrid1.Controls.Add(grid1)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

        If Not Page.IsPostBack Then

            If Session("CurrentPageIndex") IsNot Nothing Then

                grid1.CurrentPageIndex = Int32.Parse(Session("CurrentPageIndex").ToString())

            End If

            CreateGrid()

        End If
    End Sub
    Protected Overrides Sub OnLoadComplete(ByVal e As EventArgs)

        MyBase.OnPreRender(e)

        Session("CurrentPageIndex") = grid1.CurrentPageIndex

    End Sub
    Sub CreateGrid()

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()

        Dim myReader As OleDbDataReader = myComm.ExecuteReader()


        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
    End Sub

    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipCountry)", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)

        CreateGrid()
    End Sub
End Class

