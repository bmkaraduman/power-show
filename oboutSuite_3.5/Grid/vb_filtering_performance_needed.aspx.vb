Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_filtering_performance_needed
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        AddHandler grid1.DataSourceNeeded, AddressOf Grid1_DataSourceNeeded
        grid1.AutoGenerateColumns = False
        grid1.Serialize = False
        grid1.AllowAddingRecords = False
        grid1.AllowFiltering = True
        grid1.AllowGrouping = True

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "SHIP CITY"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipAddress"
        oCol4.HeaderText = "SHIP ADDRESS"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipPostalCode"
        oCol5.HeaderText = "POSTAL CODE"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipCountry"
        oCol6.HeaderText = "SHIP COUNTRY"

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)

        phGrid1.Controls.Add(grid1)

    End Sub
    Sub Grid1_DataSourceNeeded(ByVal sender As Object, ByVal e As GridDataSourceNeededEventArgs)

        'Preparing the SQL query for populating the Grid
        Dim sortExpression As String = ""
        Dim filterExpression As String = ""

        If String.IsNullOrEmpty(e.SortExpression) Then

            sortExpression = " ORDER BY OrderID DESC"

        Else

            sortExpression = " ORDER BY " + e.SortExpression
        End If


        If Not String.IsNullOrEmpty(e.FilterExpression) Then
            filterExpression = e.FilterExpression
        End If

        Dim query As String = "SELECT TOP " + e.MaximumRows.ToString() + " * FROM (SELECT OrderID, ShipName, ShipCity, ShipAddress, ShipPostalCode, ShipCountry FROM Orders"
        If e.StartRowIndex <> 0 Then

            query += " WHERE OrderID NOT IN (SELECT TOP " + e.StartRowIndex.ToString() + " OrderID FROM Orders"
            query += (IIf(String.IsNullOrEmpty(filterExpression), "", " WHERE " & filterExpression)) & sortExpression & ")"
            If Not String.IsNullOrEmpty(filterExpression) Then

                query += " AND " + filterExpression
            End If

        Else

            If Not String.IsNullOrEmpty(filterExpression) Then

                query += " WHERE " + filterExpression
            End If
        End If

        query += sortExpression + ")"

        ' Extracting the rows
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        Dim myComm As OleDbCommand = New OleDbCommand(query, myConn)
        myConn.Open()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        da.SelectCommand = myComm
        da.Fill(ds, "Orders")


        Dim countQuery As String = "SELECT COUNT(*) FROM Orders"
        If Not String.IsNullOrEmpty(filterExpression) Then

            countQuery += " WHERE " + filterExpression
        End If

        ' Retrieving the total count of rows
        Dim myConn2 As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath("../App_Data/Northwind.mdb"))
        Dim myComm2 As OleDbCommand = New OleDbCommand(countQuery, myConn2)
        myConn2.Open()
        Dim count As Integer = CType(myComm2.ExecuteScalar(), Integer)

        myConn2.Close()

        ' Passing the total count to the "TotalRowCount" property of the GridDataSourceNeededEventArgs object
        e.TotalRowCount = count

        ' Populating the grid
        grid1.DataSource = ds.Tables(0)
        grid1.DataBind()

    End Sub
End Class
