using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.OleDb;
using Obout.Grid;
using Obout.ComboBox;

public partial class Grid_cs_integration_combobox_masterdetail : System.Web.UI.Page
{
    Grid grid1 = new Grid();

    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;

        GridRuntimeTemplate ViewEmployeeTemplate = new GridRuntimeTemplate();
        ViewEmployeeTemplate.ID = "ViewEmployeeTemplate";
        ViewEmployeeTemplate.Template = new Obout.Grid.RuntimeTemplate();
        ViewEmployeeTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateViewEmployeeTemplate);
        //------------------------------------------------------------------------

        GridRuntimeTemplate EditEmployeeTemplate = new GridRuntimeTemplate();
        EditEmployeeTemplate.ID = "EditEmployeeTemplate";
        EditEmployeeTemplate.ControlID = "EmployeesCombo";
        EditEmployeeTemplate.Template = new Obout.Grid.RuntimeTemplate();
        EditEmployeeTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditEmployeeTemplate);
        //------------------------------------------------------------------------

        grid1.Templates.Add(ViewEmployeeTemplate);
        grid1.Templates.Add(EditEmployeeTemplate);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipCountry";
        oCol4.HeaderText = "COUNTRY";

        Column oCol5 = new Column();
        oCol5.DataField = "EmployeeName";
        oCol5.Visible = false;

        Column oCol6 = new Column();
        oCol6.DataField = "PositionID";
        oCol6.Visible = false;

        Column oCol7 = new Column();
        oCol7.DataField = "EmployeeID";
        oCol7.HeaderText = "EMPLOYEE";
        oCol7.TemplateSettings.TemplateId = "ViewEmployeeTemplate";
        oCol7.TemplateSettings.EditTemplateId = "EditEmployeeTemplate";
      
        Column oCol8 = new Column();
        oCol8.AllowEdit = true;
        oCol8.AllowDelete = true;

        grid1.ClientSideEvents.OnBeforeClientEdit = "Grid1_Edit";
        grid1.ClientSideEvents.ExposeSender = true;


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);
        grid1.Columns.Add(oCol7);
        grid1.Columns.Add(oCol8);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

    }
    public void CreateViewEmployeeTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindViewEmployeeTemplate);
    }
    protected void DataBindViewEmployeeTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = oContainer.DataItem["EmployeeName"].ToString();

    }
    //------------------------------------------------------------------------
    public void CreateEditEmployeeTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder ph1 = new PlaceHolder();
        e.Container.Controls.Add(ph1);

        ComboBox comboBox = new ComboBox();
        comboBox.ID = "PositionsCombo";
        comboBox.Width = Unit.Percentage(100);
        comboBox.Height = Unit.Pixel(150);
        comboBox.AutoClose = false;
        comboBox.EmptyText = "Select an employee ...";
        comboBox.AppendDataBoundItems = false;
        comboBox.DataSourceID = "sds1";
        comboBox.DataValueField = "PositionID";
        comboBox.DataTextField = "PositionName";

        comboBox.HeaderTemplate = new HeaderTemplate("POSITIONS");
        
        ComboBox EmployeesCombo = new ComboBox();
        EmployeesCombo.ID = "EmployeesCombo";
        EmployeesCombo.Width = Unit.Pixel(200);
        EmployeesCombo.Height = Unit.Pixel(150);
        EmployeesCombo.EnableLoadOnDemand = true;
        EmployeesCombo.LoadingItems += Detail_LoadingItems;
        EmployeesCombo.EmptyText = "Select an employee ...";
        EmployeesCombo.DataSourceID = "sds2";
        EmployeesCombo.DataTextField = "EmployeeName";
        EmployeesCombo.DataValueField = "EmployeeID";

        EmployeesCombo.HeaderTemplate = new HeaderTemplate("EMPLOYEES");

        comboBox.Details.Add(EmployeesCombo);

        ph1.Controls.Add(comboBox);
    }

    protected void Detail_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        if (!string.IsNullOrEmpty(e.Text))
        {
            int tryout = 0;
            if (int.TryParse(e.Text, out tryout))
            {
                sds2.SelectParameters[0].DefaultValue = e.Text;
            }
        }
    }
    public class HeaderTemplate : ITemplate
    {
        private string _headerText = "";
        public HeaderTemplate(string headerText)
        {
            _headerText = headerText;
        }

        public void InstantiateIn(Control container)
        {
            Literal header1 = new Literal();
            header1.Text = "<div class=\"header\">" + _headerText + "</div>";
            container.Controls.Add(header1);
        }
    }

}