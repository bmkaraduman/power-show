<%@ Page Language="C#" %>

<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

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
        grid1.RowDataBound+=new GridRowEventHandler(RowDataBound);


        // creating the Templates

        // creating the template for the Country column (edit mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateEditCountry = new GridRuntimeTemplate();
        TemplateEditCountry.ID = "TemplateEditCountry";
        TemplateEditCountry.Template = new Obout.Grid.RuntimeTemplate();
        TemplateEditCountry.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditCountryTemplate);
        TemplateEditCountry.ControlID = "hidCountries";
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
        oCol2.Width = "200";
        oCol2.ReadOnly = true;

        Column oCol3 = new Column();
        oCol3.DataField = "ContactName";
        oCol3.HeaderText = "CONTACT NAME";
        oCol3.Width = "200";
        oCol3.ReadOnly = true;

        Column oCol4 = new Column();
        oCol4.DataField = "CountryIds";
        oCol4.HeaderText = "COUNTRIES";
        oCol4.Width = "150";
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

        ListBox ListBox1 = new ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.CssClass = "ob_gEC";
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CountryName";
        ListBox1.DataValueField = "CountryID";
        ListBox1.SelectionMode = ListSelectionMode.Multiple;
     
        oPhCountry.Controls.Add(ListBox1);

        Literal oLiteral = new Literal();
        oLiteral.Text = "<input id=\"hidCountries\" type=\"hidden\">";

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
        /*
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Customers (CustomerID, CompanyName, ContactName, CountryIds) VALUES(@CustomerID, @CompanyName, @ContactName, @CountryIds)", myConn);

        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record["CustomerID"];
        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = e.Record["ContactName"];
        myComm.Parameters.Add("@CountryIds", OleDbType.VarChar).Value = e.Record["CountryIds"];
        

        myComm.ExecuteNonQuery();
        myConn.Close();
        */
    }
    
    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
        
    }
    
    protected void RowDataBound(object sender, GridRowEventArgs e)
    {
        e.Row.Cells[3].Text = GetCountries(e.Row.Cells[3].Text);
    }


    public string GetCountries(string ids)
    {
        StringBuilder countries = new StringBuilder();
        char[] spliter = { ',' };
        string[] countryIds = ids.Split(spliter);
        foreach (string countryId in countryIds)
        {
            countries.Append(GetCountry(countryId));
            countries.Append(",");
        }


        return countries.ToString().Substring(0, countries.Length - 1);
    }

    public string GetCountry(string id)
    {
        string countryName = string.Empty;

        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT CountryName  FROM Countries WHERE CountryId=@CountryId", myConn);
        myComm.Parameters.AddWithValue("@CountryId", id);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        while (myReader.Read())
        {
            countryName = myReader["CountryName"].ToString();
        }

        myConn.Close();
        return countryName;
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
		
	</style>
    
    <script language="javascript" type="text/javascript">	
	

	    function OnBeforeInsert(record) {
           	
           if(SelectedCountries!=""){
	        document.getElementById("hidCountries").value=SelectedCountries
	       }
	       else{
	       document.getElementById("hidCountries").value=record.CountryIds;
	       }
	        return true;
	    }
    	
	    function OnEdit(record) {

		    var lstBoxCountries;
            var lBox=document.getElementsByTagName("select");
            
            for(i=0;i<lBox.length;i++){
                if(lBox[i].id.indexOf("ListBox1")>0){
                    lstBoxCountry=lBox[i].id
                    break;
                }
            }

            var countries=record.CountryIds.split(',');
            
            var listCountries=document.getElementById(lstBoxCountry);
            
        	    for(i=0;i<listCountries .length; i++){
        	        listCountries.options[i].selected=false;
        	        for(j=0;j<countries.length;j++){
        	            if(listCountries.options[i].text==countries[j]){
        	   	            listCountries.options[i].selected="selected";
        	            }
        	        }
        	    }
            
   		    return true;
	    }
    	
	    function OnBeforeUpdate(record) {
	    
            var SelectedCountries="";
            var lstBoxCountries;
            var lBox=document.getElementsByTagName("select");
            
            for(i=0;i<lBox.length;i++){
                if(lBox[i].id.indexOf("ListBox1")>0){
                    lstBoxCountry=lBox[i].id
                    break;
                }
            }
                var listCountries=document.getElementById(lstBoxCountry);
            
        	    for(i=0;i<listCountries .length; i++){
        	        if(listCountries.options[i].selected)
        	        {
        	        	        SelectedCountries+=listCountries.options[i].value+",";
        	        }
        	     }
                 document.getElementById("hidCountries").value=SelectedCountries.substr(0,SelectedCountries.length-1);
  
    	    return true;
	    }

    	
    </script>
</head>
<body>

    <form id="form1" runat="server">
            	
    	<br />
		<span class="tdText"><b>ASP.NET Grid - Edit Using Multiselect Listbox</b></span>
		<br /><br />
    
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

	    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Countries"
	        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
	    </asp:SqlDataSource>	
        <br /><br /><br />
		
		<span class="tdText">
		   You can use the multiselect Listbox to select multiple countries for each record.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>

    </form>
</body>
</html>

