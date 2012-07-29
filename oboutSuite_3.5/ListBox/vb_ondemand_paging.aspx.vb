Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_ondemand_paging
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(250)
        ListBox1.Height = Unit.Pixel(200)
        ListBox1.EnableLoadOnDemand = True
        ListBox1.DataTextField = "CountryName"
        ListBox1.DataValueField = "CountryID"

        AddHandler ListBox1.LoadingItems, AddressOf ListBox1_LoadingItems
        ListBox1.FooterTemplate = New FooterTemplate()

        ListBox1Container.Controls.Add(ListBox1)
    End Sub
    ' Handles the "LoadingItems" event of the ComboBox
    Sub ListBox1_LoadingItems(ByVal sender As Object, ByVal e As ListBoxLoadingItemsEventArgs)

        ' Getting the countries
        Dim data As DataTable = GetCountries(e.Text, e.ItemsOffset, 25)

        ' Looping through the items and adding them to the "Items" collection of the ComboBox
        Dim i As Integer
        For i = 0 To data.Rows.Count - 1
            ListBox1.Items.Add(New Obout.ListBox.ListBoxItem(data.Rows(i)("CountryName").ToString(), data.Rows(i)("CountryID").ToString()))
        Next i

        ' Calculating the numbr of items loaded so far in the ComboBox
        e.ItemsLoadedCount = e.ItemsOffset + data.Rows.Count

        ' Getting the total number of items that start with the typed text
        e.ItemsCount = GetItemsCount(e.Text)
    End Sub

    ' Gets all the countries that start with the typed text, taking paging into account
    Function GetCountries(ByVal text As String, ByVal startOffset As Integer, ByVal numberOfItems As Integer) As DataTable

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"))
        myConn.Open()

        Dim whereClause As String = " WHERE CountryName LIKE @CountryName"
        Dim sortExpression As String = " ORDER BY CountryName"

        Dim commandText As String = "SELECT TOP " + numberOfItems.ToString() + " CountryID, CountryName FROM Country"
        commandText += whereClause
        If Not (startOffset = 0) Then

            commandText += " AND CountryID NOT IN (SELECT TOP " + startOffset.ToString() + " CountryID FROM Country"
            commandText += whereClause + sortExpression + ")"
        End If

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
    ' Gets the total number of items that start with the typed text
    Function GetItemsCount(ByVal text As String) As Integer

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT COUNT(*) FROM Country WHERE CountryName LIKE @CountryName", myConn)
        myComm.Parameters.Add("@CountryName", OleDbType.VarChar).Value = text + "%"

        Return Integer.Parse(myComm.ExecuteScalar().ToString())
    End Function
End Class

Public Class FooterTemplate
    Implements ITemplate

    Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
        Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
        container.Controls.Add(templatePlaceHolder)
        AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate
    End Sub

    Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim templatePlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
        Dim container As ListBoxFooterTemlateContainer = CType(templatePlaceHolder.NamingContainer, ListBoxFooterTemlateContainer)

        Dim footer As Literal = New Literal()
        footer.Text = "Displaying " + IIf(container.ItemsCount > 0, "1", "0") + " - " + container.ItemsLoadedCount.ToString() + " out of " + container.ItemsCount.ToString()
        Dim countryText1 As Literal = New Literal()

        templatePlaceHolder.Controls.Add(footer)
    End Sub

End Class

