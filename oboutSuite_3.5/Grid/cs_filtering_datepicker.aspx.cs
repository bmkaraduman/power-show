using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;
using Obout.Interface;
using OboutInc.Calendar2;

public partial class Grid_cs_filtering_datepicker : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowFiltering = true;
        grid1.AllowAddingRecords = false;


        // creating the Templates
        //------------------------------------------------------------------------
        GridRuntimeTemplate tplOrderDate = new GridRuntimeTemplate();
        tplOrderDate.ID = "tplOrderDate";
        tplOrderDate.Template = new Obout.Grid.RuntimeTemplate();
        tplOrderDate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateOrderDateTemplate);
        tplOrderDate.ControlID = "txtOrderDate";
        //------------------------------------------------------------------------

        GridRuntimeTemplate tplShippedDate = new GridRuntimeTemplate();
        tplShippedDate.ID = "tplShippedDate";
        tplShippedDate.Template = new Obout.Grid.RuntimeTemplate();
        tplShippedDate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateShippedDateTemplate);
        tplShippedDate.ControlID = "txtShippedDate";
        //------------------------------------------------------------------------

        GridRuntimeTemplate tplRequiredDate = new GridRuntimeTemplate();
        tplRequiredDate.ID = "tplRequiredDate";
        tplRequiredDate.Template = new Obout.Grid.RuntimeTemplate();
        tplRequiredDate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateRequiredDateTemplate);
        tplRequiredDate.ControlID = "txtRequiredDate";
        //------------------------------------------------------------------------

        // adding the templates to the Templates collection
        grid1.Templates.Add(tplOrderDate);
        grid1.Templates.Add(tplShippedDate);
        grid1.Templates.Add(tplRequiredDate);


        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "SHIP NAME";
        oCol2.ShowFilterCriterias = false;
        oCol2.Width = "200";
    
        Column oCol3 = new Column();
        oCol3.DataField = "OrderDate";
        oCol3.HeaderText = "ORDER DATE";
        oCol3.DataFormatString="{0:M/d/yyyy}";
        oCol3.ShowFilterCriterias = false;
        oCol3.Width = "200";
        oCol3.TemplateSettings.FilterTemplateId = "tplOrderDate";

        Column oCol4 = new Column();
        oCol4.DataField = "ShippedDate";
        oCol4.HeaderText = "SHIPPED DATE";
        oCol4.DataFormatString = "{0:M/d/yyyy}";
        oCol4.ShowFilterCriterias = false;
        oCol4.Width = "200";
        oCol4.TemplateSettings.FilterTemplateId = "tplShippedDate";
        
        Column oCol5 = new Column();
        oCol5.DataField = "RequiredDate";
        oCol5.HeaderText = "REQUIRED DATE";
        oCol5.DataFormatString = "{0:M/d/yyyy}";
        oCol5.ShowFilterCriterias = false;
        oCol5.Width = "200";
        oCol5.TemplateSettings.FilterTemplateId = "tplRequiredDate";
      
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

    }

    public void CreateOrderDateTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(oPlaceHolder);
        oPlaceHolder.DataBinding += new EventHandler(DataBindOrderDateTemplate);
    }
    protected void DataBindOrderDateTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPlaceHolder = sender as PlaceHolder;
        Obout.Grid.TemplateContainer oContainer = oPlaceHolder.NamingContainer as Obout.Grid.TemplateContainer;

        Table oTable = new Table();
        oTable.CellPadding = 0;
        oTable.CellSpacing = 0;
        oTable.Attributes["width"] = "100%";

        TableRow oRow = new TableRow();

        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();
        oCell2.Attributes["width"] = "30";

        OboutTextBox oTextBox = new OboutTextBox();
        oTextBox.ID = "txtOrderDate";
        oTextBox.FolderStyle = "styles/premiere_blue/interface/OboutTextBox";
        oTextBox.Width = Unit.Percentage(100);

        oCell1.Controls.Add(oTextBox);

        OboutInc.Calendar2.Calendar cal1 = new OboutInc.Calendar2.Calendar();
        cal1.ID = "Calendar1";
        cal1.StyleFolder = "../calendar/styles/default";
        cal1.DatePickerMode = true;
        cal1.ShowYearSelector = true;
        cal1.DateMin = new DateTime(1990, 1, 1);
        cal1.DateMax = new DateTime(2015, 1, 1); 
        cal1.DateFormat = "M/d/yyyy";
        cal1.YearSelectorType = SelectorType.HtmlList;
        cal1.TitleText = "<span style='color:crimson'>Select year:</span> ";
        cal1.DatePickerImagePath = "../calendar/styles/icon2.gif";

        oCell2.Controls.Add(cal1);

        oRow.Cells.Add(oCell1);
        oRow.Cells.Add(oCell2);

        oTable.Rows.Add(oRow);

        oPlaceHolder.Controls.Add(oTable);

    }

    public void CreateShippedDateTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(oPlaceHolder);
        oPlaceHolder.DataBinding += new EventHandler(DataBindShippedDateTemplate);
    }
    protected void DataBindShippedDateTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPlaceHolder = sender as PlaceHolder;
        Obout.Grid.TemplateContainer oContainer = oPlaceHolder.NamingContainer as Obout.Grid.TemplateContainer;

        Table oTable = new Table();
        oTable.CellPadding = 0;
        oTable.CellSpacing = 0;
        oTable.Attributes["width"] = "100%";

        TableRow oRow = new TableRow();

        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();
        oCell2.Attributes["width"] = "30";

        OboutTextBox oTextBox = new OboutTextBox();
        oTextBox.ID = "txtShippedDate";
        oTextBox.FolderStyle = "styles/premiere_blue/interface/OboutTextBox";
        oTextBox.Width = Unit.Percentage(100);

        oCell1.Controls.Add(oTextBox);

        OboutInc.Calendar2.Calendar cal2 = new OboutInc.Calendar2.Calendar();
        cal2.ID = "Calendar2";
        cal2.StyleFolder = "../calendar/styles/default";
        cal2.DatePickerMode = true;
        cal2.ShowYearSelector = true;
        cal2.DateMin = new DateTime(1990, 1, 1);
        cal2.DateMax = new DateTime(2015, 1, 1); 
        cal2.DateFormat = "M/d/yyyy";
        cal2.YearSelectorType = SelectorType.HtmlList;
        cal2.TitleText = "<span style='color:crimson'>Select year:</span> ";
        cal2.DatePickerImagePath = "../calendar/styles/icon2.gif";

        oCell2.Controls.Add(cal2);

        oRow.Cells.Add(oCell1);
        oRow.Cells.Add(oCell2);

        oTable.Rows.Add(oRow);

        oPlaceHolder.Controls.Add(oTable);
    }

    public void CreateRequiredDateTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(oPlaceHolder);
        oPlaceHolder.DataBinding += new EventHandler(DataBindRequiredDateTemplate);
    }
    protected void DataBindRequiredDateTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPlaceHolder = sender as PlaceHolder;
        Obout.Grid.TemplateContainer oContainer = oPlaceHolder.NamingContainer as Obout.Grid.TemplateContainer;

        Table oTable = new Table();
        oTable.CellPadding = 0;
        oTable.CellSpacing = 0;
        oTable.Attributes["width"] = "100%";

        TableRow oRow = new TableRow();

        TableCell oCell1 = new TableCell();
        TableCell oCell2 = new TableCell();
        oCell2.Attributes["width"] = "30";

        OboutTextBox oTextBox = new OboutTextBox();
        oTextBox.ID = "txtRequiredDate";
        oTextBox.FolderStyle = "styles/premiere_blue/interface/OboutTextBox";
        oTextBox.Width = Unit.Percentage(100);

        oCell1.Controls.Add(oTextBox);

        OboutInc.Calendar2.Calendar cal3 = new OboutInc.Calendar2.Calendar();
        cal3.ID = "Calendar3";
        cal3.StyleFolder = "../calendar/styles/default";
        cal3.DatePickerMode = true;
        cal3.ShowYearSelector = true;
        cal3.DateMin = new DateTime(1990, 1, 1);
        cal3.DateMax = new DateTime(2015, 1, 1); 
        cal3.DateFormat = "M/d/yyyy";
        cal3.YearSelectorType = SelectorType.HtmlList;
        cal3.TitleText = "<span style='color:crimson'>Select year:</span> ";
        cal3.DatePickerImagePath = "../calendar/styles/icon2.gif";

        oCell2.Controls.Add(cal3);

        oRow.Cells.Add(oCell1);
        oRow.Cells.Add(oCell2);

        oTable.Rows.Add(oRow);

        oPlaceHolder.Controls.Add(oTable);
    }
}