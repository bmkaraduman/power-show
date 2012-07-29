Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_rows_reorder
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = False
        grid1.ShowLoadingMessage = False
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        AddHandler grid1.UpdateCommand, AddressOf Grid1_UpdateCommand
        grid1.AllowMultiRecordSelection = False
        grid1.AllowSorting = False

        '------------------------------------------------------------------------
        Dim Template1 As Obout.Grid.GridRuntimeTemplate
        Template1 = New GridRuntimeTemplate()
        Template1.ID = "Template1"
        Template1.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(Template1.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTemplate1
        '------------------------------------------------------------------------

        grid1.Templates.Add(Template1)

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "RowPosition"
        oCol2.Visible = False

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipName"
        oCol3.HeaderText = "SHIP NAME"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCity"
        oCol4.HeaderText = "SHIP CITY"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipPostalCode"
        oCol5.HeaderText = "POSTAL CODE"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipCountry"
        oCol6.HeaderText = "SHIP COUNTRY"

        Dim oCol7 As Column = New Column()
        oCol7.Width = "90"
        oCol7.TemplateSettings.TemplateId = "Template1"

        'add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub

    Sub CreateTemplate1(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim ph1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(ph1)
        AddHandler CType(ph1, PlaceHolder).DataBinding, AddressOf DataBindTemplate1
    End Sub

    Sub DataBindTemplate1(ByVal sender As Object, ByVal e As EventArgs)

        Dim ph1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(ph1.NamingContainer, Obout.Grid.TemplateContainer)

        Dim oLiteral1 As Literal = New Literal()
        oLiteral1.Text = "<a href=""javascript: //"" onclick=""moveUp(" + oContainer.PageRecordIndex.ToString() + "," + oContainer.RecordIndex.ToString() + ")""><img src=""styles/black_glass/asc.gif"" alt=""Move up"" border=""0"" /></a>"

        Dim oLiteral2 As Literal = New Literal()
        oLiteral2.Text = "<a href=""javascript: //"" onclick=""moveDown(" + oContainer.PageRecordIndex.ToString() + "," + oContainer.RecordIndex.ToString() + ")""><img src=""styles/black_glass/desc.gif"" alt=""Move down"" border=""0"" /></a>"

        ph1.Controls.Add(oLiteral1)
        ph1.Controls.Add(oLiteral2)

    End Sub

    Sub Grid1_UpdateCommand(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        Dim rowPosition As String() = e.Record("RowPosition").ToString().Split("_"c)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"))
        myConn.Open()

        Dim selectQuery As String = ""
        If rowPosition(1) = "-1" Then

            selectQuery = "SELECT TOP 1 OrderID, RowPosition FROM Orders_2 WHERE RowPosition <= @RowPosition AND OrderID <> @OrderID ORDER BY RowPosition DESC"

        Else

            selectQuery = "SELECT TOP 1 OrderID, RowPosition FROM Orders_2 WHERE RowPosition >= @RowPosition AND OrderID <> @OrderID ORDER BY RowPosition ASC"
        End If

        Dim myComm As OleDbCommand = New OleDbCommand(selectQuery, myConn)
        myComm.Parameters.Add("@RowPosition", OleDbType.Integer).Value = rowPosition(0)
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")

        Dim reader As OleDbDataReader = myComm.ExecuteReader()

        If reader.Read() Then

            Dim toggeledOrderId As Integer = reader.GetInt32(0)
            Dim toggeledRowPosition As Integer = reader.GetInt32(1)

            Dim orderId As Integer = Integer.Parse(e.Record("OrderID").ToString())
            Dim oldRowPosition As Integer = Integer.Parse(rowPosition(0))

            Dim myComm2 As OleDbCommand = New OleDbCommand("UPDATE Orders_2 SET RowPosition=@RowPosition WHERE OrderID = @OrderID", myConn)
            myComm2.Parameters.Add("@RowPosition", OleDbType.Integer).Value = toggeledRowPosition
            myComm2.Parameters.Add("@OrderID", OleDbType.Integer).Value = orderId
            myComm2.ExecuteNonQuery()

            Dim myComm3 As OleDbCommand = New OleDbCommand("UPDATE Orders_2 SET RowPosition=@RowPosition WHERE OrderID = @OrderID", myConn)
            myComm3.Parameters.Add("@RowPosition", OleDbType.Integer).Value = oldRowPosition
            myComm3.Parameters.Add("@OrderID", OleDbType.Integer).Value = toggeledOrderId
            myComm3.ExecuteNonQuery()

            Dim Record As Hashtable = New Hashtable()
            Record.Add("OrderID", orderId)
            Record.Add("RowPosition", toggeledRowPosition)
            Record.Add("ShipName", e.Record("ShipName").ToString())
            Record.Add("ShipCity", e.Record("ShipCity").ToString())
            Record.Add("ShipPostalCode", e.Record("ShipPostalCode").ToString())
            Record.Add("ShipCountry", e.Record("ShipCountry").ToString())
            grid1.SelectedRecords.Add(Record)
        End If

        myConn.Close()
    End Sub

End Class
