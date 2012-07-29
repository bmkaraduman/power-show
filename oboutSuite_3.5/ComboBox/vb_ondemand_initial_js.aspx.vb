Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports System.Web
Imports System.Web.UI
Partial Class ComboBox_vb_ondemand_initial_js
    Inherits System.Web.UI.Page
    Dim ComboBox1 As Obout.ComboBox.ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(200)
        ComboBox1.Height = Unit.Pixel(200)
        ComboBox1.DataTextField = "CountryName"
        ComboBox1.DataValueField = "CountryID"
        ComboBox1.EmptyText = "Select a country ..."
        ComboBox1.EnableLoadOnDemand = True
        AddHandler ComboBox1.LoadingItems, AddressOf ComboBox1_LoadingItems

        ComboBox1Container.Controls.Add(ComboBox1)

    End Sub

    ' Handles the "LoadingItems" event of the ComboBox
    Sub ComboBox1_LoadingItems(ByVal sender As Object, ByVal e As ComboBoxLoadingItemsEventArgs)

        ' Getting the countries
        Dim data As DataTable = GetCountries(e.Text)

        ComboBox1.Items.Clear()
        ' Looping through the items and adding them to the "Items" collection of the ComboBox
        Dim i As Integer
        For i = 0 To data.Rows.Count - 1
            ComboBox1.Items.Add(New Obout.ComboBox.ComboBoxItem(data.Rows(i)("CountryName").ToString(), data.Rows(i)("CountryID").ToString()))
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
