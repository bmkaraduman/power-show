<%@ Page Language="VB" EnableEventValidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Globalization" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script type="text/VB" runat="server">

    Private grid1 As New Grid()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.AllowPageSizeSelection = False
    
    
        grid1.FolderStyle = "styles/black_glass"
        grid1.AllowFiltering = True
        grid1.FilteringSettings.InitialState = GridFilterState.Visible
        grid1.ShowLoadingMessage = False
    
        grid1.ClientSideEvents.ExposeSender = True
        grid1.ClientSideEvents.OnFiltering = "grid1_OnFiltering"
        grid1.ClientSideEvents.OnPopulatingFilterFields = "grid1_OnPopulatingFilterFields"
    
    
        ' creating the columns
        Dim oCol1 As New Column()
        oCol1.DataField = "OrderID"
        oCol1.[ReadOnly] = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "125"
        oCol1.Visible = False
    
        Dim oCol2 As New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        'oCol2.Width = "200";
    
        Dim oCol3 As New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        'oCol3.Width = "150";
        oCol3.ShowFilterCriterias = False
    
    
        Dim oCol4 As New Column()
        oCol4.DataField = "ShipCountry"
        oCol4.HeaderText = "COUNTRY"
        'oCol4.Width = "150";
        oCol4.ShowFilterCriterias = False
    
    
        Dim oCol5 As New Column()
        oCol5.DataField = "OrderDate"
        oCol5.HeaderText = "ORDER DATE"
        oCol5.Width = "200"
        oCol5.DataFormatString = "{0:M/d/yyyy}"
    
    
        Dim oCol6 As New Column()
        oCol6.DataField = "Freight"
        oCol6.HeaderText = "FREIGHT"
        oCol6.Width = "200"
        oCol6.ShowFilterCriterias = False
    
    
        AddHandler grid1.Filtering, AddressOf grid1_Filtering
    
        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
    
    
        ' ....Creating custom filter options.....
    
        Dim oCol5Filter As New CustomFilterOption()
        oCol5Filter.ID = "Between_OrderDate"
        oCol5Filter.IsDefault = True
        oCol5Filter.Text = "Between"
    
        Dim oCol6Filter As New CustomFilterOption()
        oCol6Filter.ID = "FreightIsInInteral"
        oCol6Filter.IsDefault = True
        oCol6Filter.Text = ""
    
        Dim ByYear_OrderDate As New CustomFilterOption()
        ByYear_OrderDate.ID = "ByYear_OrderDate"
        ByYear_OrderDate.Text = "Filter By Year"
    
        Dim ByMonth_OrderDate As New CustomFilterOption()
        ByMonth_OrderDate.ID = "ByMonth_OrderDate"
        ByMonth_OrderDate.Text = "Filter By Month"
    
        Dim ByYearAndMonth_OrderDate As New CustomFilterOption()
        ByYearAndMonth_OrderDate.ID = "ByYearAndMonth_OrderDate"
        ByYearAndMonth_OrderDate.Text = "Filter By Year And Month"
    
        Dim oCol3Filter As New CustomFilterOption()
        oCol3Filter.ID = "CitiesIn"
        oCol3Filter.IsDefault = True
        oCol3Filter.Text = ""
    
        Dim oCol4Filter As New CustomFilterOption()
        oCol4Filter.ID = "CountriesIn"
        oCol4Filter.IsDefault = True
        oCol4Filter.Text = ""
    
    
        Dim oCol2Filter As New CustomFilterOption()
        oCol2Filter.ID = "ShipNameStartsWith"
        oCol2Filter.IsDefault = True
        oCol2Filter.Text = "Starts With"
    
        '................. Adding Filtercreteria to each columns...........
    
        oCol2.FilterCriteria.[Option].Type = FilterOptionType.[Custom]
        oCol2.FilterOptions.Add(oCol2Filter)
    
        oCol3.FilterCriteria.[Option].Type = FilterOptionType.[Custom]
        oCol3.FilterOptions.Add(oCol3Filter)
    
        oCol4.FilterCriteria.[Option].Type = FilterOptionType.[Custom]
        oCol4.FilterOptions.Add(oCol4Filter)
    
        oCol5.FilterCriteria.[Option].Type = FilterOptionType.[Custom]
        oCol5.FilterOptions.Add(oCol5Filter)
        oCol5.FilterOptions.Add(ByYear_OrderDate)
        oCol5.FilterOptions.Add(ByMonth_OrderDate)
        oCol5.FilterOptions.Add(ByYearAndMonth_OrderDate)
    
        oCol6.FilterCriteria.[Option].Type = FilterOptionType.[Custom]
        oCol6.FilterOptions.Add(oCol6Filter)
    
    
        '........... Filter templates....
    
        oCol6Filter.TemplateSettings.FilterTemplateId = "FreightFilter"
        oCol6Filter.TemplateSettings.FilterControlsIds = "FreightInterval1,FreightInterval2,FreightInterval3,FreightInterval4"
        oCol6Filter.TemplateSettings.FilterControlsPropertyNames = "checked,checked,checked,checked"
    
        ByYearAndMonth_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateByYearAndMonthFilter"
        ByYearAndMonth_OrderDate.TemplateSettings.FilterControlsIds = "YearMonth_Year_OrderDate,YearMonth_Month_OrderDate"
        ByYearAndMonth_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value,value"
    
        ByMonth_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateByMonthFilter"
        ByMonth_OrderDate.TemplateSettings.FilterControlsIds = "Month_OrderDate"
        ByMonth_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value"
    
        ByYear_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateByYearFilter"
        ByYear_OrderDate.TemplateSettings.FilterControlsIds = "Year_OrderDate"
        ByYear_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value"
    
        oCol5Filter.TemplateSettings.FilterTemplateId = "OrderDateBetweenFilter"
        oCol5Filter.TemplateSettings.FilterControlsIds = "StartDate_OrderDate,EndDate_OrderDate"
        oCol5Filter.TemplateSettings.FilterControlsPropertyNames = "value,value"
    
        oCol3Filter.TemplateSettings.FilterTemplateId = "CitiesFilter"
        oCol3Filter.TemplateSettings.FilterControlsIds = "TxtCities"
        oCol3Filter.TemplateSettings.FilterControlsPropertyNames = "value"
    
        oCol4Filter.TemplateSettings.FilterTemplateId = "CountriesFilter"
        oCol4Filter.TemplateSettings.FilterControlsIds = "SelectedCountries"
        oCol4Filter.TemplateSettings.FilterControlsPropertyNames = "value"
    
        oCol2Filter.TemplateSettings.FilterTemplateId = "ShipNameStartsWithTemplate"
        oCol2Filter.TemplateSettings.FilterControlsIds = "ShipNameStartsWith1,ShipNameStartsWith2"
        oCol2Filter.TemplateSettings.FilterControlsPropertyNames = "value,value"
    
    
        ' creating Filter Templates
    
        '------------------------------------------------------------------------
    
        Dim FreightFilter As New GridRuntimeTemplate()
        FreightFilter.ID = "FreightFilter"
        FreightFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler FreightFilter.Template.CreateTemplate, AddressOf CreateFreightFilterTemplate
    
        Dim OrderDateByYearAndMonthFilter As New GridRuntimeTemplate()
        OrderDateByYearAndMonthFilter.ID = "OrderDateByYearAndMonthFilter"
        OrderDateByYearAndMonthFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler OrderDateByYearAndMonthFilter.Template.CreateTemplate, AddressOf CreateOrderDateByYearAndMonthFilterTemplate
    
        Dim OrderDateBetweenFilter As New GridRuntimeTemplate()
        OrderDateBetweenFilter.ID = "OrderDateBetweenFilter"
        OrderDateBetweenFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler OrderDateBetweenFilter.Template.CreateTemplate, AddressOf CreateOrderDateBetweenFilterTemplate
    
        Dim ByMonthOrderDateFilter As New GridRuntimeTemplate()
        ByMonthOrderDateFilter.ID = "OrderDateByMonthFilter"
        ByMonthOrderDateFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler ByMonthOrderDateFilter.Template.CreateTemplate, AddressOf CreateByMonthOrderDateFilterTemplate
    
        Dim ByYearOrderDateFilter As New GridRuntimeTemplate()
        ByYearOrderDateFilter.ID = "OrderDateByYearFilter"
        ByYearOrderDateFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler ByYearOrderDateFilter.Template.CreateTemplate, AddressOf CreateByYearOrderDateFilterTemplate
    
        Dim CitiesFilter As New GridRuntimeTemplate()
        CitiesFilter.ID = "CitiesFilter"
        CitiesFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CitiesFilter.Template.CreateTemplate, AddressOf CreateCitiesFilteTemplate
    
        Dim CountriesFilter As New GridRuntimeTemplate()
        CountriesFilter.ID = "CountriesFilter"
        CountriesFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CountriesFilter.Template.CreateTemplate, AddressOf CreateCountriesFilteTemplate
    
        Dim ShipNameStartsWithTemplate As New GridRuntimeTemplate()
        ShipNameStartsWithTemplate.ID = "ShipNameStartsWithTemplate"
        ShipNameStartsWithTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler ShipNameStartsWithTemplate.Template.CreateTemplate, AddressOf CreateShipNameStartsWithTemplate
    
        ' adding the templates to the Templates collection
    
        grid1.Templates.Add(ShipNameStartsWithTemplate)
        grid1.Templates.Add(CountriesFilter)
        grid1.Templates.Add(CitiesFilter)
        grid1.Templates.Add(ByYearOrderDateFilter)
        grid1.Templates.Add(ByMonthOrderDateFilter)
        grid1.Templates.Add(OrderDateBetweenFilter)
        grid1.Templates.Add(OrderDateByYearAndMonthFilter)
        grid1.Templates.Add(FreightFilter)
    
    
    
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    
        Dim sds1 As New SqlDataSource()
        sds1.ID = "sds1"
        sds1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        sds1.ProviderName = "System.Data.OleDb"
        sds1.SelectCommand = "SELECT * FROM Orders"
        phGrid1.Controls.Add(sds1)
    
        grid1.DataSourceID = "sds1"
    
    
        If Not Page.IsPostBack Then
            ' Initial filter criteria for the ShipName column
            Dim criteria0 As New FilterCriteria()
            ' use "Between" filter option (with index 0 in FilterOptions collection)
            Dim option0 As CustomFilterOption = TryCast(grid1.Columns(1).FilterOptions(0), CustomFilterOption)
        
            criteria0.[Option] = option0
            criteria0.Values = New Hashtable()
            criteria0.Values("ShipNameStartsWith1") = "Save"
            criteria0.Values("ShipNameStartsWith2") = "Split"
        
            grid1.Columns(1).FilterCriteria = criteria0
        
        
        
            ' Initial filter criteria for the OrderDate column
            Dim criteria1 As New FilterCriteria()
            ' use "Between" filter option (with index 0 in FilterOptions collection)
            Dim option1 As CustomFilterOption = TryCast(grid1.Columns(4).FilterOptions(0), CustomFilterOption)
        
            criteria1.[Option] = option1
            criteria1.Values = New Hashtable()
            criteria1.Values("StartDate_OrderDate") = "1/1/1995"
            criteria1.Values("EndDate_OrderDate") = "10/1/1995"
        
            grid1.Columns(4).FilterCriteria = criteria1
        
        
        
            ' Initial filter criteria for the ShipCountry column
            Dim criteria2 As New FilterCriteria()
            Dim option2 As CustomFilterOption = TryCast(grid1.Columns(2).FilterOptions(0), CustomFilterOption)
        
            criteria2.[Option] = option2
            criteria2.Values = New Hashtable()
            criteria2.Values("SelectedCountries") = "USA,Germany"
        
            grid1.Columns(2).FilterCriteria = criteria2
        
        
        
            ' Initial filter criteria for the ShipCity column
            Dim criteria4 As New FilterCriteria()
            Dim option4 As CustomFilterOption = TryCast(grid1.Columns(3).FilterOptions(0), CustomFilterOption)
        
            criteria4.[Option] = option4
            criteria4.Values = New Hashtable()
            criteria4.Values("TxtCities") = "Boise,Lander"
        
            grid1.Columns(3).FilterCriteria = criteria4
        
        
        
            ' Initial filter criteria for the Freight column
            Dim criteria3 As New FilterCriteria()
            Dim option3 As CustomFilterOption = TryCast(grid1.Columns(5).FilterOptions(0), CustomFilterOption)
        
            criteria3.[Option] = option3
            criteria3.Values = New Hashtable()
            criteria3.Values("FreightInterval1") = "true"
            criteria3.Values("FreightInterval2") = "false"
            criteria3.Values("FreightInterval3") = "false"
            criteria3.Values("FreightInterval4") = "true"
        
            grid1.Columns(5).FilterCriteria = criteria3
        End If
    End Sub

    ' Create the methods that will load the data into the templates
    '------------------------------------------------------------------------    


    Public Sub CreateFreightFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindFreightFilterTemplate
    End Sub

    Protected Sub DataBindFreightFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim divContainer As HtmlGenericControl = CreateDiv("tdText", "")
        divContainer.Controls.Add(CreateCheckbox("FreightInterval1", "$0-$49"))
        divContainer.Controls.Add(CreateCheckbox("FreightInterval2", "$50-$99"))
        divContainer.Controls.Add(New HtmlGenericControl("br"))
        divContainer.Controls.Add(CreateCheckbox("FreightInterval3", "$100-$150"))
        divContainer.Controls.Add(CreateCheckbox("FreightInterval4", "> $150"))
    
        oPhOdateByYear.Controls.Add(divContainer)
    End Sub

    Public Sub CreateOrderDateByYearAndMonthFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindOrderDateByYearAndMonthFilterTemplate
    End Sub

    Protected Sub DataBindOrderDateByYearAndMonthFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim divContainer As HtmlGenericControl = CreateDiv("", "")
        Dim ddlYear As DropDownList = CreateYearDDL("YearMonth_Year_OrderDate", 49)
        Dim ddlMonth As DropDownList = CreateMonthDDL("YearMonth_Month_OrderDate", 49)
        divContainer.Controls.Add(ddlYear)
        divContainer.Controls.Add(ddlMonth)
        oPhOdateByYear.Controls.Add(divContainer)
    End Sub

    Public Sub CreateByMonthOrderDateFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindByMonthOrderDateFilterTemplate
    End Sub

    Protected Sub DataBindByMonthOrderDateFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim ddlMonth As DropDownList = CreateMonthDDL("Month_OrderDate", 100)
        oPhOdateByYear.Controls.Add(ddlMonth)
    End Sub
    Public Sub CreateByYearOrderDateFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindByYearOrderDateFilterTemplate
    End Sub

    Protected Sub DataBindByYearOrderDateFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim ddlYear As DropDownList = CreateYearDDL("Year_OrderDate", 100)
        oPhOdateByYear.Controls.Add(ddlYear)
    End Sub

    Public Sub CreateOrderDateBetweenFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindOrderDateBetweenFilterTemplate
    End Sub

    Protected Sub DataBindOrderDateBetweenFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateBetween As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim divContainer As HtmlGenericControl = CreateDiv("tdText", "")
        divContainer.Controls.Add(CreateTextBox("StartDate_OrderDate", TextBoxMode.SingleLine, 45))
        divContainer.Controls.Add(CreateDiv("separator", "-"))
        divContainer.Controls.Add(CreateTextBox("EndDate_OrderDate", TextBoxMode.SingleLine, 45))
    
        
        oPhOdateBetween.Controls.Add(divContainer)
    End Sub

    Public Sub CreateCitiesFilteTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhCity As New PlaceHolder()
        e.Container.Controls.Add(oPhCity)
        AddHandler oPhCity.DataBinding, AddressOf DataBindCitiesFilterTemplate
    End Sub

    Protected Sub DataBindCitiesFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhCity As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim oTextCity As OboutTextBox = CreateTextBox("TxtCities", TextBoxMode.MultiLine, 100)
    
        oPhCity.Controls.Add(oTextCity)
    End Sub

    Public Sub CreateCountriesFilteTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhCountry As New PlaceHolder()
        e.Container.Controls.Add(oPhCountry)
        AddHandler oPhCountry.DataBinding, AddressOf DataBindCountriesFilterTemplate
    End Sub

    Protected Sub DataBindCountriesFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhCountry As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim lstCountried As ListBox = CreateCountryList("DdlCountries", "tdText")
        oPhCountry.Controls.Add(lstCountried)
        
        Dim hiddenField As Literal = New Literal()
        hiddenField.Text = "<input type=""hidden"" id=""SelectedCountries"" />"
        oPhCountry.Controls.Add(hiddenField)
    End Sub

    Public Sub CreateShipNameStartsWithTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhName As New PlaceHolder()
        e.Container.Controls.Add(oPhName)
        AddHandler oPhName.DataBinding, AddressOf DataBindShipNameStartsWithTemplate
    End Sub

    Protected Sub DataBindShipNameStartsWithTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhName As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim divContainer As HtmlGenericControl = CreateDiv("tdText", "")
        divContainer.Controls.Add(CreateTextBox("ShipNameStartsWith1", TextBoxMode.SingleLine, 42))
        divContainer.Controls.Add(CreateDiv("separator", "or"))
        divContainer.Controls.Add(CreateTextBox("ShipNameStartsWith2", TextBoxMode.SingleLine, 42))
    
        oPhName.Controls.Add(divContainer)
    End Sub


    Protected Function CreateYearDDL(ByVal id As String, ByVal width As Integer) As OboutDropDownList
        Dim ddlYear As New OboutDropDownList()
        ddlYear.ID = id
        ddlYear.Width = Unit.Percentage(width)
        ddlYear.Height = Unit.Pixel(150)
        For i As Integer = 1994 To 2010
            ddlYear.Items.Add(New ListItem(i.ToString()))
        Next
        Return ddlYear
    End Function

    Protected Function CreateMonthDDL(ByVal id As String, ByVal width As Integer) As OboutDropDownList
        Dim ddlMonth As New OboutDropDownList()
        ddlMonth.ID = id
        ddlMonth.Height = Unit.Pixel(150)
        ddlMonth.Width = Unit.Percentage(width)
        Dim dateFormatinfo As New DateTimeFormatInfo()
        For i As Integer = 1 To 12
            ddlMonth.Items.Add(New ListItem(dateFormatinfo.GetMonthName(i), i.ToString()))
        Next
    
        Return ddlMonth
    End Function

    Protected Function CreateCountryList(ByVal id As String, ByVal cssClass As String) As ListBox
        Dim lstCountries As New ListBox()
        lstCountries.ID = id
        lstCountries.CssClass = cssClass
        lstCountries.SelectionMode = ListSelectionMode.Multiple
        lstCountries.Rows = 3
        lstCountries.Width = Unit.Percentage(100)
    
        lstCountries.Items.Add(New ListItem("USA"))
        lstCountries.Items.Add(New ListItem("UK"))
        lstCountries.Items.Add(New ListItem("Germany"))
        lstCountries.Items.Add(New ListItem("France"))
        lstCountries.Items.Add(New ListItem("Brazil"))
    
        Return lstCountries
    End Function

    Protected Function CreateCheckbox(ByVal id As String, ByVal text As String) As OboutCheckBox
        Dim obChk As New OboutCheckBox()
        obChk.ID = id
        obChk.Text = text
        obChk.Width = Unit.Percentage(50)
        Return obChk
    End Function

    Protected Function CreateDiv(ByVal className As String, ByVal innerHTML As String) As HtmlGenericControl
        Dim obDiv As New HtmlGenericControl("DIV")
        obDiv.Attributes.Add("class", className)
        obDiv.InnerHtml = innerHTML
    
        Return obDiv
    End Function

    Protected Function CreateTextBox(ByVal Id As String, ByVal txtMode As TextBoxMode, ByVal width As Integer) As OboutTextBox
        Dim obTextBox As New OboutTextBox()
        obTextBox.ID = Id
        obTextBox.Width = Unit.Percentage(width)
        obTextBox.TextMode = txtMode
        Return obTextBox
    End Function

    Protected Sub grid1_Filtering(ByVal sender As Object, ByVal e As EventArgs)
        ' filter for ShipName
        Dim shipNameColumn As Column = grid1.Columns.GetColumnByDataField("ShipName")
    
        If TypeOf shipNameColumn.FilterCriteria.[Option] Is CustomFilterOption Then
            Dim filterOption As CustomFilterOption = TryCast(shipNameColumn.FilterCriteria.[Option], CustomFilterOption)
        
            Select Case filterOption.ID
                Case "ShipNameStartsWith"
                    Dim shipNameStartsWith1 As String = shipNameColumn.FilterCriteria.Values("ShipNameStartsWith1").ToString()
                    Dim shipNameStartsWith2 As String = shipNameColumn.FilterCriteria.Values("ShipNameStartsWith2").ToString()
                    Dim filterExpression As String = ""
                    If Not String.IsNullOrEmpty(shipNameStartsWith1) Then
                        filterExpression = (shipNameColumn.DataField & " LIKE '") + shipNameStartsWith1 & "%'"
                    End If
                
                    If Not String.IsNullOrEmpty(shipNameStartsWith2) Then
                        If filterExpression <> "" Then
                            filterExpression += " OR "
                        End If
                        filterExpression += (shipNameColumn.DataField & " LIKE '") + shipNameStartsWith2 & "%'"
                    End If
                
                    shipNameColumn.FilterCriteria.FilterExpression = filterExpression
                
                    Exit Select
            End Select
        End If
    
        ' filter for OrderDate
        Dim orderDateColumn As Column = grid1.Columns.GetColumnByDataField("OrderDate")
    
        If TypeOf orderDateColumn.FilterCriteria.[Option] Is CustomFilterOption Then
            Dim filterOption As CustomFilterOption = TryCast(orderDateColumn.FilterCriteria.[Option], CustomFilterOption)
        
            Select Case filterOption.ID
                Case "Between_OrderDate"
                    Dim startDate As String = orderDateColumn.FilterCriteria.Values("StartDate_OrderDate").ToString()
                    Dim endDate As String = orderDateColumn.FilterCriteria.Values("EndDate_OrderDate").ToString()
                
                    If Not String.IsNullOrEmpty(startDate) AndAlso Not String.IsNullOrEmpty(endDate) Then
                        ' we filter between start date at 12:00AM and end date at 11:59PM
                        orderDateColumn.FilterCriteria.FilterExpression = ((("(" & orderDateColumn.DataField & " >= #") + startDate & " 12:00:00 AM# AND ") + orderDateColumn.DataField & " <= #") + endDate & " 11:59:59 PM#)"
                    End If
                    Exit Select
            
                Case "ByYear_OrderDate"
                    Dim year As String = orderDateColumn.FilterCriteria.Values("Year_OrderDate").ToString()
                    orderDateColumn.FilterCriteria.FilterExpression = ("CONVERT(" & orderDateColumn.DataField & ", 'System.String') LIKE '%/") + year & " %'"
                
                    Exit Select
            
                Case "ByMonth_OrderDate"
                    Dim month As String = orderDateColumn.FilterCriteria.Values("Month_OrderDate").ToString()
                    orderDateColumn.FilterCriteria.FilterExpression = ("CONVERT(" & orderDateColumn.DataField & ", 'System.String') LIKE '") + month & "/%'"
                
                    Exit Select
            
                Case "ByYearAndMonth_OrderDate"
                    Dim year2 As String = orderDateColumn.FilterCriteria.Values("YearMonth_Year_OrderDate").ToString()
                    Dim month2 As String = orderDateColumn.FilterCriteria.Values("YearMonth_Month_OrderDate").ToString()
                    orderDateColumn.FilterCriteria.FilterExpression = ((("(CONVERT(" & orderDateColumn.DataField & ", 'System.String') LIKE '") + month2 & "/%') AND (CONVERT(") + orderDateColumn.DataField & ", 'System.String') LIKE '%/") + year2 & " %')"
                    Exit Select
            End Select
        End If
    
    
        ' filter for ShipCountry
        Dim shipCountryColumn As Column = grid1.Columns.GetColumnByDataField("ShipCountry")
    
        If TypeOf shipCountryColumn.FilterCriteria.[Option] Is CustomFilterOption Then
            Dim filterOption As CustomFilterOption = TryCast(shipCountryColumn.FilterCriteria.[Option], CustomFilterOption)
        
            Select Case filterOption.ID
                Case "CountriesIn"
                    Dim countries As String = shipCountryColumn.FilterCriteria.Values("SelectedCountries").ToString()
                    shipCountryColumn.FilterCriteria.FilterExpression = (shipCountryColumn.DataField & " IN ('") + countries.Replace(",", "','") & "')"
                
                    Exit Select
            End Select
        End If
    
    
    
        ' filter for ShipCity
        Dim shipCityColumn As Column = grid1.Columns.GetColumnByDataField("ShipCity")
    
        If TypeOf shipCityColumn.FilterCriteria.[Option] Is CustomFilterOption Then
            Dim filterOption As CustomFilterOption = TryCast(shipCityColumn.FilterCriteria.[Option], CustomFilterOption)
        
            Select Case filterOption.ID
                Case "CitiesIn"
                    Dim cities As String = shipCityColumn.FilterCriteria.Values("TxtCities").ToString()
                    shipCityColumn.FilterCriteria.FilterExpression = (shipCityColumn.DataField & " IN ('") + cities.Replace(",", "','") & "')"
                
                    Exit Select
            End Select
        End If
    
    
    
        ' filter for Freight
        Dim freightColumn As Column = grid1.Columns.GetColumnByDataField("Freight")
    
        If TypeOf freightColumn.FilterCriteria.[Option] Is CustomFilterOption Then
            Dim filterOption As CustomFilterOption = TryCast(freightColumn.FilterCriteria.[Option], CustomFilterOption)
        
            Select Case filterOption.ID
                Case "FreightIsInInteral"
                    Dim freightInterval1 As Boolean = Boolean.Parse(freightColumn.FilterCriteria.Values("FreightInterval1").ToString())
                    Dim freightInterval2 As Boolean = Boolean.Parse(freightColumn.FilterCriteria.Values("FreightInterval2").ToString())
                    Dim freightInterval3 As Boolean = Boolean.Parse(freightColumn.FilterCriteria.Values("FreightInterval3").ToString())
                    Dim freightInterval4 As Boolean = Boolean.Parse(freightColumn.FilterCriteria.Values("FreightInterval4").ToString())
                
                    Dim convertedColumn As String = "CONVERT(" & freightColumn.DataField & ", 'System.Double')"
                    Dim freightFilterExpression As String = ""
                
                    If freightInterval1 Then
                        freightFilterExpression += ("(" & convertedColumn & " >= 0.00 AND ") + convertedColumn & " <= 49.99)"
                    End If
                
                    If freightInterval2 Then
                        If freightFilterExpression <> "" Then
                            freightFilterExpression += " OR "
                        End If
                    
                        freightFilterExpression += ("(" & convertedColumn & " >= 50.00 AND ") + convertedColumn & " <= 99.99)"
                    End If
                
                    If freightInterval3 Then
                        If freightFilterExpression <> "" Then
                            freightFilterExpression += " OR "
                        End If
                    
                        freightFilterExpression += ("(" & convertedColumn & " >= 100.00 AND ") + convertedColumn & " <= 150.00)"
                    End If
                
                    If freightInterval4 Then
                        If freightFilterExpression <> "" Then
                            freightFilterExpression += " OR "
                        End If
                    
                        freightFilterExpression += "(" & convertedColumn & " > 150.00)"
                    End If
                
                    If freightFilterExpression <> "" Then
                        freightColumn.FilterCriteria.FilterExpression = freightFilterExpression
                    End If
                
                    Exit Select
            End Select
        End If
    End Sub
