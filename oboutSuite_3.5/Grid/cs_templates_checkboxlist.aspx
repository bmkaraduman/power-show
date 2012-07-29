<%@ Page Language="C#"%>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
Grid grid1 = new Grid();
protected void Page_Load(object sender, EventArgs e)
{ 
    grid1.ID = "grid1";
    grid1.CallbackMode = true;
    grid1.Serialize = true;
    grid1.AllowAddingRecords = false;
    grid1.FolderStyle = "styles/premiere_blue";
    grid1.AutoGenerateColumns = false;

    grid1.ClientSideEvents.OnBeforeClientUpdate = "OnBeforeUpdate";
    grid1.ClientSideEvents.OnClientEdit = "OnEdit";
    grid1.ClientSideEvents.OnBeforeClientInsert = "OnBeforeInsert";

    // setting the event handlers
    grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
    grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
    grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
    grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);
    grid1.RowDataBound += new GridRowEventHandler(grid1_RowDataBound);

    // creating the Templates

    // creating the Templates

    // creating the template for the Country column (edit mode)
    //------------------------------------------------------------------------
    GridRuntimeTemplate TemplateEditCountry = new GridRuntimeTemplate();
    TemplateEditCountry.ID = "TemplateEditCountry";
    TemplateEditCountry.Template = new Obout.Grid.RuntimeTemplate();
    TemplateEditCountry.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditCountryTemplate);
    TemplateEditCountry.UseQuotes = true;
    //------------------------------------------------------------------------


    GridRuntimeTemplate TemplateEditCountryIds = new GridRuntimeTemplate();
    TemplateEditCountryIds.ID = "TemplateEditCountryIds";
    TemplateEditCountryIds.Template = new Obout.Grid.RuntimeTemplate();
    TemplateEditCountryIds.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditCountryIdsTemplate);
    TemplateEditCountryIds.ControlID = "hidCountries";
    TemplateEditCountryIds.ControlPropertyName = "value";
    TemplateEditCountryIds.UseQuotes = true;
    //------------------------------------------------------------------------

    // adding the templates to the Templates collection
    grid1.Templates.Add(TemplateEditCountry);
    grid1.Templates.Add(TemplateEditCountryIds);


    // creating the columns
    Column oCol1 = new Column();
    oCol1.DataField = "CustomerID";
    oCol1.ReadOnly = true;
    oCol1.HeaderText = "ID";
    oCol1.Width = "60";
    oCol1.Visible = false;

    Column oCol2 = new Column();
    oCol2.DataField = "CompanyName";
    oCol2.HeaderText = "COMPANY NAME";
    oCol2.Width = "150";

    Column oCol3 = new Column();
    oCol3.DataField = "ContactName";
    oCol3.HeaderText = "CONTACT NAME";
    oCol3.Width = "150";

    Column oCol4 = new Column();
    oCol4.HeaderText = "COUNTRIES";
    oCol4.Width = "200";
    oCol4.TemplateSettings.EditTemplateId = "TemplateEditCountry";

    Column oCol5 = new Column();
    oCol5.DataField = "CountryIds";
    oCol5.HeaderText = "COUNTRIES";
    oCol5.Width = "200";
    oCol5.Visible = false;
    oCol5.TemplateSettings.EditTemplateId = "TemplateEditCountryIds";

    Column oCol6 = new Column();
    oCol6.HeaderText = "";
    oCol6.Width = "125";
    oCol6.AllowEdit = true;
    oCol6.AllowDelete = true;
    
    // add the columns to the Columns collection of the grid
    grid1.Columns.Add(oCol1);
    grid1.Columns.Add(oCol2);
    grid1.Columns.Add(oCol3);
    grid1.Columns.Add(oCol4);
    grid1.Columns.Add(oCol5);
    grid1.Columns.Add(oCol6);

    // add the grid to the controls collection of the PlaceHolder
    phGrid1.Controls.Add(grid1);

    if (!Page.IsPostBack)
    {
        CreateGrid();
    }
 }

public void CreateEditCountryTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
{
    PlaceHolder oPhCountry = new PlaceHolder();
    e.Container.Controls.Add(oPhCountry);
    oPhCountry.DataBinding += new EventHandler(DataBindEditCountryTemplate);
    
}
protected void DataBindEditCountryTemplate(Object sender, EventArgs e)
{
    PlaceHolder oPhCountry = sender as PlaceHolder;
    oPhCountry.ID = "oPhCountry";
    Obout.Grid.TemplateContainer oContainer = oPhCountry.NamingContainer as Obout.Grid.TemplateContainer;

    Literal divContainer = new Literal();
    divContainer.Text = "<div style=\"height: 200px;overflow: auto; overflow-x:hidden;\">";

    oPhCountry.Controls.Add(divContainer);

    CheckBoxList CheckBoxList1 = new CheckBoxList();
    CheckBoxList1.ID = "CheckBoxList1";
    CheckBoxList1.DataSourceID = "sds1";
    CheckBoxList1.DataTextField = "CountryName";
    CheckBoxList1.DataValueField = "CountryID";
    CheckBoxList1.DataBound += CheckBoxList1_DataBound;

    oPhCountry.Controls.Add(CheckBoxList1);

    Literal oLiteral = new Literal();
    oLiteral.Text = "</div>";

    oPhCountry.Controls.Add(oLiteral);

}

