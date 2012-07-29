using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_filtering_live : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "sds1";
        grid1.AutoGenerateColumns = false;
        grid1.CallbackMode = true;
        grid1.AllowAddingRecords = false;
        grid1.Serialize = true;
        grid1.AllowFiltering = true;
        grid1.ShowLoadingMessage = false;
        grid1.AllowPageSizeSelection = false;

        grid1.FilteringSettings.InitialState = GridFilterState.Visible;
        grid1.FilteringSettings.FilterPosition = GridFilterPosition.Top;
		
		
		// creating the Templates				
		//------------------------------------------------------------------------
		GridRuntimeTemplate NameFilter = new GridRuntimeTemplate();
        NameFilter.ID = "NameFilter";
        NameFilter.Template = new Obout.Grid.RuntimeTemplate();
        NameFilter.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateNameFilter);
        NameFilter.ControlID = "Name";

		//------------------------------------------------------------------------
		//------------------------------------------------------------------------
		GridRuntimeTemplate CityFilter = new GridRuntimeTemplate();
		CityFilter.ID = "CityFilter";
		CityFilter.Template = new Obout.Grid.RuntimeTemplate();
		CityFilter.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCityFilter);
        CityFilter.ControlID = "City";
		//------------------------------------------------------------------------
		//------------------------------------------------------------------------
		GridRuntimeTemplate ZipFilter = new GridRuntimeTemplate();
		ZipFilter.ID = "ZipFilter";
		ZipFilter.Template = new Obout.Grid.RuntimeTemplate();
		ZipFilter.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateZipFilter);
        ZipFilter.ControlID = "Zip";
		//------------------------------------------------------------------------
        //------------------------------------------------------------------------
        GridRuntimeTemplate CountryFilter = new GridRuntimeTemplate();
        CountryFilter.ID = "CountryFilter";
        CountryFilter.Template = new Obout.Grid.RuntimeTemplate();
        CountryFilter.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCountryFilter);
        CountryFilter.ControlID = "Country";
        //------------------------------------------------------------------------

        		
		// adding the templates to the Templates collection
		grid1.Templates.Add(NameFilter);
		grid1.Templates.Add(CityFilter);
		grid1.Templates.Add(ZipFilter);
        grid1.Templates.Add(CountryFilter);
		
								
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "OrderID";
		oCol1.Visible = false;
		oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

		Column oCol2 = new Column();
		oCol2.DataField = "ShipName";
		oCol2.HeaderText = "NAME";
		oCol2.Width = "200";
        oCol2.TemplateSettings.FilterTemplateId = "NameFilter";
        oCol2.ShowFilterCriterias = false;

        FilterOption NameFilterOption = new FilterOption();
        NameFilterOption.Type = FilterOptionType.StartsWith;
        NameFilterOption.IsDefault = true;

        oCol2.FilterOptions.Add(NameFilterOption);

		Column oCol3 = new Column();
		oCol3.DataField = "ShipCity";
		oCol3.HeaderText = "CITY";
		oCol3.Width = "150";
		oCol3.TemplateSettings.FilterTemplateId = "CityFilter";
        oCol3.ShowFilterCriterias = false;

        FilterOption CityFilterOption = new FilterOption();
        CityFilterOption.Type = FilterOptionType.StartsWith;
        CityFilterOption.IsDefault = true;

        oCol3.FilterOptions.Add(CityFilterOption);

		Column oCol4 = new Column();
		oCol4.DataField = "ShipPostalCode";
		oCol4.HeaderText = "POSTAL CODE";
		oCol4.Width = "150";
        oCol4.TemplateSettings.FilterTemplateId = "ZipFilter";
        oCol4.ShowFilterCriterias = false;

        FilterOption ZipFilterOption = new FilterOption();
        ZipFilterOption.Type = FilterOptionType.StartsWith;
        ZipFilterOption.IsDefault = true;

        oCol4.FilterOptions.Add(ZipFilterOption);

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "150";
        oCol5.TemplateSettings.FilterTemplateId = "CountryFilter";
        oCol5.ShowFilterCriterias = false;

        FilterOption CountryFilterOption = new FilterOption();
        CountryFilterOption.Type = FilterOptionType.StartsWith;
        CountryFilterOption.IsDefault = true;

        oCol5.FilterOptions.Add(CountryFilterOption);

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);  
        
        // add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1);
		
	}

	// Create the methods that will load the data into the templates	
	//------------------------------------------------------------------------
    public void CreateNameFilter(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
        PlaceHolder templatePlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(templatePlaceHolder);

        Obout.Interface.OboutTextBox textbox = new Obout.Interface.OboutTextBox();
        textbox.ID = "Name";
        textbox.Width = Unit.Percentage(100);
        textbox.ClientSideEvents.OnKeyUp = "applyFilter";

        templatePlaceHolder.Controls.Add(textbox);
	}
 
	//------------------------------------------------------------------------

	//------------------------------------------------------------------------
    public void CreateCityFilter(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
        PlaceHolder templatePlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(templatePlaceHolder);

        Obout.Interface.OboutTextBox textbox = new Obout.Interface.OboutTextBox();
        textbox.ID = "City";
        textbox.Width = Unit.Percentage(100);
        textbox.ClientSideEvents.OnKeyUp = "applyFilter";

        templatePlaceHolder.Controls.Add(textbox);
	}
	//------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateZipFilter(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder templatePlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(templatePlaceHolder);

        Obout.Interface.OboutTextBox textbox = new Obout.Interface.OboutTextBox();
        textbox.ID = "Zip";
        textbox.Width = Unit.Percentage(100);
        textbox.ClientSideEvents.OnKeyUp = "applyFilter";

        templatePlaceHolder.Controls.Add(textbox);
    }
    //------------------------------------------------------------------------
    
	//------------------------------------------------------------------------
    public void CreateCountryFilter(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
        PlaceHolder templatePlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(templatePlaceHolder);

        Obout.Interface.OboutTextBox textbox = new Obout.Interface.OboutTextBox();
        textbox.ID = "Country";
        textbox.Width = Unit.Percentage(100);
        textbox.ClientSideEvents.OnKeyUp = "applyFilter";

        templatePlaceHolder.Controls.Add(textbox);
	}

}