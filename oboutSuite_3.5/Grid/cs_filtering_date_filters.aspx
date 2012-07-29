<%@ Page Language="C#" Debug="true" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script type="text/C#" runat="server">

    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.AllowPageSizeSelection = false;


        grid1.FolderStyle = "styles/black_glass";
        grid1.AllowFiltering = true;
        grid1.FilteringSettings.InitialState = GridFilterState.Visible;
        grid1.ShowLoadingMessage = false;


        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "125";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        //oCol2.Width = "200";

        Column oCol3 = new Column();
        oCol3.DataField = "OrderDate";
        oCol3.HeaderText = "ORDER DATE";
        oCol3.DataFormatString = "{0:M/d/yyyy}";
        oCol3.Width = "200";
        //oCol3.ShowFilterCriterias = false;


        Column oCol4 = new Column();
        oCol4.DataField = "ShippedDate";
        oCol4.HeaderText = "SHIPPED DATE";
        oCol4.DataFormatString = "{0:M/d/yyyy}";
        oCol4.Width = "200";
        //oCol4.ShowFilterCriterias = false;
        
        Column oCol5 = new Column();
        oCol5.DataField = "RequiredDate";
        oCol5.HeaderText = "REQUIRED DATE";
        oCol5.DataFormatString = "{0:M/d/yyyy}";
        oCol5.Width = "200";
        //oCol5.ShowFilterCriterias = false;


        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        
        grid1.Filtering+=new EventHandler(grid1_Filtering);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        
        grid1.DataSourceID = "sds1";
        
        CustomFilterOption Between_OrderDate = new CustomFilterOption();
        Between_OrderDate.ID = "Between_OrderDate";
        Between_OrderDate.Text = "Between";
        Between_OrderDate.IsDefault = true;
        Between_OrderDate.TemplateSettings.FilterControlsIds = "StartDate_OrderDate,EndDate_OrderDate";
        Between_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value,value";
        Between_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateBetweenFilter";

        CustomFilterOption ByYear_OrderDate = new CustomFilterOption();
        ByYear_OrderDate.ID = "ByYear_OrderDate";
        ByYear_OrderDate.Text = "Filter By Year";
        ByYear_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateByYearFilter";
        ByYear_OrderDate.TemplateSettings.FilterControlsIds = "Year_OrderDate";
        ByYear_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value";
        
        CustomFilterOption ByMonth_OrderDate = new CustomFilterOption();
        ByMonth_OrderDate.ID = "ByMonth_OrderDate";
        ByMonth_OrderDate.Text = "Filter By Month";
        ByMonth_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateByMonthFilter";
        ByMonth_OrderDate.TemplateSettings.FilterControlsIds = "Month_OrderDate";
        ByMonth_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value";
        
        CustomFilterOption ByYearAndMonth_OrderDate = new CustomFilterOption();
        ByYearAndMonth_OrderDate.ID = "ByYearAndMonth_OrderDate";
        ByYearAndMonth_OrderDate.Text = "Filter By Year And Month";
        ByYearAndMonth_OrderDate.TemplateSettings.FilterTemplateId = "OrderDateByYearAndMonthFilter";
        ByYearAndMonth_OrderDate.TemplateSettings.FilterControlsIds = "YearMonth_Year_OrderDate,YearMonth_Month_OrderDate";
        ByYearAndMonth_OrderDate.TemplateSettings.FilterControlsPropertyNames = "value,value";

        CustomFilterOption Between_ShippedDate = new CustomFilterOption();
        Between_ShippedDate.ID = "Between_ShippedDate";
        Between_ShippedDate.Text = "Between";
        Between_ShippedDate.IsDefault = true;
        Between_ShippedDate.TemplateSettings.FilterControlsIds = "StartDate_ShippedDate,EndDate_ShippedDate";
        Between_ShippedDate.TemplateSettings.FilterControlsPropertyNames = "value,value";
        Between_ShippedDate.TemplateSettings.FilterTemplateId = "ShippedDateBetweenFilter";

        CustomFilterOption ByYear_ShippedDate = new CustomFilterOption();
        ByYear_ShippedDate.ID = "ByYear_ShippedDate";
        ByYear_ShippedDate.Text = "Filter By Year";
        ByYear_ShippedDate.TemplateSettings.FilterTemplateId = "ShippedDateByYearFilter";
        ByYear_ShippedDate.TemplateSettings.FilterControlsIds = "Year_ShippedDate";
        ByYear_ShippedDate.TemplateSettings.FilterControlsPropertyNames = "value";

        CustomFilterOption ByMonth_ShippedDate = new CustomFilterOption();
        ByMonth_ShippedDate.ID = "ByMonth_ShippedDate";
        ByMonth_ShippedDate.Text = "Filter By Month";
        ByMonth_ShippedDate.TemplateSettings.FilterTemplateId = "ShippedDateByMonthFilter";
        ByMonth_ShippedDate.TemplateSettings.FilterControlsIds = "Month_ShippedDate";
        ByMonth_ShippedDate.TemplateSettings.FilterControlsPropertyNames = "value";

        CustomFilterOption ByYearAndMonth_ShippedDate = new CustomFilterOption();
        ByYearAndMonth_ShippedDate.ID = "ByYearAndMonth_ShippedDate";
        ByYearAndMonth_ShippedDate.Text = "Filter By Year And Month";
        ByYearAndMonth_ShippedDate.TemplateSettings.FilterTemplateId = "ShippedDateByYearAndMonthFilter";
        ByYearAndMonth_ShippedDate.TemplateSettings.FilterControlsIds = "YearMonth_Year_ShippedDate,YearMonth_Month_ShippedDate";
        ByYearAndMonth_ShippedDate.TemplateSettings.FilterControlsPropertyNames = "value,value";

        CustomFilterOption Between_RequiredDate = new CustomFilterOption();
        Between_RequiredDate.ID = "Between_RequiredDate";
        Between_RequiredDate.Text = "Between";
        Between_RequiredDate.IsDefault = true;
        Between_RequiredDate.TemplateSettings.FilterControlsIds = "StartDate_RequiredDate,EndDate_RequiredDate";
        Between_RequiredDate.TemplateSettings.FilterControlsPropertyNames = "value,value";
        Between_RequiredDate.TemplateSettings.FilterTemplateId = "RequiredDateBetweenFilter";

        CustomFilterOption ByYear_RequiredDate = new CustomFilterOption();
        ByYear_RequiredDate.ID = "ByYear_RequiredDate";
        ByYear_RequiredDate.Text = "Filter By Year";
        ByYear_RequiredDate.TemplateSettings.FilterTemplateId = "RequiredDateByYearFilter";
        ByYear_RequiredDate.TemplateSettings.FilterControlsIds = "Year_RequiredDate";
        ByYear_RequiredDate.TemplateSettings.FilterControlsPropertyNames = "value";

        CustomFilterOption ByMonth_RequiredDate = new CustomFilterOption();
        ByMonth_RequiredDate.ID = "ByMonth_RequiredDate";
        ByMonth_RequiredDate.Text = "Filter By Month";
        ByMonth_RequiredDate.TemplateSettings.FilterTemplateId = "RequiredDateByMonthFilter";
        ByMonth_RequiredDate.TemplateSettings.FilterControlsIds = "Month_RequiredDate";
        ByMonth_RequiredDate.TemplateSettings.FilterControlsPropertyNames = "value";

        CustomFilterOption ByYearAndMonth_RequiredDate = new CustomFilterOption();
        ByYearAndMonth_RequiredDate.ID = "ByYearAndMonth_RequiredDate";
        ByYearAndMonth_RequiredDate.Text = "Filter By Year And Month";
        ByYearAndMonth_RequiredDate.TemplateSettings.FilterTemplateId = "RequiredDateByYearAndMonthFilter";
        ByYearAndMonth_RequiredDate.TemplateSettings.FilterControlsIds = "YearMonth_Year_RequiredDate,YearMonth_Month_RequiredDate";
        ByYearAndMonth_RequiredDate.TemplateSettings.FilterControlsPropertyNames = "value,value";


        oCol3.FilterCriteria.Option.Type = FilterOptionType.Custom;
        oCol3.FilterOptions.Add(Between_OrderDate);
        oCol3.FilterOptions.Add(ByYear_OrderDate);
        oCol3.FilterOptions.Add(ByMonth_OrderDate);
        oCol3.FilterOptions.Add(ByYearAndMonth_OrderDate);
        
        oCol4.FilterCriteria.Option.Type = FilterOptionType.Custom;
        oCol4.FilterOptions.Add(Between_ShippedDate);
        oCol4.FilterOptions.Add(ByYear_ShippedDate);
        oCol4.FilterOptions.Add(ByMonth_ShippedDate);
        oCol4.FilterOptions.Add(ByYearAndMonth_ShippedDate);
        
        oCol5.FilterCriteria.Option.Type = FilterOptionType.Custom;
        oCol5.FilterOptions.Add(Between_RequiredDate);
        oCol5.FilterOptions.Add(ByYear_RequiredDate);
        oCol5.FilterOptions.Add(ByMonth_RequiredDate);
        oCol5.FilterOptions.Add(ByYearAndMonth_RequiredDate);
        

        //Create Filter templates.....

        GridRuntimeTemplate OrderDateByYearAndMonthFilter = new GridRuntimeTemplate();
        OrderDateByYearAndMonthFilter.ID = "OrderDateByYearAndMonthFilter";
        OrderDateByYearAndMonthFilter.Template = new Obout.Grid.RuntimeTemplate();
        OrderDateByYearAndMonthFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateOrderDateByYearAndMonthFilterTemplate);

        GridRuntimeTemplate OrderDateBetweenFilter = new GridRuntimeTemplate();
        OrderDateBetweenFilter.ID = "OrderDateBetweenFilter";
        OrderDateBetweenFilter.Template = new Obout.Grid.RuntimeTemplate();
        OrderDateBetweenFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateOrderDateBetweenFilterTemplate);

        GridRuntimeTemplate OrderDateByMonthFilter = new GridRuntimeTemplate();
        OrderDateByMonthFilter.ID = "OrderDateByMonthFilter";
        OrderDateByMonthFilter.Template = new Obout.Grid.RuntimeTemplate();
        OrderDateByMonthFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateOrderDateByMonthFilterTemplate);

        GridRuntimeTemplate OrderDateByYearFilter = new GridRuntimeTemplate();
        OrderDateByYearFilter.ID = "OrderDateByYearFilter";
        OrderDateByYearFilter.Template = new Obout.Grid.RuntimeTemplate();
        OrderDateByYearFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateOrderDateByYearFilterTemplate);

        //...............

        GridRuntimeTemplate ShippedDateByYearAndMonthFilter = new GridRuntimeTemplate();
        ShippedDateByYearAndMonthFilter.ID = "ShippedDateByYearAndMonthFilter";
        ShippedDateByYearAndMonthFilter.Template = new Obout.Grid.RuntimeTemplate();
        ShippedDateByYearAndMonthFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateShippedDateByYearAndMonthFilterTemplate);

        GridRuntimeTemplate ShippedDateBetweenFilter = new GridRuntimeTemplate();
        ShippedDateBetweenFilter.ID = "ShippedDateBetweenFilter";
        ShippedDateBetweenFilter.Template = new Obout.Grid.RuntimeTemplate();
        ShippedDateBetweenFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateShippedDateBetweenFilterTemplate);

        GridRuntimeTemplate ShippedDateByMonthFilter = new GridRuntimeTemplate();
        ShippedDateByMonthFilter.ID = "ShippedDateByMonthFilter";
        ShippedDateByMonthFilter.Template = new Obout.Grid.RuntimeTemplate();
        ShippedDateByMonthFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateShippedDateByMonthFilterTemplate);

        GridRuntimeTemplate ShippedDateByYearFilter = new GridRuntimeTemplate();
        ShippedDateByYearFilter.ID = "ShippedDateByYearFilter";
        ShippedDateByYearFilter.Template = new Obout.Grid.RuntimeTemplate();
        ShippedDateByYearFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateShippedDateByYearFilterTemplate);


        GridRuntimeTemplate RequiredDateByYearAndMonthFilter = new GridRuntimeTemplate();
        RequiredDateByYearAndMonthFilter.ID = "RequiredDateByYearAndMonthFilter";
        RequiredDateByYearAndMonthFilter.Template = new Obout.Grid.RuntimeTemplate();
        RequiredDateByYearAndMonthFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateRequiredDateByYearAndMonthFilterTemplate);
        
        GridRuntimeTemplate RequiredDateBetweenFilter = new GridRuntimeTemplate();
        RequiredDateBetweenFilter.ID = "RequiredDateBetweenFilter";
        RequiredDateBetweenFilter.Template = new Obout.Grid.RuntimeTemplate();
        RequiredDateBetweenFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateRequiredDateBetweenFilterTemplate);

        GridRuntimeTemplate RequiredDateByMonthFilter = new GridRuntimeTemplate();
        RequiredDateByMonthFilter.ID = "RequiredDateByMonthFilter";
        RequiredDateByMonthFilter.Template = new Obout.Grid.RuntimeTemplate();
        RequiredDateByMonthFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateRequiredDateByMonthFilterTemplate);

        GridRuntimeTemplate RequiredDateByYearFilter = new GridRuntimeTemplate();
        RequiredDateByYearFilter.ID = "RequiredDateByYearFilter";
        RequiredDateByYearFilter.Template = new Obout.Grid.RuntimeTemplate();
        RequiredDateByYearFilter.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateRequiredDateByYearFilterTemplate);


        grid1.Templates.Add(OrderDateBetweenFilter);
        grid1.Templates.Add(OrderDateByMonthFilter);
        grid1.Templates.Add(OrderDateByYearFilter);
        grid1.Templates.Add(OrderDateByYearAndMonthFilter);

        grid1.Templates.Add(ShippedDateBetweenFilter);
        grid1.Templates.Add(ShippedDateByMonthFilter);
        grid1.Templates.Add(ShippedDateByYearFilter);
        grid1.Templates.Add(ShippedDateByYearAndMonthFilter);

        grid1.Templates.Add(RequiredDateBetweenFilter);
        grid1.Templates.Add(RequiredDateByMonthFilter);
        grid1.Templates.Add(RequiredDateByYearFilter);
        grid1.Templates.Add(RequiredDateByYearAndMonthFilter);
        
                    
        
        
        if (!Page.IsPostBack)
        {
            FilterCriteria criteria1 = new FilterCriteria();
            // use "Between" filter option (with index 0 in FilterOptions collection)
            CustomFilterOption option1 = grid1.Columns[2].FilterOptions[0] as CustomFilterOption;

            criteria1.Option = option1;
            criteria1.Values = new Hashtable();
            criteria1.Values["StartDate_OrderDate"] = "1/1/1994";
            criteria1.Values["EndDate_OrderDate"] = "10/1/1994";

            grid1.Columns[2].FilterCriteria = criteria1;



            FilterCriteria criteria2 = new FilterCriteria();
            // use "Filter By Year And Month" filter option (with index 3 in FilterOptions collection)
            CustomFilterOption option2= grid1.Columns[3].FilterOptions[3] as CustomFilterOption;

            criteria2.Option = option2;
            criteria2.Values = new Hashtable();
            criteria2.Values["YearMonth_Year_ShippedDate"] = "1994";
            criteria2.Values["YearMonth_Month_ShippedDate"] = "9";

            grid1.Columns[3].FilterCriteria = criteria2;



            FilterCriteria criteria3= new FilterCriteria();
            // use "Filter By Month" filter option (with index 2 in FilterOptions collection)
            CustomFilterOption option3 = grid1.Columns[4].FilterOptions[2] as CustomFilterOption;

            criteria3.Option = option3;
            criteria3.Values = new Hashtable();
            criteria3.Values["Month_RequiredDate"] = "10";

            grid1.Columns[4].FilterCriteria = criteria3;
        }
    }

    // Creating templates.....

    public void CreateOrderDateByYearAndMonthFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindOrderDateByYearAndMonthFilterTemplate);
    }

    public void CreateOrderDateByMonthFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindOrderDateByMonthFilterTemplate);
    }

    public void CreateOrderDateByYearFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindOrderDateByYearFilterTemplate);
    }
    
    public void CreateOrderDateBetweenFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindOrderDateBetweenFilterTemplate);
    }

    //.....................
    
    public void CreateShippedDateByYearAndMonthFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindShippedDateByYearAndMonthFilterTemplate);
    }

    public void CreateShippedDateByMonthFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindShippedDateByMonthFilterTemplate);
    }

    public void CreateShippedDateByYearFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindShippedDateByYearFilterTemplate);
    }

    public void CreateShippedDateBetweenFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindShippedDateBetweenFilterTemplate);
    }