</script>

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.floating
			{
			    float: left;
			    padding-right: 10px;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
			
			.separator
			{
			    width: 8%;
			    color: #000;
			    display:-moz-inline-stack;
                display:inline-block;
                zoom:1;
                *display:inline;
                text-align:center;
                top: -7px;
                position: relative;
                font-size: 10px;
                height: 5px;
			}
		</style>
		
		<script type="text/javascript">
		    function getDdlCountries() {
		        var controls = document.getElementsByTagName('SELECT');
		        for (var i = 0; i < controls.length; i++) {
		            if (controls[i].id.indexOf('DdlCountries') != -1) {
		                return controls[i];
		            }
		        }

		        return null;
		    }

		    function grid1_OnPopulatingFilterFields(sender, filterCriterias) {
		        var countriesDdl = getDdlCountries()
		        var countriesDdlValue = ',' + filterCriterias['ShipCountry'].Values[0] + ',';
		        for (var i = 0; i < countriesDdl.options.length; i++) {
		            if (countriesDdlValue.indexOf(',' + countriesDdl.options[i].value + ',') != -1) {
		                countriesDdl.options[i].selected = true;
		            }
		        }
		    }

		    function grid1_OnFiltering(sender, filterCriterias, isApplyingFilter) {
		        if (!isApplyingFilter) {
		            var countriesDdl = getDdlCountries();

		            // deselecting all the options
		            for (var i = 0; i < countriesDdl.options.length; i++) {
		                countriesDdl.options[i].selected = false;
		            }
		        } else {
		            var countriesDdl = getDdlCountries();
		            var selectedCountries = new Array();
		            // deselecting all the options
		            for (var i = 0; i < countriesDdl.options.length; i++) {
		                if (countriesDdl.options[i].selected) {
		                    selectedCountries.push(countriesDdl.options[i].value);
		                }
		            }

		            document.getElementById('SelectedCountries').value = selectedCountries.join(',');
		        }
		    }
		</script>
			
	</head>	
	
    <body>	
		<form id="Form1" runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Custom Filter Options with Templates</b></span>		
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">
		    The <b>CustomFilterOption</b> class allows you to create new filter options that are more advanced than the standard ones offered by the Grid.<br />
		    Each custom option may have a template applied to it and you can have a different template for each custom filter option. <br /><br />
		    You can use the <b>OnFiltering</b> server-side event to generate the appropriate filter expressions for each column, <br />
		    based on the values of the fields from the filter options templates.
		</span>
				
		<br /><br /><br />
		
		<a href="Default.aspx?type=NBNET">« Back to examples</a>
		
		</form>
	</body>
</html>