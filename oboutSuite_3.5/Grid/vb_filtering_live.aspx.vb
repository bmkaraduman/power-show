Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_filtering_live
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "sds1"
        grid1.AutoGenerateColumns = False
        grid1.CallbackMode = True
        grid1.AllowAddingRecords = False
        grid1.Serialize = True
        grid1.AllowFiltering = True
        grid1.ShowLoadingMessage = False
        grid1.AllowPageSizeSelection = False

        grid1.FilteringSettings.InitialState = GridFilterState.Visible
        grid1.FilteringSettings.FilterPosition = GridFilterPosition.Top

        Dim NameFilter As Obout.Grid.GridRuntimeTemplate
        NameFilter = New GridRuntimeTemplate()
        NameFilter.ID = "NameFilter"
        NameFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(NameFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateNameFilter
        NameFilter.ControlID = "Name"
        '------------------------------------------------------------------------

        ' creating the template for the Has Website column (view mode)
        '------------------------------------------------------------------------
        Dim CityFilter As Obout.Grid.GridRuntimeTemplate
        CityFilter = New GridRuntimeTemplate()
        CityFilter.ID = "CityFilter"
        CityFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(CityFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCityFilter
        CityFilter.ControlID = "City"
        '------------------------------------------------------------------------

        ' creating the template for the Has Website column (Filter)
        '------------------------------------------------------------------------
        Dim ZipFilter As Obout.Grid.GridRuntimeTemplate
        ZipFilter = New GridRuntimeTemplate()
        ZipFilter.ID = "ZipFilter"
        ZipFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(ZipFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateZipFilter
        ZipFilter.ControlID = "Zip"
        '------------------------------------------------------------------------

        ' creating the template for the Has Website column (edit mode)
        '------------------------------------------------------------------------
        Dim CountryFilter As Obout.Grid.GridRuntimeTemplate
        CountryFilter = New GridRuntimeTemplate()
        CountryFilter.ID = "CountryFilter"
        CountryFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(CountryFilter.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCountryFilter
        CountryFilter.ControlID = "Country"
        '------------------------------------------------------------------------

        ' adding the templates to the Templates collection        
        grid1.Templates.Add(NameFilter)
        grid1.Templates.Add(CityFilter)
        grid1.Templates.Add(ZipFilter)
        grid1.Templates.Add(CountryFilter)


        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"
        oCol2.TemplateSettings.FilterTemplateId = "NameFilter"
        oCol2.ShowFilterCriterias = False

        Dim NameFilterOption As FilterOption = New FilterOption()
        NameFilterOption.Type = FilterOptionType.StartsWith
        NameFilterOption.IsDefault = True

        oCol2.FilterOptions.Add(NameFilterOption)

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "150"
        oCol3.TemplateSettings.FilterTemplateId = "CityFilter"
        oCol3.ShowFilterCriterias = False

        Dim CityFilterOption As FilterOption = New FilterOption()
        CityFilterOption.Type = FilterOptionType.StartsWith
        CityFilterOption.IsDefault = True

        oCol3.FilterOptions.Add(CityFilterOption)

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"
        oCol4.TemplateSettings.FilterTemplateId = "ZipFilter"
        oCol4.ShowFilterCriterias = False

        Dim ZipFilterOption As FilterOption = New FilterOption()
        ZipFilterOption.Type = FilterOptionType.StartsWith
        ZipFilterOption.IsDefault = True

        oCol4.FilterOptions.Add(ZipFilterOption)

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "150"
        oCol5.TemplateSettings.FilterTemplateId = "CountryFilter"
        oCol5.ShowFilterCriterias = False

        Dim CountryFilterOption As FilterOption = New FilterOption()
        CountryFilterOption.Type = FilterOptionType.StartsWith
        CountryFilterOption.IsDefault = True

        oCol5.FilterOptions.Add(CountryFilterOption)

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

    End Sub

    ' Create the methods that will load the data into the templates

    '------------------------------------------------------------------------
    Sub CreateNameFilter(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(templatePlaceHolder)

        Dim textbox As Obout.Interface.OboutTextBox = New Obout.Interface.OboutTextBox()
        textbox.ID = "Name"
        textbox.Width = Unit.Percentage(100)
        textbox.ClientSideEvents.OnKeyUp = "applyFilter"

        templatePlaceHolder.Controls.Add(textbox)
    End Sub
    '------------------------------------------------------------------------

    '------------------------------------------------------------------------
    Sub CreateCityFilter(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(templatePlaceHolder)

        Dim textbox As Obout.Interface.OboutTextBox = New Obout.Interface.OboutTextBox()
        textbox.ID = "City"
        textbox.Width = Unit.Percentage(100)
        textbox.ClientSideEvents.OnKeyUp = "applyFilter"

        templatePlaceHolder.Controls.Add(textbox)
    End Sub
    '------------------------------------------------------------------------

    '------------------------------------------------------------------------
    Sub CreateZipFilter(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(templatePlaceHolder)

        Dim textbox As Obout.Interface.OboutTextBox = New Obout.Interface.OboutTextBox()
        textbox.ID = "Zip"
        textbox.Width = Unit.Percentage(100)
        textbox.ClientSideEvents.OnKeyUp = "applyFilter"

        templatePlaceHolder.Controls.Add(textbox)
    End Sub
    '------------------------------------------------------------------------

    '------------------------------------------------------------------------
    Sub CreateCountryFilter(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(templatePlaceHolder)

        Dim textbox As Obout.Interface.OboutTextBox = New Obout.Interface.OboutTextBox()
        textbox.ID = "Country"
        textbox.Width = Unit.Percentage(100)
        textbox.ClientSideEvents.OnKeyUp = "applyFilter"

        templatePlaceHolder.Controls.Add(textbox)
    End Sub
End Class
