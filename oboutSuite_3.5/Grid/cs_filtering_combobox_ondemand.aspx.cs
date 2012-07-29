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

public partial class Grid_cs_filtering_combobox_ondemand : System.Web.UI.Page
{
    Grid grid1 = new Grid();
    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "Grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.AllowFiltering = true;
        grid1.AllowPageSizeSelection = false;

        // creating the template for the Company name column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate Template1 = new GridRuntimeTemplate();
        Template1.ID = "Template1";
        Template1.ControlID = "ComboBox1";
        Template1.Template = new Obout.Grid.RuntimeTemplate();
        Template1.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateTemplate1);

        // adding the templates to the Templates collection
        grid1.Templates.Add(Template1);
        //------------------------------------------------------------------------

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
        oCol4.ShowFilterCriterias = false;
        oCol4.TemplateSettings.FilterTemplateId = "Template1";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipPostalCode";
        oCol5.HeaderText = "POSTAL CODE";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        phGrid1.Controls.Add(grid1);

    }
    public void CreateTemplate1(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder ph1 = new PlaceHolder();
        e.Container.Controls.Add(ph1);

        ComboBox combobox1 = new ComboBox();
        combobox1.ID = "ComboBox1";
        combobox1.Width = Unit.Percentage(100);
        combobox1.Height = Unit.Pixel(200);
        combobox1.DataTextField = "CountryName";
        combobox1.DataValueField = "CountryName";
        combobox1.EmptyText = "Select a country ...";
        combobox1.EnableLoadOnDemand = true;
        combobox1.LoadingItems += ComboBox1_LoadingItems;

        ph1.Controls.Add(combobox1);
    }
    // Handles the "LoadingItems" event of the ComboBox
    protected void ComboBox1_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        // Getting the countries
        DataTable data = GetCountries(e.Text);

        // Looping through the items and adding them to the "Items" collection of the ComboBox
        for (int i = 0; i < data.Rows.Count; i++)
        {
            (sender as ComboBox).Items.Add(new ComboBoxItem(data.Rows[i]["CountryName"].ToString(), data.Rows[i]["CountryName"].ToString()));
        }

        e.ItemsLoadedCount = data.Rows.Count;
        e.ItemsCount = data.Rows.Count;
    }

    // Gets all the countries that start with the typed text, taking paging into account
    protected DataTable GetCountries(string text)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"));
        myConn.Open();

        string whereClause = " WHERE CountryName LIKE @CountryName";
        string sortExpression = " ORDER BY CountryName";

        string commandText = "SELECT CountryID, CountryName FROM Country";
        commandText += whereClause;
        commandText += sortExpression;

        OleDbCommand myComm = new OleDbCommand(commandText, myConn);
        myComm.Parameters.Add("@CountryName", OleDbType.VarChar).Value = text + '%';

        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = myComm;
        da.Fill(ds, "Country");

        myConn.Close();

        return ds.Tables[0];
    }
}