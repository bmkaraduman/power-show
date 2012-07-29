Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_master_detail_self_reference
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.AllowColumnReordering = True
        grid1.AllowAddingRecords = True
        grid1.Serialize = False
        AddHandler grid1.DataSourceNeeded, AddressOf Grid1_DataSourceNeeded
        grid1.Width = 800
        grid1.AllowPaging = False
        grid1.PageSize = -1
        grid1.AllowPageSizeSelection = False
        AddHandler grid1.InsertCommand, AddressOf Grid1_InsertCommand
        AddHandler grid1.UpdateCommand, AddressOf Grid1_UpdateCommand
        AddHandler grid1.DeleteCommand, AddressOf Grid1_DeleteCommand

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CategoryID"
        oCol1.Visible = False
        oCol1.Width = "0%"

        Dim oCol2 As New Column()
        oCol2.DataField = "ParentID"
        oCol2.Visible = False
        oCol2.Width = "0%"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "CategoryText"
        oCol3.HeaderText = "CATEGORY"
        oCol3.Width = "25%"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Description"
        oCol4.HeaderText = "DESCRIPTION"
        oCol4.Width = "25%"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "DateAdded"
        oCol5.HeaderText = "DATE ADDED"
        oCol5.DataFormatString = "{0:MM/dd/yyyy}"
        oCol5.ApplyFormatInEditMode = True
        oCol5.Width = "15%"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "PriceRange"
        oCol6.HeaderText = "PRICE RANGE"
        oCol6.Width = "15%"

        Dim oCol7 As Column = New Column()
        oCol7.AllowEdit = True
        oCol7.AllowDelete = True
        oCol7.Width = "20%"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        grid1.MasterDetailSettings.ShowEmptyDetails = True

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

    End Sub
    Protected level As Integer = 0

    Sub Grid1_DataSourceNeeded(ByVal sender As Object, ByVal e As GridDataSourceNeededEventArgs)

        level += 1

        e.HandledFiltering = False
        e.HandledPaging = False
        e.HandledSorting = False

        Dim grid As Grid = CType(sender, Grid)

        AddDetailGrid(grid)

        If Not (TypeOf grid Is DetailGrid) Then
            PopulateGrid(grid, "")

        Else
            PopulateGrid(grid, e.ForeignKeysValues("CategoryID"))
        End If

    End Sub

    Sub AddDetailGrid(ByVal grid As Grid)

        Dim detail As DetailGrid = New DetailGrid()
        detail.ID = "grid" + level.ToString()
        detail.AutoGenerateColumns = False
        detail.Serialize = False
        detail.AllowPageSizeSelection = False
        detail.AllowPaging = False
        detail.PageSize = -1
        detail.AllowAddingRecords = True
        detail.Width = Unit.Percentage(97)

        detail.ForeignKeys = "CategoryID"

        detail.ClientSideEvents.ExposeSender = True
        detail.ClientSideEvents.OnClientPopulateControls = "onPopulateControls"
        detail.ClientSideEvents.OnBeforeClientDelete = "onBeforeClientDelete"

        For Each column As Column In grid.Columns
            Dim newColumn As Column = CType(column.Clone(), Column)
            newColumn.SortOrder = SortOrderType.None
            detail.Columns.Add(newColumn)
        Next


        detail.MasterDetailSettings = grid.MasterDetailSettings

        AddHandler detail.DataSourceNeeded, AddressOf Grid1_DataSourceNeeded
        AddHandler detail.InsertCommand, AddressOf Grid1_InsertCommand
        AddHandler detail.UpdateCommand, AddressOf Grid1_UpdateCommand
        AddHandler detail.DeleteCommand, AddressOf Grid1_DeleteCommand

        grid.DetailGrids.Add(detail)

    End Sub

    Sub PopulateGrid(ByVal grid As Grid, ByVal parentId As String)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/categories.mdb"))

        Dim myComm As New OleDbCommand("SELECT CategoryID, ParentID, CategoryText, Description, DateAdded, PriceRange FROM Categories WHERE ParentID" & (IIf(parentId = "", " = 0", "=" & parentId)) & " ORDER BY CategoryText", myConn)
        myConn.Open()

        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        da.SelectCommand = myComm
        da.Fill(ds, "Categories")

        grid.DataSource = ds.Tables(0).DefaultView
        grid.DataBind()

        myConn.Close()

    End Sub

    Sub Grid1_InsertCommand(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/categories.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Categories(ParentID, CategoryText, Description, DateAdded, PriceRange) VALUES(@ParentID, @CategoryText, @Description, @DateAdded, @PriceRange)", myConn)
        myComm.Parameters.Add("@ParentID", OleDbType.Integer).Value = e.Record("ParentID")
        myComm.Parameters.Add("@CategoryText", OleDbType.VarChar).Value = e.Record("CategoryText")
        myComm.Parameters.Add("@Description", OleDbType.VarChar).Value = e.Record("Description")
        myComm.Parameters.Add("@DateAdded", OleDbType.Date).Value = e.Record("DateAdded")
        myComm.Parameters.Add("@PriceRange", OleDbType.VarChar).Value = e.Record("PriceRange")

        myConn.Open()

        myComm.ExecuteNonQuery()

        myConn.Close()

    End Sub

    Sub Grid1_UpdateCommand(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/categories.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Categories SET CategoryText=@CategoryText, Description=@Description, DateAdded=@DateAdded, PriceRange=@PriceRange WHERE CategoryID=@CategoryID", myConn)
        myComm.Parameters.Add("@CategoryText", OleDbType.VarChar).Value = e.Record("CategoryText")
        myComm.Parameters.Add("@Description", OleDbType.VarChar).Value = e.Record("Description")
        myComm.Parameters.Add("@DateAdded", OleDbType.Date).Value = e.Record("DateAdded")
        myComm.Parameters.Add("@PriceRange", OleDbType.VarChar).Value = e.Record("PriceRange")
        myComm.Parameters.Add("@CategoryID", OleDbType.Integer).Value = e.Record("CategoryID")

        myConn.Open()

        myComm.ExecuteNonQuery()

        myConn.Close()

    End Sub

    Sub Grid1_DeleteCommand(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/categories.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Categories WHERE CategoryID = @CategoryID", myConn)
        myComm.Parameters.Add("@CategoryID", OleDbType.Integer).Value = e.Record("CategoryID")

        myConn.Open()

        myComm.ExecuteNonQuery()

        myConn.Close()

    End Sub

End Class
