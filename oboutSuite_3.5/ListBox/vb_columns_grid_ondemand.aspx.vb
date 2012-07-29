Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_columns_grid_ondemand
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(400)
        ListBox1.Height = Unit.Pixel(150)
        ListBox1.EnableLoadOnDemand = True
        ListBox1.DataTextField = "CompanyName"
        ListBox1.DataValueField = "SupplierID"

        AddHandler ListBox1.LoadingItems, AddressOf ListBox1_LoadingItems

        ListBox1.HeaderTemplate = New HeaderTemplate()
        ListBox1.ItemTemplate = New ItemTemplate()
        ListBox1.FooterTemplate = New FooterTemplate()

        ListBox1Container.Controls.Add(ListBox1)
    End Sub
    ' Handles the "LoadingItems" event of the ListBox
    Sub ListBox1_LoadingItems(ByVal sender As Object, ByVal e As ListBoxLoadingItemsEventArgs)

        ' Getting the countries
        Dim data As DataTable = GetItems(e.Text, e.ItemsOffset, 10)

        ListBox1.DataSource = data
        ListBox1.DataBind()

        ' Calculating the numbr of items loaded so far in the ListBox
        e.ItemsLoadedCount = e.ItemsOffset + data.Rows.Count

        ' Getting the total number of items that start with the typed text
        e.ItemsCount = GetItemsCount(e.Text)
    End Sub
    Function GetItems(ByVal text As String, ByVal startOffset As Integer, ByVal numberOfItems As Integer) As DataTable

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim whereClause As String = " WHERE CompanyName LIKE @CompanyName"
        Dim sortExpression As String = " ORDER BY CompanyName"

        Dim commandText As String = "SELECT TOP " + numberOfItems.ToString() + " * FROM Suppliers"
        commandText += whereClause
        If Not (startOffset = 0) Then

            commandText += " AND SupplierID NOT IN (SELECT TOP " + startOffset.ToString() + " SupplierID FROM Suppliers"
            commandText += whereClause + sortExpression + ")"
        End If

        commandText += sortExpression

        Dim myComm As OleDbCommand = New OleDbCommand(commandText, myConn)
        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = text + "%"

        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        da.SelectCommand = myComm
        da.Fill(ds, "Suppliers")

        myConn.Close()

        Return ds.Tables(0)
    End Function


    ' Gets the total number of items that start with the typed text
    Function GetItemsCount(ByVal text As String) As Integer
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT COUNT(*) FROM Suppliers WHERE CompanyName LIKE @CompanyName", myConn)
        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = Text + "%"

        Return Integer.Parse(myComm.ExecuteScalar().ToString())
    End Function
    Public Class HeaderTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim header As Literal = New Literal()
            header.Text = "<div class=""header c1"">ID</div>"
            container.Controls.Add(header)

            Dim header2 As Literal = New Literal()
            header2.Text = "<div class=""header c2"">COMPANY NAME</div>"
            container.Controls.Add(header2)

            Dim header3 As Literal = New Literal()
            header3.Text = "<div class=""header c3"">CITY</div>"
            container.Controls.Add(header3)
        End Sub
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
    Public Class ItemTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)
            AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate
        End Sub
        Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)
            Dim templatePlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
            Dim container As ListBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ListBoxItemTemlateContainer)
            Dim item As Obout.ListBox.ListBoxItem = CType(container.Parent, Obout.ListBox.ListBoxItem)

            templatePlaceHolder.Controls.Clear()

            Dim supplierIDText As Literal = New Literal()
            supplierIDText.Text = "<div class=""item c1"">" + DataBinder.Eval(item.DataItem, "SupplierID").ToString() + "</div>"

            Dim companyNameText As Literal = New Literal()
            companyNameText.Text = "<div class=""item c2"">" + DataBinder.Eval(item.DataItem, "CompanyName").ToString() + "</div>"

            Dim cityText As Literal = New Literal()
            cityText.Text = " <div class=""item c3"">" + DataBinder.Eval(item.DataItem, "City").ToString() + "</div>"

            templatePlaceHolder.Controls.Add(supplierIDText)
            templatePlaceHolder.Controls.Add(companyNameText)
            templatePlaceHolder.Controls.Add(cityText)
        End Sub

    End Class
End Class
