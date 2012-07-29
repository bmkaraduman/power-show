<%@ Page Language="C#" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
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
        grid1.AllowAddingRecords = false;
        grid1.ClientSideEvents.OnClientEdit = "OnEdit";
        grid1.ClientSideEvents.OnBeforeClientUpdate = "OnBeforeUpdate";
        grid1.ClientSideEvents.OnBeforeClientInsert = "OnBeforeInsert";

        grid1.FolderStyle = "styles/grand_gray";

        // setting the event handlers
        grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
        grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
        grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);

        // creating the Templates

        // creating the template for the Country column (edit mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateEditCountry = new GridRuntimeTemplate();
        TemplateEditCountry.ID = "TemplateEditCountry";
        TemplateEditCountry.Template = new Obout.Grid.RuntimeTemplate();
        TemplateEditCountry.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditCountryTemplate);
        TemplateEditCountry.ControlID = "hidCountry";
        TemplateEditCountry.ControlPropertyName = "value";
        TemplateEditCountry.UseQuotes = true;
        //------------------------------------------------------------------------


        // adding the templates to the Templates collection
        grid1.Templates.Add(TemplateEditCountry);


        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "CustomerID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ID";
        oCol1.Width = "45";
        oCol1.Visible = false;


        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "210";

        Column oCol3 = new Column();
        oCol3.DataField = "ContactName";
        oCol3.HeaderText = "CONTACT NAME";
        oCol3.Width = "200";

        Column oCol4 = new Column();
        oCol4.DataField = "Country";
        oCol4.HeaderText = "COUNTRY";
        oCol4.Width = "130";
        oCol4.TemplateSettings.EditTemplateId = "TemplateEditCountry";


        Column oCol5 = new Column();
        oCol5.HeaderText = "";
        oCol5.Width = "125";
        oCol5.AllowEdit = true;
        oCol5.AllowDelete = true;

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
       
        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

    // Create the methods that will load the data into the templates
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
        ddlCountry.DataValueField = "CountryName";
        ddlCountry.Attributes.Add("onchange", "SetValue(this)");
        ListItem lstSelect = new ListItem("Please select one...","");
        lstSelect.Selected = true;
        ddlCountry.Items.Insert(0,lstSelect);
        ListItem lstNew = new ListItem("- Add new country -", "New");
        ddlCountry.Items.Add(lstNew);
       

        oPhCountry.Controls.Add(ddlCountry);

        Literal oLiteral = new Literal();
        oLiteral.Text = "<input type=\"text\" class=\"ob_gEC\" id=\"txtCountry\" /> <input id=\"hidCountry\" type=\"hidden\" />";

        oPhCountry.Controls.Add(oLiteral);

    }
    //------------------------------------------------------------------------

    void CreateGrid()
    {

        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT * FROM Customers", myConn);
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

        myComm.Parameters.Add("@CustomerID", OleDbType.Integer).Value = e.Record["CustomerID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Customers SET CompanyName=@CompanyName, ContactName=@ContactName, Country=@Country WHERE CustomerID = @CustomerID", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = e.Record["ContactName"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record["CustomerID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    
    }
    
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Customers (CompanyName, ContactName, Country) VALUES(@CompanyName, @ContactName, @Country)", myConn);

        myComm.Parameters.Add("@EmployeeName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = e.Record["ContactName"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }

    public string SaveCountry(string CountryName)
    {
        if (!IsCountryExists(CountryName))
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
            myConn.Open();

            OleDbCommand myComm = new OleDbCommand("INSERT INTO Countries (CountryName) VALUES(@CountryName)", myConn);

            myComm.Parameters.Add("@CountryName", OleDbType.VarChar).Value = CountryName;

            myComm.ExecuteNonQuery();
            myConn.Close();
        }
        return (CountryName);
    }

    public bool IsCountryExists(string countryName)
    {
        bool flag = false;
        
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT * FROM Countries WHERE CountryName=@CountryName", myConn);
        
        myComm.Parameters.Add("@CountryName", OleDbType.VarChar).Value = countryName;
        
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();
        
        while (myReader.Read())
        {
            flag = true;
        }

        myConn.Close();

        return flag;
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
	
     var ddlCountry="";   
     

	function SetValue(e)
	{
       if(e.value=="New")
       {
           document.getElementById(e.id).style.visibility="hidden";
           document.getElementById(e.id).style.display="none";
           document.getElementById("txtCountry").style.visibility="visible";
           document.getElementById("txtCountry").style.display="block";
       }
	}
	

	function OnBeforeInsert(record) {
	    return true;
	}
	
	function OnEdit(record) {

        var _ddlcountry=document.getElementsByTagName("select");
        for(i=0;i<_ddlcountry.length;i++){

            if(_ddlcountry[i].id.indexOf("ddlCountry")>0){
                
                ddlCountry=_ddlcountry[i].id;
                break;
            }
        }

	    if(ddlCountry!="" && ddlCountry!=null){
           document.getElementById(ddlCountry).options[0].selected="selected";
           document.getElementById(ddlCountry).style.visibility="visible";
           document.getElementById(ddlCountry).style.display="block";
           document.getElementById("txtCountry").style.visibility="hidden";
           document.getElementById("txtCountry").style.display="none";
           
            var _ddlCountry=document.getElementById(ddlCountry);
	    
	        for(i=0;i<_ddlCountry.length;i++) {
	            if(_ddlCountry.options[i].text==record.Country)
	            {
	                _ddlCountry.options[i].selected="selected";
	            }
	        }
         }

   		return true;
	}
	
	function OnBeforeUpdate(record) {

        
	    if(ddlCountry!=""){
	    
	        var _ddlCountry=document.getElementById(ddlCountry);
	    
	        for(i=0;i<_ddlCountry.length;i++) {
	            if(_ddlCountry.options[i].selected) {
	                _ddlCountry.options[i].selected=false;
	                document.getElementById("hidCountry").value=_ddlCountry.options[i].value;
	                }
	            }
	        }
	    if(document.getElementById("hidCountry").value==""){
	    alert("Please select country");
	    return false;
	    
	    }
	    
	    if(document.getElementById("hidCountry").value=="New"){
	    AddNewCountry(document.getElementById("txtCountry").value);
	    document.getElementById("hidCountry").value=document.getElementById("txtCountry").value;
	    }
		return true;
	}
	
	function OnUpdate(record){
	  

	}
	
	
	function AddNewCountry(country)	{   
        ob_post.AddParam("CountryName",country);
        ob_post.post(null, "SaveCountry",AddCountryToList);
    }
    
    function AddCountryToList(country) {
        var newCountry=document.createElement("option");
        newCountry.text=country;
        newCountry.value=country;
        document.getElementById(ddlCountry).options.add(newCountry);
        
    }

	
</script>
</head>
<body>

    <form id="form1" runat="server">
        
        <br />
		<span class="tdText"><b>ASP.NET Grid - Edit using DropDownList with option to add new values</b></span>
		<br /><br />
		
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>        
        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM [Countries] ORDER BY CountryName"
         ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|NorthWind.mdb;" ProviderName="System.Data.OleDb">
        </asp:SqlDataSource>
        <br /><br /><br />
		
		<span class="tdText">
		   You can select an existing item for the "Country" column, or add a new country to the list,<br />
		   by selecting the "- Add new country -" option from the DropDownList.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
    </form>
</body>
</html>
