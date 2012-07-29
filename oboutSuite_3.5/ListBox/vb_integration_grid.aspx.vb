Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports System.Text
Imports Obout.Grid
Partial Class ListBox_vb_integration_grid
    Inherits System.Web.UI.Page
    Dim grid1 As Grid
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1 = New Grid()
        grid1.ID = "grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = False
        grid1.ClientSideEvents.OnBeforeClientDelete = "Grid1_BeforeDelete"
        grid1.ClientSideEvents.ExposeSender = True

        Dim TemplateEditCountry As GridRuntimeTemplate = New GridRuntimeTemplate()
        TemplateEditCountry.ID = "Template1"
        TemplateEditCountry.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateEditCountry.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateEditCountryTemplate
        TemplateEditCountry.ControlID = "ListBox1"
        TemplateEditCountry.ControlPropertyName = "value"
        TemplateEditCountry.UseQuotes = True

        grid1.Templates.Add(TemplateEditCountry)

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False
        oCol1.HeaderText = "ORDER ID"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"

        oCol5.TemplateSettings.EditTemplateId = "Template1"

        Dim oCol6 As Column = New Column()
        oCol6.AllowEdit = True
        oCol6.AllowDelete = True

        'add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)

        Grid1Container.Controls.Add(grid1)
    End Sub
    Sub CreateEditCountryTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oPlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPlaceHolder)
        
        Dim ListBox1 As Obout.ListBox.ListBox = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Height = 100
        ListBox1.Width = Unit.Percentage(100)
        ListBox1.DataSourceID = "SqlDataSource2"
        ListBox1.DataTextField = "CountryName"
        ListBox1.DataValueField = "CountryName"
        ListBox1.AppendDataBoundItems = False

        oPlaceHolder.Controls.Add(ListBox1)
    End Sub


End Class
