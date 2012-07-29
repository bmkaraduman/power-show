Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_ondemand
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(200)
        ListBox1.Height = Unit.Pixel(200)
        ListBox1.EnableLoadOnDemand = True
        ListBox1.DataTextField = "CountryName"
        ListBox1.DataValueField = "CountryID"

        AddHandler ListBox1.LoadingItems, AddressOf ListBox1_LoadingItems

        ListBox1Container.Controls.Add(ListBox1)

    End Sub

    ' Handles the "LoadingItems" event of the ListBox
    Sub ListBox1_LoadingItems(ByVal sender As Object, ByVal e As ListBoxLoadingItemsEventArgs)

        ' Getting the countries
        Dim data As DataTable = GetCountries(e.Text)

        ' Looping through the items and adding them to the "Items" collection of the ListBox
        Dim i As Integer
        For i = 0 To data.Rows.Count - 1
            ListBox1.Items.Add(New ListBoxItem(data.Rows(i)("CountryName").ToString(), data.Rows(i)("CountryID").ToString()))
        Next i

        e.ItemsLoadedCount = data.Rows.Count
        e.ItemsCount = data.Rows.Count
    End Sub

    ' Gets all the countries that start with the typed text, taking paging into account
    Function GetCountries(ByVal text As String) As DataTable

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"))
        myConn.Open()

        Dim whereClause As String = " WHERE CountryName LIKE @CountryName"
        Dim sortExpression As String = " ORDER BY CountryName"

        Dim commandText As String = "SELECT TOP 25 CountryID, CountryName FROM Country"
        commandText += whereClause
        commandText += sortExpression

        Dim myComm As OleDbCommand = New OleDbCommand(commandText, myConn)
        myComm.Parameters.Add("@CountryName", OleDbType.VarChar).Value = text + "%"

        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        da.SelectCommand = myComm
        da.Fill(ds, "Country")

        myConn.Close()

        Return ds.Tables(0)
    End Function
End Class
