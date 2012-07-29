using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_customization_extra_heading : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.FolderStyle = "styles/black_glass";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
     
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "SHIP NAME";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "SHIP CITY";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "SHIP COUNTRY";

        GridRuntimeTemplate HeadingTemplate = new GridRuntimeTemplate();
        HeadingTemplate.ID = "HeadingTemplate1";
        HeadingTemplate.Template = new Obout.Grid.RuntimeTemplate();
        HeadingTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateHeadingTemplate);
        //------------------------------------------------------------------------

         grid1.Templates.Add(HeadingTemplate);
          
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.TemplateSettings.HeadingTemplateId = "HeadingTemplate1";

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

    }

    public void CreateHeadingTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindHeadingTemplate);
    }
    protected void DataBindHeadingTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "Orders List";
    }
    
}