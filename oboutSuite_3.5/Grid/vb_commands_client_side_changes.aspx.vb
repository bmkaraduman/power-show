Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_commands_client_side_changes
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.CallbackMode = True
        grid1.Serialize = False
        grid1.PageSize = 25
        grid1.AllowPaging = False
        grid1.AllowPageSizeSelection = False
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.AllowMultiRecordSelection = False
        grid1.AllowGrouping = True
        grid1.GroupBy = "CategoryID"
        grid1.ShowGroupsInfo = False
        grid1.ShowMultiPageGroupsInfo = False
        AddHandler grid1.DataSourceNeeded, AddressOf Grid1_DataSourceNeeded
        grid1.ClientSideEvents.ExposeSender = True
        grid1.ClientSideEvents.OnClientSelect = "Grid1_ClientSelect"

        grid1.ScrollingSettings.ScrollHeight = 250
        grid1.ScrollingSettings.EnableVirtualScrolling = True
        grid1.GroupingSettings.AllowChanges = False

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "ProductID"
        oCol1.Visible = False
        oCol1.ReadOnly = True

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CategoryID"
        oCol2.Visible = False
        oCol2.ReadOnly = True

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ProductName"
        oCol3.HeaderText = "PRODUCT NAME"
        oCol3.Width = "200"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "UnitPrice"
        oCol4.HeaderText = "PRICE"
        oCol4.Width = "200"


        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

    End Sub

    <WebMethod()> Public Shared Sub SaveProduct(ByVal data As Dictionary(Of String, String))

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;")
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Products SET ProductName = @ProductName, UnitPrice=@UnitPrice WHERE ProductID = @ProductID", myConn)

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = data("ProductName")
        myComm.Parameters.Add("@UnitPrice", OleDbType.Double).Value = data("UnitPrice")
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = data("ProductID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    <WebMethod()> Public Shared Sub DeleteProduct(ByVal data As Dictionary(Of String, String))

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;")
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("DELETE * FROM [Order Details] WHERE ProductID = @ProductID", myConn)
        Dim myComm2 As OleDbCommand = New OleDbCommand("DELETE * FROM Products WHERE ProductID = @ProductID", myConn)

        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = data("ProductID")
        myComm2.Parameters.Add("@ProductID", OleDbType.Integer).Value = data("ProductID")

        myComm.ExecuteNonQuery()
        myComm2.ExecuteNonQuery()
        myConn.Close()
    End Sub

    <WebMethod()> Public Shared Function InsertProduct(ByVal data As Dictionary(Of String, String)) As String

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;")
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Products(ProductName, UnitPrice, CategoryID) VALUES(@ProductName, @UnitPrice, @CategoryID);", myConn)

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = data("ProductName")
        myComm.Parameters.Add("@UnitPrice", OleDbType.Double).Value = data("UnitPrice")
        myComm.Parameters.Add("@CategoryID", OleDbType.Integer).Value = data("CategoryID")

        myComm.ExecuteNonQuery()

        Dim myComm2 As OleDbCommand = New OleDbCommand("SELECT @@IDENTITY", myConn)
        Dim newId As Object = myComm2.ExecuteScalar()

        myConn.Close()

        Return newId.ToString()
    End Function

    Sub Grid1_DataSourceNeeded(ByVal sender As Object, ByVal e As GridDataSourceNeededEventArgs)

        'Preparing the SQL query for populating the Grid
        Dim sortExpression As String = ""

        If (String.IsNullOrEmpty(e.SortExpression)) Then

            sortExpression = " ORDER BY ProductID DESC"

        Else

            sortExpression = " ORDER BY " + e.SortExpression
        End If

        Dim query As String = "SELECT TOP " + e.MaximumRows.ToString() + " * FROM (SELECT ProductID, CategoryID, ProductName, UnitPrice FROM Products"
        If e.StartRowIndex <> 0 Then

            query += " WHERE ProductID NOT IN (SELECT TOP " + e.StartRowIndex.ToString() + " ProductID FROM Products" + sortExpression + ")"
        End If
        query += sortExpression
        query += ")"

        ' Extracting the rows
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        Dim myComm As OleDbCommand = New OleDbCommand(query, myConn)
        myConn.Open()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        da.SelectCommand = myComm
        da.Fill(ds, "Products")

        ' Retrieving the total count of rows
        Dim myConn2 As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath("../App_Data/Northwind.mdb"))
        Dim myComm2 As OleDbCommand = New OleDbCommand("SELECT COUNT(*) FROM Products", myConn2)
        myConn2.Open()
        Dim count As Integer = CInt(myComm2.ExecuteScalar())

        myConn2.Close()

        ' Passing the total count to the "TotalRowCount" property of the GridDataSourceNeededEventArgs object
        e.TotalRowCount = count

        ' Populating the grid
        grid1.DataSource = ds.Tables(0)
        grid1.DataBind()

    End Sub

End Class
