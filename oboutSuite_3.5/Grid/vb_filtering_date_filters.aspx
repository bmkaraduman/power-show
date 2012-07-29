<%@ Page Language="VB" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script runat="server">

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
        oCol3.DataField = "OrderDate"
        oCol3.HeaderText = "ORDER DATE"
        oCol3.DataFormatString = "{0:M/d/yyyy}"
        oCol3.Width = "200"
        'oCol3.ShowFilterCriterias = false;
    
    
        Dim oCol4 As New Column()
        oCol4.DataField = "ShippedDate"
        oCol4.HeaderText = "SHIPPED DATE"
        oCol4.DataFormatString = "{0:M/d/yyyy}"
        oCol4.Width = "200"
        'oCol4.ShowFilterCriterias = false;
    
        Dim oCol5 As New Column()
        oCol5.DataField = "RequiredDate"
        oCol5.HeaderText = "REQUIRED DATE"
        oCol5.DataFormatString = "{0:M/d/yyyy}"
        oCol5.Width = "200"
        'oCol5.ShowFilterCriterias = false;
    
    
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
    
        AddHandler grid1.Filtering, AddressOf grid1_Filtering
    
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    
        grid1.DataSourceID = "sds1"
    
        Dim Between_OrderDate As New CustomFilterOption()
        Between_OrderDate.ID = "Between_OrderDate"
        Between_OrderDate.Text = "Between"
        Between_OrderDate.IsDefault = True
        Between_OrderDate.TemplateSettings.FilterControlsIds = "StartDate_OrderDate,EndDate_OrderDate"
        Between_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value,value"
        Between_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateBetweenFilter"
    
        Dim ByYear_OrderDate As New CustomFilterOption()
        ByYear_OrderDate.ID = "ByYear_OrderDate"
        ByYear_OrderDate.Text = "Filter By Year"
        ByYear_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateByYearFilter"
        ByYear_OrderDate.TemplateSettings.FilterControlsIds = "Year_OrderDate"
        ByYear_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value"
    
        Dim ByMonth_OrderDate As New CustomFilterOption()
        ByMonth_OrderDate.ID = "ByMonth_OrderDate"
        ByMonth_OrderDate.Text = "Filter By Month"
        ByMonth_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateByMonthFilter"
        ByMonth_OrderDate.TemplateSettings.FilterControlsIds = "Month_OrderDate"
        ByMonth_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value"
    
        Dim ByYearAndMonth_OrderDate As New CustomFilterOption()
        ByYearAndMonth_OrderDate.ID = "ByYearAndMonth_OrderDate"
        ByYearAndMonth_OrderDate.Text = "Filter By Year And Month"
        ByYearAndMonth_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateByYearAndMonthFilter"
        ByYearAndMonth_OrderDate.TemplateSettings.FilterControlsIds = "YearMonth_Year_OrderDate,YearMonth_Month_OrderDate"
        ByYearAndMonth_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value,value"
    
        Dim Between_ShippedDate As New CustomFilterOption()
        Between_ShippedDate.ID = "Between_ShippedDate"
        Between_ShippedDate.Text = "Between"
        Between_ShippedDate.IsDefault = True
        Between_ShippedDate.TemplateSettings.FilterControlsIds = "StartDate_ShippedDate,EndDate_ShippedDate"
        Between_ShippedDate.TemplateSettings.FilterControlsPropertyNames = "value,value"
        Between_ShippedDate.TemplateSettings.FilterTemplateId = "ShippedDateBetweenFilter"
    
        Dim ByYear_ShippedDate As New CustomFilterOption()
        ByYear_ShippedDate.ID = "ByYear_ShippedDate"
        ByYear_ShippedDate.Text = "Filter By Year"
        ByYear_ShippedDate.TemplateSettings.FilterTemplateId = "ShippedDateByYearFilter"
        ByYear_ShippedDate.TemplateSettings.FilterControlsIds = "Year_ShippedDate"
        ByYear_ShippedDate.TemplateSettings.FilterControlsPropertyNames = "value"
    
        Dim ByMonth_ShippedDate As New CustomFilterOption()
        ByMonth_ShippedDate.ID = "ByMonth_ShippedDate"
        ByMonth_ShippedDate.Text = "Filter By Month"
        ByMonth_ShippedDate.TemplateSettings.FilterTemplateId = "ShippedDateByMonthFilter"
        ByMonth_ShippedDate.TemplateSettings.FilterControlsIds = "Month_ShippedDate"
        ByMonth_ShippedDate.TemplateSettings.FilterControlsPropertyNames = "value"
    
        Dim ByYearAndMonth_ShippedDate As New CustomFilterOption()
        ByYearAndMonth_ShippedDate.ID = "ByYearAndMonth_ShippedDate"
        ByYearAndMonth_ShippedDate.Text = "Filter By Year And Month"
        ByYearAndMonth_ShippedDate.TemplateSettings.FilterTemplateId = "ShippedDateByYearAndMonthFilter"
        ByYearAndMonth_ShippedDate.TemplateSettings.FilterControlsIds = "YearMonth_Year_ShippedDate,YearMonth_Month_ShippedDate"
        ByYearAndMonth_ShippedDate.TemplateSettings.FilterControlsPropertyNames = "value,value"
    
        Dim Between_RequiredDate As New CustomFilterOption()
        Between_RequiredDate.ID = "Between_RequiredDate"
        Between_RequiredDate.Text = "Between"
        Between_RequiredDate.IsDefault = True
        Between_RequiredDate.TemplateSettings.FilterControlsIds = "StartDate_RequiredDate,EndDate_RequiredDate"
        Between_RequiredDate.TemplateSettings.FilterControlsPropertyNames = "value,value"
        Between_RequiredDate.TemplateSettings.FilterTemplateId = "RequiredDateBetweenFilter"
    
        Dim ByYear_RequiredDate As New CustomFilterOption()
        ByYear_RequiredDate.ID = "ByYear_RequiredDate"
        ByYear_RequiredDate.Text = "Filter By Year"
        ByYear_RequiredDate.TemplateSettings.FilterTemplateId = "RequiredDateByYearFilter"
        ByYear_RequiredDate.TemplateSettings.FilterControlsIds = "Year_RequiredDate"
        ByYear_RequiredDate.TemplateSettings.FilterControlsPropertyNames = "value"
    
        Dim ByMonth_RequiredDate As New CustomFilterOption()
        ByMonth_RequiredDate.ID = "ByMonth_RequiredDate"
        ByMonth_RequiredDate.Text = "Filter By Month"
        ByMonth_RequiredDate.TemplateSettings.FilterTemplateId = "RequiredDateByMonthFilter"
        ByMonth_RequiredDate.TemplateSettings.FilterControlsIds = "Month_RequiredDate"
        ByMonth_RequiredDate.TemplateSettings.FilterControlsPropertyNames = "value"
    
        Dim ByYearAndMonth_RequiredDate As New CustomFilterOption()
        ByYearAndMonth_RequiredDate.ID = "ByYearAndMonth_RequiredDate"
        ByYearAndMonth_RequiredDate.Text = "Filter By Year And Month"
        ByYearAndMonth_RequiredDate.TemplateSettings.FilterTemplateId = "RequiredDateByYearAndMonthFilter"
        ByYearAndMonth_RequiredDate.TemplateSettings.FilterControlsIds = "YearMonth_Year_RequiredDate,YearMonth_Month_RequiredDate"
        ByYearAndMonth_RequiredDate.TemplateSettings.FilterControlsPropertyNames = "value,value"
    
    
        oCol3.FilterCriteria.[Option].Type = FilterOptionType.[Custom]
        oCol3.FilterOptions.Add(Between_OrderDate)
        oCol3.FilterOptions.Add(ByYear_OrderDate)
        oCol3.FilterOptions.Add(ByMonth_OrderDate)
        oCol3.FilterOptions.Add(ByYearAndMonth_OrderDate)
    
        oCol4.FilterCriteria.[Option].Type = FilterOptionType.[Custom]
        oCol4.FilterOptions.Add(Between_ShippedDate)
        oCol4.FilterOptions.Add(ByYear_ShippedDate)
        oCol4.FilterOptions.Add(ByMonth_ShippedDate)
        oCol4.FilterOptions.Add(ByYearAndMonth_ShippedDate)
    
        oCol5.FilterCriteria.[Option].Type = FilterOptionType.[Custom]
        oCol5.FilterOptions.Add(Between_RequiredDate)
        oCol5.FilterOptions.Add(ByYear_RequiredDate)
        oCol5.FilterOptions.Add(ByMonth_RequiredDate)
        oCol5.FilterOptions.Add(ByYearAndMonth_RequiredDate)
    
    
        'Create Filter templates.....
    
        Dim OrderDateByYearAndMonthFilter As New GridRuntimeTemplate()
        OrderDateByYearAndMonthFilter.ID = "OrderDateByYearAndMonthFilter"
        OrderDateByYearAndMonthFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler OrderDateByYearAndMonthFilter.Template.CreateTemplate, AddressOf CreateOrderDateByYearAndMonthFilterTemplate
    
        Dim OrderDateBetweenFilter As New GridRuntimeTemplate()
        OrderDateBetweenFilter.ID = "OrderDateBetweenFilter"
        OrderDateBetweenFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler OrderDateBetweenFilter.Template.CreateTemplate, AddressOf CreateOrderDateBetweenFilterTemplate
    
        Dim OrderDateByMonthFilter As New GridRuntimeTemplate()
        OrderDateByMonthFilter.ID = "OrderDateByMonthFilter"
        OrderDateByMonthFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler OrderDateByMonthFilter.Template.CreateTemplate, AddressOf CreateOrderDateByMonthFilterTemplate
    
        Dim OrderDateByYearFilter As New GridRuntimeTemplate()
        OrderDateByYearFilter.ID = "OrderDateByYearFilter"
        OrderDateByYearFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler OrderDateByYearFilter.Template.CreateTemplate, AddressOf CreateOrderDateByYearFilterTemplate
    
        '...............
    
        Dim ShippedDateByYearAndMonthFilter As New GridRuntimeTemplate()
        ShippedDateByYearAndMonthFilter.ID = "ShippedDateByYearAndMonthFilter"
        ShippedDateByYearAndMonthFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler ShippedDateByYearAndMonthFilter.Template.CreateTemplate, AddressOf CreateShippedDateByYearAndMonthFilterTemplate
    
        Dim ShippedDateBetweenFilter As New GridRuntimeTemplate()
        ShippedDateBetweenFilter.ID = "ShippedDateBetweenFilter"
        ShippedDateBetweenFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler ShippedDateBetweenFilter.Template.CreateTemplate, AddressOf CreateShippedDateBetweenFilterTemplate
    
        Dim ShippedDateByMonthFilter As New GridRuntimeTemplate()
        ShippedDateByMonthFilter.ID = "ShippedDateByMonthFilter"
        ShippedDateByMonthFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler ShippedDateByMonthFilter.Template.CreateTemplate, AddressOf CreateShippedDateByMonthFilterTemplate
    
        Dim ShippedDateByYearFilter As New GridRuntimeTemplate()
        ShippedDateByYearFilter.ID = "ShippedDateByYearFilter"
        ShippedDateByYearFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler ShippedDateByYearFilter.Template.CreateTemplate, AddressOf CreateShippedDateByYearFilterTemplate
    
    
        Dim RequiredDateByYearAndMonthFilter As New GridRuntimeTemplate()
        RequiredDateByYearAndMonthFilter.ID = "RequiredDateByYearAndMonthFilter"
        RequiredDateByYearAndMonthFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler RequiredDateByYearAndMonthFilter.Template.CreateTemplate, AddressOf CreateRequiredDateByYearAndMonthFilterTemplate
    
        Dim RequiredDateBetweenFilter As New GridRuntimeTemplate()
        RequiredDateBetweenFilter.ID = "RequiredDateBetweenFilter"
        RequiredDateBetweenFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler RequiredDateBetweenFilter.Template.CreateTemplate, AddressOf CreateRequiredDateBetweenFilterTemplate
    
        Dim RequiredDateByMonthFilter As New GridRuntimeTemplate()
        RequiredDateByMonthFilter.ID = "RequiredDateByMonthFilter"
        RequiredDateByMonthFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler RequiredDateByMonthFilter.Template.CreateTemplate, AddressOf CreateRequiredDateByMonthFilterTemplate
    
        Dim RequiredDateByYearFilter As New GridRuntimeTemplate()
        RequiredDateByYearFilter.ID = "RequiredDateByYearFilter"
        RequiredDateByYearFilter.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler RequiredDateByYearFilter.Template.CreateTemplate, AddressOf CreateRequiredDateByYearFilterTemplate
    
    
        grid1.Templates.Add(OrderDateBetweenFilter)
        grid1.Templates.Add(OrderDateByMonthFilter)
        grid1.Templates.Add(OrderDateByYearFilter)
        grid1.Templates.Add(OrderDateByYearAndMonthFilter)
    
        grid1.Templates.Add(ShippedDateBetweenFilter)
        grid1.Templates.Add(ShippedDateByMonthFilter)
        grid1.Templates.Add(ShippedDateByYearFilter)
        grid1.Templates.Add(ShippedDateByYearAndMonthFilter)
    
        grid1.Templates.Add(RequiredDateBetweenFilter)
        grid1.Templates.Add(RequiredDateByMonthFilter)
        grid1.Templates.Add(RequiredDateByYearFilter)
        grid1.Templates.Add(RequiredDateByYearAndMonthFilter)
    
    
    
    
        If Not Page.IsPostBack Then
            Dim criteria1 As New FilterCriteria()
            ' use "Between" filter option (with index 0 in FilterOptions collection)
            Dim option1 As CustomFilterOption = TryCast(grid1.Columns(2).FilterOptions(0), CustomFilterOption)
        
            criteria1.[Option] = option1
            criteria1.Values = New Hashtable()
            criteria1.Values("StartDate_OrderDate") = "1/1/1994"
            criteria1.Values("EndDate_OrderDate") = "10/1/1994"
        
            grid1.Columns(2).FilterCriteria = criteria1
        
        
        
            Dim criteria2 As New FilterCriteria()
            ' use "Filter By Year And Month" filter option (with index 3 in FilterOptions collection)
            Dim option2 As CustomFilterOption = TryCast(grid1.Columns(3).FilterOptions(3), CustomFilterOption)
        
            criteria2.[Option] = option2
            criteria2.Values = New Hashtable()
            criteria2.Values("YearMonth_Year_ShippedDate") = "1994"
            criteria2.Values("YearMonth_Month_ShippedDate") = "9"
        
            grid1.Columns(3).FilterCriteria = criteria2
        
        
        
            Dim criteria3 As New FilterCriteria()
            ' use "Filter By Month" filter option (with index 2 in FilterOptions collection)
            Dim option3 As CustomFilterOption = TryCast(grid1.Columns(4).FilterOptions(2), CustomFilterOption)
        
            criteria3.[Option] = option3
            criteria3.Values = New Hashtable()
            criteria3.Values("Month_RequiredDate") = "10"
        
            grid1.Columns(4).FilterCriteria = criteria3
        End If
    End Sub

    ' Creating templates.....

    Public Sub CreateOrderDateByYearAndMonthFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindOrderDateByYearAndMonthFilterTemplate
    End Sub

    Public Sub CreateOrderDateByMonthFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindOrderDateByMonthFilterTemplate
    End Sub

    Public Sub CreateOrderDateByYearFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindOrderDateByYearFilterTemplate
    End Sub

    Public Sub CreateOrderDateBetweenFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindOrderDateBetweenFilterTemplate
    End Sub

    '.....................

    Public Sub CreateShippedDateByYearAndMonthFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindShippedDateByYearAndMonthFilterTemplate
    End Sub

    Public Sub CreateShippedDateByMonthFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindShippedDateByMonthFilterTemplate
    End Sub

    Public Sub CreateShippedDateByYearFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindShippedDateByYearFilterTemplate
    End Sub

    Public Sub CreateShippedDateBetweenFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindShippedDateBetweenFilterTemplate
    End Sub
    '...................................

    Public Sub CreateRequiredDateByYearAndMonthFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindRequiredDateByYearAndMonthFilterTemplate
    End Sub

    Public Sub CreateRequiredDateByMonthFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindRequiredDateByMonthFilterTemplate
    End Sub

    Public Sub CreateRequiredDateByYearFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindRequiredDateByYearFilterTemplate
    End Sub

    Public Sub CreateRequiredDateBetweenFilterTemplate(ByVal sender As [Object], ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhOdate As New PlaceHolder()
        e.Container.Controls.Add(oPhOdate)
        AddHandler oPhOdate.DataBinding, AddressOf DataBindRequiredDateBetweenFilterTemplate
    End Sub

    ' DataBind in Templates...

    Protected Sub DataBindOrderDateBetweenFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateBetween As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim divContainer As HtmlGenericControl = CreateDiv("tdText", "")
        divContainer.Controls.Add(CreateTextBox("StartDate_OrderDate", TextBoxMode.SingleLine, 45))
        divContainer.Controls.Add(CreateDiv("separator", "-"))
        divContainer.Controls.Add(CreateTextBox("EndDate_OrderDate", TextBoxMode.SingleLine, 45))
    
        
        oPhOdateBetween.Controls.Add(divContainer)
    End Sub

    Protected Sub DataBindOrderDateByYearFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim ddlYear As DropDownList = CreateYearDDL("Year_OrderDate", 100)
        oPhOdateByYear.Controls.Add(ddlYear)
    End Sub

    Protected Sub DataBindOrderDateByMonthFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim ddlMonth As DropDownList = CreateMonthDDL("Month_OrderDate", 100)
        oPhOdateByYear.Controls.Add(ddlMonth)
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

    '.......................

    Protected Sub DataBindShippedDateBetweenFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateBetween As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim divContainer As HtmlGenericControl = CreateDiv("tdText", "")
        divContainer.Controls.Add(CreateTextBox("StartDate_ShippedDate", TextBoxMode.SingleLine, 45))
        divContainer.Controls.Add(CreateDiv("separator", "-"))
        divContainer.Controls.Add(CreateTextBox("EndDate_ShippedDate", TextBoxMode.SingleLine, 45))
    
        
        oPhOdateBetween.Controls.Add(divContainer)
    End Sub

    Protected Sub DataBindShippedDateByYearFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim ddlYear As DropDownList = CreateYearDDL("Year_ShippedDate", 100)
        oPhOdateByYear.Controls.Add(ddlYear)
    End Sub

    Protected Sub DataBindShippedDateByMonthFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim ddlMonth As DropDownList = CreateMonthDDL("Month_ShippedDate", 100)
        oPhOdateByYear.Controls.Add(ddlMonth)
    End Sub

    Protected Sub DataBindShippedDateByYearAndMonthFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim divContainer As HtmlGenericControl = CreateDiv("", "")
        Dim ddlYear As DropDownList = CreateYearDDL("YearMonth_Year_ShippedDate", 49)
        Dim ddlMonth As DropDownList = CreateMonthDDL("YearMonth_Month_ShippedDate", 49)
        divContainer.Controls.Add(ddlYear)
        divContainer.Controls.Add(ddlMonth)
        oPhOdateByYear.Controls.Add(divContainer)
    End Sub

    '..............
    Protected Sub DataBindRequiredDateBetweenFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateBetween As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim divContainer As HtmlGenericControl = CreateDiv("tdText", "")
        divContainer.Controls.Add(CreateTextBox("StartDate_RequiredDate", TextBoxMode.SingleLine, 45))
        divContainer.Controls.Add(CreateDiv("separator", "-"))
        divContainer.Controls.Add(CreateTextBox("EndDate_RequiredDate", TextBoxMode.SingleLine, 45))
    
        
        oPhOdateBetween.Controls.Add(divContainer)
    End Sub
    Protected Sub DataBindRequiredDateByYearFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim ddlYear As DropDownList = CreateYearDDL("Year_RequiredDate", 100)
        oPhOdateByYear.Controls.Add(ddlYear)
    End Sub

    Protected Sub DataBindRequiredDateByMonthFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim ddlMonth As DropDownList = CreateMonthDDL("Month_RequiredDate", 100)
        oPhOdateByYear.Controls.Add(ddlMonth)
    End Sub

    Protected Sub DataBindRequiredDateByYearAndMonthFilterTemplate(ByVal sender As [Object], ByVal e As EventArgs)
        Dim oPhOdateByYear As PlaceHolder = TryCast(sender, PlaceHolder)
        Dim divContainer As HtmlGenericControl = CreateDiv("", "")
        Dim ddlYear As DropDownList = CreateYearDDL("YearMonth_Year_RequiredDate", 49)
        Dim ddlMonth As DropDownList = CreateMonthDDL("YearMonth_Month_RequiredDate", 49)
        divContainer.Controls.Add(ddlYear)
        divContainer.Controls.Add(ddlMonth)
        oPhOdateByYear.Controls.Add(divContainer)
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
        Dim dateFormatinfo As New System.Globalization.DateTimeFormatInfo()
        For i As Integer = 1 To 12
            ddlMonth.Items.Add(New ListItem(dateFormatinfo.GetMonthName(i), i.ToString()))
        Next
    
        Return ddlMonth
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
        ' filter for OrderDate
        Dim orderDateColumn As Column = grid1.Columns(2)
    
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
    
    
    
        ' filter for ShippedDate
        Dim shippedDateColumn As Column = grid1.Columns(3)
    
        If TypeOf shippedDateColumn.FilterCriteria.[Option] Is CustomFilterOption Then
            Dim filterOption As CustomFilterOption = TryCast(shippedDateColumn.FilterCriteria.[Option], CustomFilterOption)
        
            Select Case filterOption.ID
                Case "Between_ShippedDate"
                    Dim startDate As String = shippedDateColumn.FilterCriteria.Values("StartDate_ShippedDate").ToString()
                    Dim endDate As String = shippedDateColumn.FilterCriteria.Values("EndDate_ShippedDate").ToString()
                
                    If Not String.IsNullOrEmpty(startDate) AndAlso Not String.IsNullOrEmpty(endDate) Then
                        ' we filter between start date at 12:00AM and end date at 11:59PM
                        shippedDateColumn.FilterCriteria.FilterExpression = ((("(" & shippedDateColumn.DataField & " >= #") + startDate & " 12:00:00 AM# AND ") + shippedDateColumn.DataField & " <= #") + endDate & " 11:59:59 PM#)"
                    End If
                    Exit Select
            
                Case "ByYear_ShippedDate"
                    Dim year As String = shippedDateColumn.FilterCriteria.Values("Year_ShippedDate").ToString()
                    shippedDateColumn.FilterCriteria.FilterExpression = ("CONVERT(" & shippedDateColumn.DataField & ", 'System.String') LIKE '%/") + year & " %'"
                
                    Exit Select
            
                Case "ByMonth_ShippedDate"
                    Dim month As String = shippedDateColumn.FilterCriteria.Values("Month_ShippedDate").ToString()
                    shippedDateColumn.FilterCriteria.FilterExpression = ("CONVERT(" & shippedDateColumn.DataField & ", 'System.String') LIKE '") + month & "/%'"
                
                    Exit Select
            
                Case "ByYearAndMonth_ShippedDate"
                    Dim year2 As String = shippedDateColumn.FilterCriteria.Values("YearMonth_Year_ShippedDate").ToString()
                    Dim month2 As String = shippedDateColumn.FilterCriteria.Values("YearMonth_Month_ShippedDate").ToString()
                    shippedDateColumn.FilterCriteria.FilterExpression = ((("(CONVERT(" & shippedDateColumn.DataField & ", 'System.String') LIKE '") + month2 & "/%') AND (CONVERT(") + shippedDateColumn.DataField & ", 'System.String') LIKE '%/") + year2 & " %')"
                    Exit Select
            End Select
        End If
    
    
    
        ' filter for RequiredDate
        Dim requiredDateColumn As Column = grid1.Columns(4)
    
        If TypeOf requiredDateColumn.FilterCriteria.[Option] Is CustomFilterOption Then
            Dim filterOption As CustomFilterOption = TryCast(requiredDateColumn.FilterCriteria.[Option], CustomFilterOption)
        
            Select Case filterOption.ID
                Case "Between_RequiredDate"
                    Dim startDate As String = requiredDateColumn.FilterCriteria.Values("StartDate_RequiredDate").ToString()
                    Dim endDate As String = requiredDateColumn.FilterCriteria.Values("EndDate_RequiredDate").ToString()
                
                    If Not String.IsNullOrEmpty(startDate) AndAlso Not String.IsNullOrEmpty(endDate) Then
                        ' we filter between start date at 12:00AM and end date at 11:59PM
                        requiredDateColumn.FilterCriteria.FilterExpression = ((("(" & requiredDateColumn.DataField & " >= #") + startDate & " 12:00:00 AM# AND ") + requiredDateColumn.DataField & " <= #") + endDate & " 11:59:59 PM#)"
                    End If
                    Exit Select
            
                Case "ByYear_RequiredDate"
                    Dim year As String = requiredDateColumn.FilterCriteria.Values("Year_RequiredDate").ToString()
                    requiredDateColumn.FilterCriteria.FilterExpression = ("CONVERT(" & requiredDateColumn.DataField & ", 'System.String') LIKE '%/") + year & " %'"
                
                    Exit Select
            
                Case "ByMonth_RequiredDate"
                    Dim month As String = requiredDateColumn.FilterCriteria.Values("Month_RequiredDate").ToString()
                    requiredDateColumn.FilterCriteria.FilterExpression = ("CONVERT(" & requiredDateColumn.DataField & ", 'System.String') LIKE '") + month & "/%'"
                
                    Exit Select
            
                Case "ByYearAndMonth_RequiredDate"
                    Dim year2 As String = requiredDateColumn.FilterCriteria.Values("YearMonth_Year_RequiredDate").ToString()
                    Dim month2 As String = requiredDateColumn.FilterCriteria.Values("YearMonth_Month_RequiredDate").ToString()
                    requiredDateColumn.FilterCriteria.FilterExpression = ((("(CONVERT(" & requiredDateColumn.DataField & ", 'System.String') LIKE '") + month2 & "/%') AND (CONVERT(") + requiredDateColumn.DataField & ", 'System.String') LIKE '%/") + year2 & " %')"
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

	</head>	
	<body>	
		<form id="Form1" runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Date Filters</b></span>		
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">
		    The <b>CustomFilterOption</b> class allows you to create new filter options that are more advanced than the standard ones offered by the Grid.<br />
		    Each custom option may have a template applied to it and you can have a different template for each custom filter option. <br /><br />
		    You can use the <b>OnFiltering</b> server-side event to generate the appropriate filter expressions for each column, <br />
		    based on the values of the fields from the filter options templates.<br /><br />
		    In this example we have created four custom filter options for each date column.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>