using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;
using System.Data;
using System.Data.OleDb;

public partial class ComboBox_cs_integration_grid_inside : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(200);
        ComboBox1.MenuWidth = Unit.Pixel(570);
        ComboBox1.AutoClose = false;
        ComboBox1.AllowCustomText = true;
        ComboBox1.AutoValidate = true;
        ComboBox1.AllowEdit = false;
        ComboBox1.EmptyText = "Select a customer ...";
       
        ComboBox1.ClientSideEvents.OnOpen = "ComboBox1_Open";
       
        ComboBoxItem item1 = new ComboBoxItem();
        item1.ID = "ComboBoxItem1";
        ComboBox1.Items.Add(item1);

        ComboBox1.ItemTemplate = new ItemTemplate();

        ComboBox1Container.Controls.Add(ComboBox1);
    }

     public class ItemTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {

            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);

            Literal divContainer = new Literal();
            divContainer.Text = "<div id=\"gridContainer\">";

            Obout.Grid.Grid grid1 = new Obout.Grid.Grid();
            grid1.ID = "Grid1";
            grid1.DataSourceID = "SqlDataSource1";
            grid1.AutoGenerateColumns = false;
            grid1.AllowPaging = false;
            grid1.AllowPageSizeSelection = false;
            grid1.AllowSorting = false;
            grid1.PageSize = -1;
            grid1.AllowMultiRecordSelection = false;
            grid1.AllowAddingRecords = false;
            grid1.ClientSideEvents.ExposeSender = true;
            grid1.ClientSideEvents.OnClientSelect = "Grid1_Select";

            Obout.Grid.Column oCol1 = new Obout.Grid.Column();
            oCol1.DataField = "CustomerID";
            oCol1.Visible = false;
            oCol1.HeaderText = "CUSTOMER";

            Obout.Grid.Column oCol2 = new Obout.Grid.Column();
            oCol2.DataField = "CompanyName";
            oCol2.HeaderText = "NAME";

            Obout.Grid.Column oCol3 = new Obout.Grid.Column();
            oCol3.DataField = "City";
            oCol3.HeaderText = "CITY";

            Obout.Grid.Column oCol4 = new Obout.Grid.Column();
            oCol4.DataField = "Country";
            oCol4.HeaderText = "COUNTRY";

            grid1.Columns.Add(oCol1);
            grid1.Columns.Add(oCol2);
            grid1.Columns.Add(oCol3);
            grid1.Columns.Add(oCol4);

            grid1.ScrollingSettings.ScrollHeight = 175;
            grid1.PagingSettings.ShowRecordsCount = false;

            Literal divContainer2 = new Literal();
            divContainer2.Text = "</div>";

            templatePlaceHolder.Controls.Add(divContainer);
            templatePlaceHolder.Controls.Add(grid1);
            templatePlaceHolder.Controls.Add(divContainer2);
        }
    }

}
