<%@ Page Language="C#" %>

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
        grid1.AutoGenerateColumns = false;
        grid1.ClientSideEvents.OnClientEdit = "OnEdit";
        grid1.ClientSideEvents.OnBeforeClientUpdate = "OnBeforeUpdate";
        grid1.ClientSideEvents.OnBeforeClientInsert = "OnBeforeInsert";

        grid1.FolderStyle = "styles/premiere_blue";

        // setting the event handlers
        grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
        grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
        grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
        grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);


        // creating the Templates

        // creating the template for the Sex column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateSex = new GridRuntimeTemplate();
        TemplateSex.ID = "TemplateSex";
        TemplateSex.Template = new Obout.Grid.RuntimeTemplate();
        TemplateSex.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateSexTemplate);
        //------------------------------------------------------------------------

        // creating the template for the Sex column (edit mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateEditSex = new GridRuntimeTemplate();
        TemplateEditSex.ID = "TemplateEditSex";
        TemplateEditSex.Template = new Obout.Grid.RuntimeTemplate();
        TemplateEditSex.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditSexTemplate);
        TemplateEditSex.ControlID = "hidSex";
        TemplateEditSex.ControlPropertyName = "value";
        //------------------------------------------------------------------------

        // creating the template for the Position column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplatePosition = new GridRuntimeTemplate();
        TemplatePosition.ID = "TemplatePosition";
        TemplatePosition.Template = new Obout.Grid.RuntimeTemplate();
        TemplatePosition.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreatePositionTemplate);
        //------------------------------------------------------------------------



        // creating the template for the Position column (edit mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateEditPosition = new GridRuntimeTemplate();
        TemplateEditPosition.ID = "TemplateEditPosition";
        TemplateEditPosition.Template = new Obout.Grid.RuntimeTemplate();
        TemplateEditPosition.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditPositionTemplate);
        TemplateEditPosition.ControlID = "ddlPosition";
        TemplateEditPosition.ControlPropertyName = "value";
        TemplateEditPosition.UseQuotes = true;
        //------------------------------------------------------------------------

        // creating the template for the Country column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateCountry = new GridRuntimeTemplate();
        TemplateCountry.ID = "TemplateCountry";
        TemplateCountry.Template = new Obout.Grid.RuntimeTemplate();
        TemplateCountry.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCountryTemplate);
        //------------------------------------------------------------------------



        // creating the template for the Country column (edit mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateEditCountry = new GridRuntimeTemplate();
        TemplateEditCountry.ID = "TemplateEditCountry";
        TemplateEditCountry.Template = new Obout.Grid.RuntimeTemplate();
        TemplateEditCountry.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditCountryTemplate);
        TemplateEditCountry.ControlID = "ddlCountry";
        TemplateEditCountry.ControlPropertyName = "value";
        TemplateEditCountry.UseQuotes = true;
        //------------------------------------------------------------------------


        // adding the templates to the Templates collection
        grid1.Templates.Add(TemplateSex);
        grid1.Templates.Add(TemplateEditSex);
        grid1.Templates.Add(TemplatePosition);
        grid1.Templates.Add(TemplateEditPosition);
        grid1.Templates.Add(TemplateCountry);        
        grid1.Templates.Add(TemplateEditCountry);


        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "EmployeeID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ID";
        oCol1.Width = "45";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "FirstName";
        oCol2.HeaderText = "FIRST NAME";
        oCol2.Width = "125";
        
        Column oCol3 = new Column();
        oCol3.DataField = "LastName";
        oCol3.HeaderText = "LAST NAME";
        oCol3.Width = "130";
        
        Column oCol4 = new Column();
        oCol4.DataField = "SexID";
        oCol4.HeaderText = "SEX";
        oCol4.Width = "130";
        oCol4.TemplateSettings.TemplateId = "TemplateSex";
        oCol4.TemplateSettings.EditTemplateId = "TemplateEditSex";

        Column oCol5 = new Column();
        oCol5.DataField = "PositionID";
        oCol5.HeaderText = "POSITION";
        oCol5.Width = "125";
        oCol5.TemplateSettings.TemplateId = "TemplatePosition";
        oCol5.TemplateSettings.EditTemplateId = "TemplateEditPosition";
        
        Column oCol6 = new Column();
        oCol6.DataField = "CountryID";
        oCol6.HeaderText = "COUNTRY";
        oCol6.Width = "125";
        oCol6.TemplateSettings.TemplateId = "TemplateCountry";
        oCol6.TemplateSettings.EditTemplateId = "TemplateEditCountry";


        Column oCol7 = new Column();
        oCol7.HeaderText = "";
        oCol7.Width = "125";
        oCol7.AllowEdit = true;
        oCol7.AllowDelete = true;

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);
        grid1.Columns.Add(oCol7);
        
        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

    // Create the methods that will load the data into the templates
    
    //------------------------------------------------------------------------
    public void CreateSexTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindSexTemplate);
    }
    
    protected void DataBindSexTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = (oContainer.Value == "1" ? "Male" : (oContainer.Value == "0" ? "Female" : ""));
    } 
    //------------------------------------------------------------------------

    
    //------------------------------------------------------------------------
    public void CreateEditSexTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindEditSexTemplate);
    }
    
    protected void DataBindEditSexTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"radio\" id=\"rMale\" name=\"radioSex\" value=\"1\"/>Male<br><input type=\"radio\" id=\"rFemale\" name=\"radioSex\" value=\"0\"/>Female<input type=\"hidden\" id=\"hidSex\" />";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreatePositionTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindPositionTemplate);
    }
    protected void DataBindPositionTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = oContainer.DataItem["PositionName"].ToString();
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateEditPositionTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder oPhPosition = new PlaceHolder();
        e.Container.Controls.Add(oPhPosition);
        oPhPosition.DataBinding += new EventHandler(DataBindEditPositionTemplate);
    }
    protected void DataBindEditPositionTemplate(Object sender, EventArgs e)
    {
        PlaceHolder oPhPosition = sender as PlaceHolder;
        oPhPosition.ID = "oPhCountry";
        Obout.Grid.TemplateContainer oContainer = oPhPosition.NamingContainer as Obout.Grid.TemplateContainer;

        DropDownList ddlPosition = new DropDownList();
        ddlPosition.ID = "ddlPosition";
        ddlPosition.CssClass = "ob_gEC";
        ddlPosition.AppendDataBoundItems = true;
        ddlPosition.DataSourceID = "sds2";
        ddlPosition.DataTextField = "PositionName";
        ddlPosition.DataValueField = "PositionID";
        ddlPosition.Items.Add("Please select one...");

        oPhPosition.Controls.Add(ddlPosition);
       
    }
    //------------------------------------------------------------------------
    
    //------------------------------------------------------------------------
    public void CreateCountryTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindCountryTemplate);
    }
    protected void DataBindCountryTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;
        oLiteral.Text = oContainer.DataItem["CountryName"].ToString();
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
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

        DropDownList ddlCountry = new DropDownList();
        ddlCountry.ID = "ddlCountry";
        ddlCountry.CssClass = "ob_gEC";
        ddlCountry.AppendDataBoundItems = true;
        ddlCountry.DataSourceID = "sds1";
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryID";

        oPhCountry.Controls.Add(ddlCountry);

    }
    //------------------------------------------------------------------------

    void CreateGrid()
    {
        
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

        OleDbCommand myComm = new OleDbCommand(@"SELECT Em.EmployeeID, Em.FirstName, Em.LastName, Em.SexID, Em.PositionID, Em.CountryID, C.CountryName, P.PositionName  
                                                FROM (Employees Em LEFT OUTER JOIN Countries C ON Em.CountryID=C.CountryID)
                                                  LEFT OUTER JOIN Positions P ON P.PositionID=Em.PositionID", myConn);
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

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Employees WHERE EmployeeID = @EmployeeID", myConn);

        myComm.Parameters.Add("@EmployeeID", OleDbType.Integer).Value = e.Record["EmployeeID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Employees SET FirstName=@FirstName, LastName=@LastName, SexID = @SexID, PositionID=@PositionID, CountryID=@CountryID WHERE EmployeeID = @EmployeeID", myConn);

        myComm.Parameters.Add("@FirstName", OleDbType.VarChar).Value = e.Record["FirstName"];
        myComm.Parameters.Add("@LastName", OleDbType.VarChar).Value = e.Record["LastName"];
        myComm.Parameters.Add("@SexID", OleDbType.VarChar).Value = e.Record["SexID"];
        myComm.Parameters.Add("@PositionID", OleDbType.VarChar).Value = e.Record["PositionID"];
        myComm.Parameters.Add("@CountryID", OleDbType.VarChar).Value = e.Record["CountryID"];
        myComm.Parameters.Add("@EmployeeID", OleDbType.VarChar).Value = e.Record["EmployeeID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Employees (FirstName, LastName, SexID, PositionID, CountryID) VALUES(@FirstName, @LastName, @SexID,@PositionID, @CountryID)", myConn);

        myComm.Parameters.Add("@FirstName", OleDbType.VarChar).Value = e.Record["FirstName"];
        myComm.Parameters.Add("@LastName", OleDbType.VarChar).Value = e.Record["LastName"];
        myComm.Parameters.Add("@SexID", OleDbType.VarChar).Value = e.Record["SexID"];
        myComm.Parameters.Add("@PositionID", OleDbType.VarChar).Value = e.Record["PositionID"];
        myComm.Parameters.Add("@CountryID", OleDbType.VarChar).Value = e.Record["CountryID"];
        
        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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

		a:hover {
			color:crimson;
		}
	</style>
    <script language="javascript" type="text/javascript">	
	
	    function OnBeforeInsert(record) {
	        SetSexID();
	        return true;
	    }
    		
	    function OnEdit(record) {
	        var sexID=grid1.Rows[grid1.RecordInEditMode].Cells["SexID"].Value;
	        if(sexID=="0"){
	            document.getElementById("rFemale").checked=true;
	        }
	        else{
	           document.getElementById("rMale").checked=true;
	        }
		    return true;
	    }
    	
	    function OnBeforeUpdate(record) {
            SetSexID();
		    return true;
	    }
    	
	    function SetSexID()
	    {
            if(document.getElementById("rFemale").checked){
	            document.getElementById("hidSex").value="0";
	        }
	        else if(document.getElementById("rMale").checked){
	            document.getElementById("hidSex").value="1";
	        }
	    }
	
    </script>
</head>
<body>
    <form id="form1" runat="server">
    	
    	<br />
		<span class="tdText"><b>ASP.NET Grid - Edit with databound controls</b></span>
		<br /><br />
    
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
	        <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM Positions"
                ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
            </asp:SqlDataSource>
		    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Countries"
		        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    </asp:SqlDataSource>	
        <br /><br /><br />
		
		<span class="tdText">
		   The records of the Grid can be edited using databound controls by means of Templates.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>

    </form>
</body>
</html>
