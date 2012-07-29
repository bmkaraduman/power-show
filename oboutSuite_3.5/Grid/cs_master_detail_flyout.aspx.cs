using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;

public partial class Grid_cs_commands_add_position : System.Web.UI.Page
{
    Grid grid1 = new Grid();
    DetailGrid grid2 = new DetailGrid();
    DetailGrid grid3 = new DetailGrid();

    protected void Page_Load(object sender, EventArgs e)
    {
        // Creating grid1
        grid1.ID = "grid1";
        grid1.AutoGenerateColumns = false;
        grid1.DataSourceID = "sds1";
        grid1.FolderStyle = "styles/black_glass";
        grid1.AllowAddingRecords = false;

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;

        // creating the template for the Company name column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate Template1 = new GridRuntimeTemplate();
        Template1.ID = "Template1";
        Template1.Template = new Obout.Grid.RuntimeTemplate();
        Template1.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateTemplate1);
        //------------------------------------------------------------------------

        GridRuntimeTemplate Template2 = new GridRuntimeTemplate();
        Template2.ID = "Template2";
        Template2.Template = new Obout.Grid.RuntimeTemplate();
        Template2.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateTemplate2);
        //------------------------------------------------------------------------
    
        GridRuntimeTemplate Template3 = new GridRuntimeTemplate();
        Template3.ID = "Template3";
        Template3.Template = new Obout.Grid.RuntimeTemplate();
        Template3.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateTemplate3);
        //------------------------------------------------------------------------

        grid1.Templates.Add(Template1);
        grid2.Templates.Add(Template2);
        grid3.Templates.Add(Template3);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "CustomerID";
        oCol1.HeaderText = "CUSTOMER ID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";

        Column oCol3 = new Column();
        oCol3.DataField = "ContactName";
        oCol3.HeaderText = "CONTACT NAME";

        Column oCol4 = new Column();
        oCol4.DataField = "Country";
        oCol4.HeaderText = "COUNTRY";

        Column oCol5 = new Column();
        oCol5.HeaderText = "INFO";
        oCol5.Width = "115";
        oCol5.TemplateSettings.TemplateId = "Template1";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // Creating grid2
        grid2.ID = "grid2";
        grid2.AutoGenerateColumns = false;
        grid2.FolderStyle = "styles/black_glass";
        grid2.AllowAddingRecords = false;
        grid2.ShowFooter = true;
        grid2.AllowPageSizeSelection = false;
        grid2.DataSourceID = "sds2";
        grid2.ForeignKeys = "CustomerID";
        grid2.AllowPaging = false;
                
        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;

        
        // creating the columns
        Column oCol2_1 = new Column();
        oCol2_1.DataField = "CustomerID";
        oCol2_1.HeaderText = "CUSTOMER ID";
        oCol2_1.Visible = false;
        oCol2_1.ReadOnly = true;

        Column oCol2_2 = new Column();
        oCol2_2.DataField = "OrderID";
        oCol2_2.HeaderText = "ORDER ID";
        oCol2_2.Visible = false;
        oCol2_1.ReadOnly = true;

        Column oCol2_3 = new Column();
        oCol2_3.DataField = "OrderDate";
        oCol2_3.HeaderText = "ORDER DATE";
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}";
        oCol2_3.Width="220";

        Column oCol2_4 = new Column();
        oCol2_4.DataField = "ShippedDate";
        oCol2_4.HeaderText = "SHIPPED DATE";
        oCol2_4.DataFormatString = "{0:MM/dd/yyyy}";
        
        Column oCol2_5 = new Column();
        oCol2_5.DataField = "Freight";
        oCol2_5.HeaderText = "FREIGHT";
        oCol2_5.DataFormatString = "{0:C2}";

        Column oCol2_6 = new Column();
        oCol2_6.HeaderText = "INFO";
        oCol2_6.Width="115";
        oCol2_6.TemplateSettings.TemplateId = "Template2";

        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1);
        grid2.Columns.Add(oCol2_2);
        grid2.Columns.Add(oCol2_3);
        grid2.Columns.Add(oCol2_4);
        grid2.Columns.Add(oCol2_5);
        grid2.Columns.Add(oCol2_6);

        grid1.DetailGrids.Add(grid2);

                                          
        // Creating grid3
        grid3.ID = "grid3";
        grid3.AutoGenerateColumns = false;
        grid3.FolderStyle = "styles/black_glass";
        grid3.AllowAddingRecords = false;
        grid3.ShowFooter = true;
        grid3.AllowPageSizeSelection = false;
        grid3.DataSourceID = "sds3";
        grid3.ForeignKeys = "OrderID";
        grid3.AllowPaging = false;


        // creating the columns
        Column oCol3_1 = new Column();
        oCol3_1.DataField = "OrderID";
        oCol3_1.HeaderText = "ORDER ID";
        oCol3_1.Visible = false;
        oCol3_1.ReadOnly = true;

        Column oCol3_2 = new Column();
        oCol3_2.DataField = "ProductID";
        oCol3_2.HeaderText = "PRODUCT ID";
        oCol3_2.Visible = false;
        oCol3_2.ReadOnly = true;

        Column oCol3_3 = new Column();
        oCol3_3.DataField = "UnitPrice";
        oCol3_3.HeaderText = "UNIT PRICE";
        oCol3_3.DataFormatString = "{0:C2}";
        oCol3_3.Width = "180";

        Column oCol3_4 = new Column();
        oCol3_4.DataField = "Quantity";
        oCol3_4.HeaderText = "QUANTITY";
        oCol3_4.Width = "185";

        Column oCol3_5 = new Column();
        oCol3_5.DataField = "Discount";
        oCol3_5.HeaderText = "DISCOUNT";
        oCol3_5.DataFormatString = "{0:F2}%";
        oCol3_5.Width = "175";

        Column oCol3_6 = new Column();
        oCol3_6.HeaderText = "INFO";
        oCol3_6.Width = "115";
        oCol3_6.TemplateSettings.TemplateId = "Template3";

        // add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1);
        grid3.Columns.Add(oCol3_2);
        grid3.Columns.Add(oCol3_3);
        grid3.Columns.Add(oCol3_4);
        grid3.Columns.Add(oCol3_5);
        grid3.Columns.Add(oCol3_6);

        grid2.DetailGrids.Add(grid3);


        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
    }
    public void CreateTemplate1(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindTemplate1);
    }
    protected void DataBindTemplate1(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<span class=\"tdTextLink\" id=\"grid_link1_" + oContainer.DataItem["CustomerID"] + "\" onmouseover=\"attachFlyout1ToLink(grid1, this, " + oContainer.PageRecordIndex.ToString() + ") \" onmouseout=\"closeFlyout1()\">More info...</span>";
           
    }
    //------------------------------------------------------------------------

    public void CreateTemplate2(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindTemplate2);
    }
    protected void DataBindTemplate2(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<span class=\"tdTextLink\" id=\"grid_link2_" + oContainer.DataItem["OrderID"] + "\" onmouseover=\"attachFlyout2ToLink(" + oContainer.GridClientID.ToString() + ", this," + oContainer.PageRecordIndex.ToString() + ") \" onmouseout=\"closeFlyout2()\">More info...</span>";
    }
    //------------------------------------------------------------------------
    public void CreateTemplate3(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindTemplate3);
    }
    protected void DataBindTemplate3(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<span class=\"tdTextLink\" id=\"grid_link3_" + oContainer.DataItem["ProductID"] + "\" onmouseover=\"attachFlyout3ToLink(" + oContainer.GridClientID.ToString() + ", this," + oContainer.PageRecordIndex.ToString() + ") \" onmouseout=\"closeFlyout3()\">More info...</span>";    						                
           
    }
}