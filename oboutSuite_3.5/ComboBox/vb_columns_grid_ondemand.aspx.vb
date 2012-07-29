Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports System.Web
Imports System.Web.UI
Partial Class ComboBox_vb_columns_grid_ondemand
    Inherits System.Web.UI.Page
    Dim ComboBox1 As Obout.ComboBox.ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New Obout.ComboBox.ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(200)
        ComboBox1.MenuWidth = Unit.Pixel(400)
        ComboBox1.Height = Unit.Pixel(150)
        ComboBox1.EnableLoadOnDemand = True
        ComboBox1.EnableVirtualScrolling = True
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "SupplierID"

        AddHandler ComboBox1.LoadingItems, AddressOf ComboBox1_LoadingItems

        ComboBox1.HeaderTemplate = New HeaderTemplate()
        ComboBox1.ItemTemplate = New ItemTemplate()
        ComboBox1.FooterTemplate = New FooterTemplate()

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub
    ' Handles the "LoadingItems" event of the ListBox
    Sub ComboBox1_LoadingItems(ByVal sender As Object, ByVal e As ComboBoxLoadingItemsEventArgs)

        ' Getting the countries
        Dim data As DataTable = GetItems(e.Text, e.ItemsOffset, 10)

        ComboBox1.DataSource = data
        ComboBox1.DataBind()

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
            Dim container As ComboBoxFooterTemlateContainer = CType(templatePlaceHolder.NamingContainer, ComboBoxFooterTemlateContainer)

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
            Dim container As ComboBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ComboBoxItemTemlateContainer)
            Dim item As Obout.ComboBox.ComboBoxItem = CType(container.Parent, Obout.ComboBox.ComboBoxItem)

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
