Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid
Imports Obout.ComboBox

Partial Class Grid_vb_filtering_combobox_ondemand
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.AllowFiltering = True
        grid1.AllowPageSizeSelection = False

        Dim Template1 As GridRuntimeTemplate
        Template1 = New GridRuntimeTemplate()
        Template1.ID = "Template1"
        Template1.ControlID = "ComboBox1"
        Template1.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(Template1.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTemplate1
        '------------------------------------------------------------------------

        grid1.Templates.Add(Template1)

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCountry"
        oCol4.HeaderText = "COUNTRY"
        oCol4.ShowFilterCriterias = False
        oCol4.TemplateSettings.FilterTemplateId = "Template1"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipPostalCode"
        oCol5.HeaderText = "POSTAL CODE"

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

    End Sub

    Sub CreateTemplate1(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim ph1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(ph1)

        Dim combobox1 As ComboBox = New ComboBox()
        combobox1.ID = "ComboBox1"
        combobox1.Width = Unit.Percentage(100)
        combobox1.Height = Unit.Pixel(200)
        combobox1.DataTextField = "CountryName"
        combobox1.DataValueField = "CountryName"
        combobox1.EmptyText = "Select a country ..."
        combobox1.EnableLoadOnDemand = True
        AddHandler combobox1.LoadingItems, AddressOf ComboBox1_LoadingItems

        ph1.Controls.Add(combobox1)

    End Sub

    ' Handles the "LoadingItems" event of the ComboBox
    Sub ComboBox1_LoadingItems(ByVal sender As Object, ByVal e As ComboBoxLoadingItemsEventArgs)

        ' Getting the countries
        Dim Data As DataTable = GetCountries(e.Text)

        ' Looping through the items and adding them to the "Items" collection of the ComboBox

        For i As Integer = 0 To Data.Rows.Count - 1
            CType(sender, ComboBox).Items.Add(New Obout.ComboBox.ComboBoxItem(Data.Rows(i)("CountryName").ToString(), Data.Rows(i)("CountryName").ToString()))
        Next

        e.ItemsLoadedCount = Data.Rows.Count
        e.ItemsCount = Data.Rows.Count
    End Sub

    ' Gets all the countries that start with the typed text, taking paging into account
    Function GetCountries(ByVal text As String) As DataTable

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"))
        myConn.Open()

        Dim whereClause As String = " WHERE CountryName LIKE @CountryName"
        Dim sortExpression As String = " ORDER BY CountryName"

        Dim commandText As String = "SELECT CountryID, CountryName FROM Country"
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
