Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_data_sources_button
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()


    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.HeaderText = "ORDER ID"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "SHIP CITY"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Visible = False

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "SHIP COUNTRY"

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)


        phGrid1.Controls.Add(grid1)

    End Sub
    Sub Populate_Grid(ByVal sender As Object, ByVal e As EventArgs)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Orders WHERE CustomerID=@CustomerID ORDER BY OrderID DESC", myConn)
        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = CustomerId.SelectedValue

        myComm.ExecuteNonQuery()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        da.SelectCommand = myComm
        da.Fill(ds, "Orders")
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        grid1.ClearPreviousDataSource()
        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()

    End Sub
End Class
