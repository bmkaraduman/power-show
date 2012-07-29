using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;
using Obout.Grid;
using System.Data;
using System.Data.OleDb;

public partial class ListBox_cs_integration_grid : System.Web.UI.Page
{
    private Grid grid1;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        grid1 = new Grid();
        grid1.ID = "grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;
        grid1.ClientSideEvents.OnBeforeClientDelete = "Grid1_BeforeDelete";
        grid1.ClientSideEvents. ExposeSender = true;

        GridRuntimeTemplate TemplateEditCountry = new GridRuntimeTemplate();
		TemplateEditCountry.ID = "Template1";
		TemplateEditCountry.Template = new Obout.Grid.RuntimeTemplate();
        TemplateEditCountry.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditCountryTemplate);
        TemplateEditCountry.ControlID = "ListBox1";
		TemplateEditCountry.ControlPropertyName = "value";
		TemplateEditCountry.UseQuotes = true;

        grid1.Templates.Add(TemplateEditCountry);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;
        oCol1.HeaderText = "ORDER ID";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";

        oCol5.TemplateSettings.EditTemplateId = "Template1";

        Column oCol6 = new Column();
        oCol6.AllowEdit = true;
        oCol6.AllowDelete = true;

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);

        Grid1Container.Controls.Add(grid1);        
    }

    public void CreateEditCountryTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPlaceHolder = new PlaceHolder();
        e.Container.Controls.Add(oPlaceHolder);
       
        Obout.ListBox.ListBox ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Height = 100;
        ListBox1.Width = Unit.Percentage(100);
        ListBox1.DataSourceID = "SqlDataSource2";
        ListBox1.DataTextField = "CountryName";
        ListBox1.DataValueField = "CountryName";
        ListBox1.AppendDataBoundItems = false;

        oPlaceHolder.Controls.Add(ListBox1);
    }

    
  }
