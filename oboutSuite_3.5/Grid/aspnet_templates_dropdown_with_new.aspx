<%@ Page Language="C#" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">


    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownList ddlCountry = (DropDownList)grid1.Templates[0].Container.FindControl("ddlCountry");
        ddlCountry.Attributes.Add("onchange", "SetValue(this)");
                
        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

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
		<span class="tdText"><b>Edit using DropDownList with option to add new values</b></span>
		<br /><br />
		
        <obout:Grid id="grid1" runat="server" Serialize="true"  AllowAddingRecords="false"
			 FolderStyle="styles/premiere_blue" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">

			<ClientSideEvents OnBeforeClientUpdate="OnBeforeUpdate" OnClientEdit="OnEdit" OnBeforeClientInsert="OnBeforeInsert" />
			    
			<Columns>
				<obout:Column ID="Column1" DataField="CustomerID" ReadOnly="true" HeaderText="ID" Width="60" runat="server" Visible="false"/>				
				<obout:Column ID="Column2" DataField="CompanyName" HeaderText="COMPANY NAME" Width="210" runat="server" />
				<obout:Column ID="Column3" DataField="ContactName" HeaderText="CONTACT NAME" Width="200" runat="server" />
                <obout:Column ID="Column4" DataField="Country" HeaderText="COUNTRY" Width="130" runat="server">
				    <TemplateSettings EditTemplateID="TemplateEditCountry" />
				</obout:Column>
				<obout:Column ID="Column5" AllowEdit="true" AllowDelete="true" HeaderText="" Width="125" runat="server" />
			</Columns>
			
			<Templates>						
				<obout:GridTemplate runat="server" ID="TemplateEditCountry" ControlID="hidCountry" ControlPropertyName="value">
				    <Template>
				        <input type="text" id="txtCountry" Class="ob_gEC" style="visibility:hidden; display:none"  />
		                
		                <asp:DropDownList ID="ddlCountry" runat="server" AppendDataBoundItems="true" CssClass="ob_gEC" Width="99%" DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryName">
                         <asp:ListItem Text="Please select one..." Value="" Selected="True" />
                         <asp:ListItem Text="- Add new country -" Value="New" />
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM [Countries] ORDER BY CountryName"
		                 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|NorthWind.mdb;" ProviderName="System.Data.OleDb">
		                </asp:SqlDataSource>

                        <input type="hidden" id="hidCountry" />
				    </Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>
        
        <br /><br /><br />
		
		<span class="tdText">
		   You can select an existing item for the "Country" column, or add a new country to the list,<br />
		   by selecting the "- Add new country -" option from the DropDownList.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
