Imports System
Imports System.Data.OleDb
Imports System.Web.UI.WebControls
Imports Obout.Grid

Public Class vb_Products
    Inherits OboutInc.oboutAJAXPage

    Protected lUpdate As Literal
    Protected gridItems As Grid

    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If (Session("lUpdate") = Nothing) Then
            Session("lUpdate") = DateTime.Now
        End If

        LoadLUpdate()
        LoadItems()
    End Sub

    Public Sub DoNothing()
    End Sub

    Private Sub LoadLUpdate()
        If IsCallback Then
            Session("lUpdate") = DateTime.Now
        End If
        lUpdate.Text = (CType(Session("lUpdate"), DateTime)).ToString("d/m/yyyy h:m:s tt")
    End Sub

    Private Sub LoadItems()
        Dim query As String = ""

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/items.mdb"))
        myConn.Open()

        Dim index As Int32
        For index = 0 To 24 Step 1
            query = "update Items set Items = rnd() * 10 where Id = " + index.ToString()

            Dim myComm1 As OleDbCommand = New OleDbCommand(query, myConn)

            myComm1.ExecuteNonQuery()

            query = "update Items set Price = rnd() * 100 where Id = " + index.ToString()

            Dim myComm2 As OleDbCommand = New OleDbCommand(query, myConn)

            myComm2.ExecuteNonQuery()
        Next

        query = "SELECT Id, Name, Items, Price FROM Items"
        Dim myComm As OleDbCommand = New OleDbCommand(query, myConn)
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        gridItems.DataSource = myReader
        gridItems.DataBind()

        myReader.Close()
    End Sub

    Public Sub UpdateStockAutomatically()
        CreateTimer("UpdateStockTimer", "DoNothing", "UpdateStock", 8000)
    End Sub

    Public Sub CancelUpdateStockAutomatically()
        CancelTimer("UpdateStockTimer")
    End Sub
End Class