//...................................
    
    public void CreateRequiredDateByYearAndMonthFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindRequiredDateByYearAndMonthFilterTemplate);
    }

    public void CreateRequiredDateByMonthFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindRequiredDateByMonthFilterTemplate);
    }

    public void CreateRequiredDateByYearFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindRequiredDateByYearFilterTemplate);
    }

    public void CreateRequiredDateBetweenFilterTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhOdate = new PlaceHolder();
        e.Container.Controls.Add(oPhOdate);
        oPhOdate.DataBinding += new EventHandler(DataBindRequiredDateBetweenFilterTemplate);
    }
    
    // DataBind in Templates...

    protected void DataBindOrderDateBetweenFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateBetween = sender as PlaceHolder;
        HtmlGenericControl divContainer = CreateDiv("tdText", "");
        divContainer.Controls.Add(CreateTextBox("StartDate_OrderDate", TextBoxMode.SingleLine, 45));
        divContainer.Controls.Add(CreateDiv("separator", "-"));
        divContainer.Controls.Add(CreateTextBox("EndDate_OrderDate", TextBoxMode.SingleLine, 45));

        oPhOdateBetween.Controls.Add(divContainer);

    }

    protected void DataBindOrderDateByYearFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateByYear = sender as PlaceHolder;
        DropDownList ddlYear = CreateYearDDL("Year_OrderDate", 100);
        oPhOdateByYear.Controls.Add(ddlYear);
    }

    protected void DataBindOrderDateByMonthFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateByYear = sender as PlaceHolder;
        DropDownList ddlMonth = CreateMonthDDL("Month_OrderDate", 100);
        oPhOdateByYear.Controls.Add(ddlMonth);
    }

    protected void DataBindOrderDateByYearAndMonthFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateByYear = sender as PlaceHolder;
        HtmlGenericControl divContainer = CreateDiv("", "");
        DropDownList ddlYear = CreateYearDDL("YearMonth_Year_OrderDate", 49);
        DropDownList ddlMonth = CreateMonthDDL("YearMonth_Month_OrderDate", 49);
        divContainer.Controls.Add(ddlYear);
        divContainer.Controls.Add(ddlMonth);
        oPhOdateByYear.Controls.Add(divContainer);
    }
    
  //.......................

    protected void DataBindShippedDateBetweenFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateBetween = sender as PlaceHolder;
        HtmlGenericControl divContainer = CreateDiv("tdText", "");
        divContainer.Controls.Add(CreateTextBox("StartDate_ShippedDate", TextBoxMode.SingleLine, 45));
        divContainer.Controls.Add(CreateDiv("separator", "-"));
        divContainer.Controls.Add(CreateTextBox("EndDate_ShippedDate", TextBoxMode.SingleLine, 45));

        oPhOdateBetween.Controls.Add(divContainer);

    }
    
    protected void DataBindShippedDateByYearFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateByYear = sender as PlaceHolder;
        DropDownList ddlYear = CreateYearDDL("Year_ShippedDate", 100);
        oPhOdateByYear.Controls.Add(ddlYear);
    }

    protected void DataBindShippedDateByMonthFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateByYear = sender as PlaceHolder;
        DropDownList ddlMonth = CreateMonthDDL("Month_ShippedDate", 100);
        oPhOdateByYear.Controls.Add(ddlMonth);
    }

    protected void DataBindShippedDateByYearAndMonthFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateByYear = sender as PlaceHolder;
        HtmlGenericControl divContainer = CreateDiv("", "");
        DropDownList ddlYear = CreateYearDDL("YearMonth_Year_ShippedDate", 49);
        DropDownList ddlMonth = CreateMonthDDL("YearMonth_Month_ShippedDate", 49);
        divContainer.Controls.Add(ddlYear);
        divContainer.Controls.Add(ddlMonth);
        oPhOdateByYear.Controls.Add(divContainer);
    }