public void CreateEditCountryIdsTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
{
    PlaceHolder oPhCountry = new PlaceHolder();
    e.Container.Controls.Add(oPhCountry);
    oPhCountry.DataBinding += new EventHandler(DataBindEditCountryIdsTemplate);
}
protected void DataBindEditCountryIdsTemplate(Object sender, EventArgs e)
{
    PlaceHolder oPhCountry = sender as PlaceHolder;
    oPhCountry.ID = "oPhCountry";
    Obout.Grid.TemplateContainer oContainer = oPhCountry.NamingContainer as Obout.Grid.TemplateContainer;

    Literal oLiteral = new Literal();
    oLiteral.Text = "<input id=\"hidCountries\" type=\"hidden\">";

    oPhCountry.Controls.Add(oLiteral);

}
//------------------------------------------------------------------------

    void CreateGrid()
    {

        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT CustomerID,CompanyName, ContactName, CountryIds  FROM Customers", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Customers WHERE CustomerID = @CustomerID", myConn);

        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record["CustomerID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
    
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Customers SET CountryIds=@CountryIds WHERE CustomerID=@CustomerID", myConn);
        myComm.Parameters.AddWithValue("@CountryIds", e.Record["CountryIds"]);
        myComm.Parameters.AddWithValue("@CustomerID", e.Record["CustomerID"]);

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
    }
    
    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
        
    }

    protected void grid1_RowDataBound(object sender, GridRowEventArgs e)
    {
        e.Row.Cells[3].Text = GetCountries(e.Row.Cells[4].Text);
    }


    public string GetCountries(string ids)
    {
        string countryNames = string.Empty;

        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT CountryName  FROM Countries WHERE CountryId IN (" + ids.Replace("'", "''") + ")", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        while (myReader.Read())
        {
            if (countryNames != String.Empty)
            {
                countryNames += ",";
            }
            countryNames += myReader["CountryName"].ToString();
        }

        myConn.Close();
        
        return countryNames;
    }

    public void CheckBoxList1_DataBound(object sender, EventArgs e)
    {
        string values = "";
        foreach (ListItem item in ((CheckBoxList)sender).Items)
        {
            if (values != "")
            {
                values += ",";
            }
            
            values += item.Value;
        }

        CheckBoxValues.Value = values;
    }
    
</script>

	<head id="Head1" runat="server" >
    <title>obout ASP.NET Grid examples</title>
    
    	<style type="text/css">
		.tdText {
			font:11px Verdana;
			color:#333333;
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
		
	</style>
    
    <script language="javascript" type="text/javascript">
        var arrCheckBoxes = null;

        function OnBeforeInsert(record) {

            if (SelectedCountries != "") {
                document.getElementById("hidCountries").value = SelectedCountries
            }
            else {
                document.getElementById("hidCountries").value = record.CountryIds;
            }

            return true;
        }

        function getCheckBoxes() {
            if (arrCheckBoxes == null) {
                arrCheckBoxes = new Array();
                var elements = grid1.GridMainContainer.getElementsByTagName('INPUT');
                for (var i = 0; i < elements.length; i++) {
                    if (elements[i].type == 'checkbox') {
                        arrCheckBoxes.push(elements[i]);
                    }
                }
            }

            return arrCheckBoxes;
        }

        function OnEdit(record) {
            var countries = ',' + record.CountryIds + ',';

            var checkboxes = getCheckBoxes();

            var values = document.getElementById('CheckBoxValues').value.split(',');

            for (var i = 0; i < values.length; i++) {
                if (countries.indexOf(',' + values[i] + ',') != -1) {
                    checkboxes[i].checked = true;
                } else {
                    checkboxes[i].checked = false;
                }
            }

            return true;
        }

        function OnBeforeUpdate(record) {
            var selectedCountries = new Array();
            var checkboxes = getCheckBoxes();

            var values = document.getElementById('CheckBoxValues').value.split(',');

            for (var i = 0; i < values.length; i++) {
                if (checkboxes[i].checked) {
                    selectedCountries.push(values[i]);
                }
            }


            document.getElementById("hidCountries").value = selectedCountries.join(',');

            return true;
        }

    	
    </script>
</head>
<body>

    <form id="form1" runat="server">
        <br />
		<span class="tdText"><b>ASP.NET Grid - Edit Using CheckBoxList</b></span>
		<br /><br />
	    
	    <asp:HiddenField ID="CheckBoxValues" runat="server" />
	    
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>				
         <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Countries"
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
        </asp:SqlDataSource>
		<br /><br /><br />
		
		<span class="tdText">
		   You can add a CheckBoxList control inside a Grid template to allow end users to select multiple items from a list.<br />
           This sample showcases the use of a CheckBoxList for the "COUNTRIES" column.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
