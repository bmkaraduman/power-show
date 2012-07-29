Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports System.Text
Imports Obout.Grid
Partial Class ComboBox_vb_integration_grid_inside
    Inherits System.Web.UI.Page

    Dim ComboBox1 As Obout.ComboBox.ComboBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(200)
        ComboBox1.MenuWidth = Unit.Pixel(570)
        ComboBox1.AutoClose = False
        ComboBox1.AllowCustomText = True
        ComboBox1.AutoValidate = True
        ComboBox1.AllowEdit = False
        ComboBox1.EmptyText = "Select a customer ..."

        ComboBox1.ClientSideEvents.OnOpen = "ComboBox1_Open"

        Dim item1 As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
        item1.ID = "ComboBoxItem1"
        ComboBox1.Items.Add(item1)

        ComboBox1.ItemTemplate = New ItemTemplate()

        ComboBox1Container.Controls.Add(ComboBox1)

    End Sub

    Public Class ItemTemplate
        Implements ITemplate
        Dim OboutCheckBox1 As Obout.Interface.OboutCheckBox
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim divContainer As Literal = New Literal()
            divContainer.Text = "<div id=""gridContainer"">"

            Dim grid1 As Obout.Grid.Grid = New Obout.Grid.Grid()
            grid1.ID = "Grid1"
            grid1.DataSourceID = "SqlDataSource1"
            grid1.AutoGenerateColumns = False
            grid1.AllowPaging = False
            grid1.AllowPageSizeSelection = False
            grid1.AllowSorting = False
            grid1.PageSize = -1
            grid1.AllowMultiRecordSelection = False
            grid1.AllowAddingRecords = False
            grid1.ClientSideEvents.ExposeSender = True
            grid1.ClientSideEvents.OnClientSelect = "Grid1_Select"

            Dim oCol1 As Obout.Grid.Column = New Obout.Grid.Column()
            oCol1.DataField = "CustomerID"
            oCol1.Visible = False
            oCol1.HeaderText = "CUSTOMER"

            Dim oCol2 As Obout.Grid.Column = New Obout.Grid.Column()
            oCol2.DataField = "CompanyName"
            oCol2.HeaderText = "NAME"

            Dim oCol3 As Obout.Grid.Column = New Obout.Grid.Column()
            oCol3.DataField = "City"
            oCol3.HeaderText = "CITY"

            Dim oCol4 As Obout.Grid.Column = New Obout.Grid.Column()
            oCol4.DataField = "Country"
            oCol4.HeaderText = "COUNTRY"

            grid1.Columns.Add(oCol1)
            grid1.Columns.Add(oCol2)
            grid1.Columns.Add(oCol3)
            grid1.Columns.Add(oCol4)

            grid1.ScrollingSettings.ScrollHeight = 175
            grid1.PagingSettings.ShowRecordsCount = False

            Dim divContainer2 As Literal = New Literal()
            divContainer2.Text = "</div>"

            templatePlaceHolder.Controls.Add(divContainer)
            templatePlaceHolder.Controls.Add(grid1)
            templatePlaceHolder.Controls.Add(divContainer2)
        End Sub

    End Class

End Class