//..............
    protected void DataBindRequiredDateBetweenFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateBetween = sender as PlaceHolder;
        HtmlGenericControl divContainer = CreateDiv("tdText", "");
        divContainer.Controls.Add(CreateTextBox("StartDate_RequiredDate", TextBoxMode.SingleLine, 45));
        divContainer.Controls.Add(CreateDiv("separator", "-"));
        divContainer.Controls.Add(CreateTextBox("EndDate_RequiredDate", TextBoxMode.SingleLine, 45));

        oPhOdateBetween.Controls.Add(divContainer);

    }
    protected void DataBindRequiredDateByYearFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateByYear = sender as PlaceHolder;
        DropDownList ddlYear = CreateYearDDL("Year_RequiredDate", 100);
        oPhOdateByYear.Controls.Add(ddlYear);
    }

    protected void DataBindRequiredDateByMonthFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateByYear = sender as PlaceHolder;
        DropDownList ddlMonth = CreateMonthDDL("Month_RequiredDate", 100);
        oPhOdateByYear.Controls.Add(ddlMonth);
    }

    protected void DataBindRequiredDateByYearAndMonthFilterTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhOdateByYear = sender as PlaceHolder;
        HtmlGenericControl divContainer = CreateDiv("", "");
        DropDownList ddlYear = CreateYearDDL("YearMonth_Year_RequiredDate", 49);
        DropDownList ddlMonth = CreateMonthDDL("YearMonth_Month_RequiredDate", 49);
        divContainer.Controls.Add(ddlYear);
        divContainer.Controls.Add(ddlMonth);
        oPhOdateByYear.Controls.Add(divContainer);
    }

    protected OboutDropDownList CreateYearDDL(string id, int width)
    {
        OboutDropDownList ddlYear = new OboutDropDownList();
        ddlYear.ID = id;
        ddlYear.Width = Unit.Percentage(width);
        ddlYear.Height = Unit.Pixel(150);
        for (int i = 1994; i <= 2010; i++)
        {
            ddlYear.Items.Add(new ListItem(i.ToString()));
        }
        return ddlYear;
    }

    protected OboutDropDownList CreateMonthDDL(string id, int width)
    {
        OboutDropDownList ddlMonth = new OboutDropDownList();
        ddlMonth.ID = id;
        ddlMonth.Height = Unit.Pixel(150);
        ddlMonth.Width = Unit.Percentage(width);
        System.Globalization.DateTimeFormatInfo dateFormatinfo = new System.Globalization.DateTimeFormatInfo();
        for (int i = 1; i <= 12; i++)
        {
            ddlMonth.Items.Add(new ListItem(dateFormatinfo.GetMonthName(i), i.ToString()));
        }

        return ddlMonth;
    }

    protected HtmlGenericControl CreateDiv(string className, string innerHTML)
    {
        HtmlGenericControl obDiv = new HtmlGenericControl("DIV");
        obDiv.Attributes.Add("class", className);
        obDiv.InnerHtml = innerHTML;

        return obDiv;
    }

    protected OboutTextBox CreateTextBox(string Id, TextBoxMode txtMode, int width)
    {
        OboutTextBox obTextBox = new OboutTextBox();
        obTextBox.ID = Id;
        obTextBox.Width = Unit.Percentage(width);
        obTextBox.TextMode = txtMode;
        return obTextBox;
    }
    
    protected void grid1_Filtering(object sender, EventArgs e)
    {
        // filter for OrderDate
        Column orderDateColumn = grid1.Columns[2];

        if (orderDateColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = orderDateColumn.FilterCriteria.Option as CustomFilterOption;
            
            switch (filterOption.ID)
            {
                case "Between_OrderDate":
                    string startDate = orderDateColumn.FilterCriteria.Values["StartDate_OrderDate"].ToString();
                    string endDate = orderDateColumn.FilterCriteria.Values["EndDate_OrderDate"].ToString();

                    if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
                    {
                        // we filter between start date at 12:00AM and end date at 11:59PM
                        orderDateColumn.FilterCriteria.FilterExpression = "(" + orderDateColumn.DataField + " >= #" + startDate + " 12:00:00 AM# AND " + orderDateColumn.DataField + " <= #" + endDate + " 11:59:59 PM#)";
                    }
                    break;

                case "ByYear_OrderDate":
                    string year = orderDateColumn.FilterCriteria.Values["Year_OrderDate"].ToString();
                    orderDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '%/" + year + " %'";
                    
                    break;

                case "ByMonth_OrderDate":
                    string month = orderDateColumn.FilterCriteria.Values["Month_OrderDate"].ToString();
                    orderDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '" + month + "/%'";

                    break;

                case "ByYearAndMonth_OrderDate":
                    string year2 = orderDateColumn.FilterCriteria.Values["YearMonth_Year_OrderDate"].ToString();
                    string month2 = orderDateColumn.FilterCriteria.Values["YearMonth_Month_OrderDate"].ToString();
                    orderDateColumn.FilterCriteria.FilterExpression = "(CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '" + month2 + "/%') AND (CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '%/" + year2 + " %')";
                    break;
            }
        }



        // filter for ShippedDate
        Column shippedDateColumn = grid1.Columns[3];

        if (shippedDateColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = shippedDateColumn.FilterCriteria.Option as CustomFilterOption;

            switch (filterOption.ID)
            {
                case "Between_ShippedDate":
                    string startDate = shippedDateColumn.FilterCriteria.Values["StartDate_ShippedDate"].ToString();
                    string endDate = shippedDateColumn.FilterCriteria.Values["EndDate_ShippedDate"].ToString();

                    if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
                    {
                        // we filter between start date at 12:00AM and end date at 11:59PM
                        shippedDateColumn.FilterCriteria.FilterExpression = "(" + shippedDateColumn.DataField + " >= #" + startDate + " 12:00:00 AM# AND " + shippedDateColumn.DataField + " <= #" + endDate + " 11:59:59 PM#)";
                    }
                    break;

                case "ByYear_ShippedDate":
                    string year = shippedDateColumn.FilterCriteria.Values["Year_ShippedDate"].ToString();
                    shippedDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + shippedDateColumn.DataField + ", 'System.String') LIKE '%/" + year + " %'";

                    break;

                case "ByMonth_ShippedDate":
                    string month = shippedDateColumn.FilterCriteria.Values["Month_ShippedDate"].ToString();
                    shippedDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + shippedDateColumn.DataField + ", 'System.String') LIKE '" + month + "/%'";

                    break;

                case "ByYearAndMonth_ShippedDate":
                    string year2 = shippedDateColumn.FilterCriteria.Values["YearMonth_Year_ShippedDate"].ToString();
                    string month2 = shippedDateColumn.FilterCriteria.Values["YearMonth_Month_ShippedDate"].ToString();
                    shippedDateColumn.FilterCriteria.FilterExpression = "(CONVERT(" + shippedDateColumn.DataField + ", 'System.String') LIKE '" + month2 + "/%') AND (CONVERT(" + shippedDateColumn.DataField + ", 'System.String') LIKE '%/" + year2 + " %')";
                    break;
            }
        }



        // filter for RequiredDate
        Column requiredDateColumn = grid1.Columns[4];

        if (requiredDateColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = requiredDateColumn.FilterCriteria.Option as CustomFilterOption;

            switch (filterOption.ID)
            {
                case "Between_RequiredDate":
                    string startDate = requiredDateColumn.FilterCriteria.Values["StartDate_RequiredDate"].ToString();
                    string endDate = requiredDateColumn.FilterCriteria.Values["EndDate_RequiredDate"].ToString();

                    if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
                    {
                        // we filter between start date at 12:00AM and end date at 11:59PM
                        requiredDateColumn.FilterCriteria.FilterExpression = "(" + requiredDateColumn.DataField + " >= #" + startDate + " 12:00:00 AM# AND " + requiredDateColumn.DataField + " <= #" + endDate + " 11:59:59 PM#)";
                    }
                    break;

                case "ByYear_RequiredDate":
                    string year = requiredDateColumn.FilterCriteria.Values["Year_RequiredDate"].ToString();
                    requiredDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + requiredDateColumn.DataField + ", 'System.String') LIKE '%/" + year + " %'";

                    break;

                case "ByMonth_RequiredDate":
                    string month = requiredDateColumn.FilterCriteria.Values["Month_RequiredDate"].ToString();
                    requiredDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + requiredDateColumn.DataField + ", 'System.String') LIKE '" + month + "/%'";

                    break;

                case "ByYearAndMonth_RequiredDate":
                    string year2 = requiredDateColumn.FilterCriteria.Values["YearMonth_Year_RequiredDate"].ToString();
                    string month2 = requiredDateColumn.FilterCriteria.Values["YearMonth_Month_RequiredDate"].ToString();
                    requiredDateColumn.FilterCriteria.FilterExpression = "(CONVERT(" + requiredDateColumn.DataField + ", 'System.String') LIKE '" + month2 + "/%') AND (CONVERT(" + requiredDateColumn.DataField + ", 'System.String') LIKE '%/" + year2 + " %')";
                    break;
            }
        }
    }
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
			
	</head>	<body>	
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