<%@ Page Language="C#" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

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

    protected void grid1_RowDataBound(object sender, GridRowEventArgs e)
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

        
        return countries.ToString().Substring(0, countries.Length-1);
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

		a:hover {
			color:crimson;
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
		<span class="tdText"><b>ASP.NET Grid - Edit Using Multiselect Listbox </b></span>
		<br /><br />
    
        <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true"  AllowAddingRecords="false"
			 FolderStyle="styles/premiere_blue" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord" OnRowDataBound="grid1_RowDataBound">

		    <ClientSideEvents OnBeforeClientUpdate="OnBeforeUpdate" OnClientEdit="OnEdit" OnBeforeClientInsert="OnBeforeInsert" />
			    
			<Columns>
				<obout:Column ID="Column1" DataField="CustomerID" ReadOnly="true" HeaderText="ID" Width="60" runat="server" Visible="false"/>				
				<obout:Column ID="Column2" DataField="CompanyName" ReadOnly="true" HeaderText="COMPANY NAME" Width="200" runat="server" />
				<obout:Column ID="Column3" DataField="ContactName" ReadOnly="true" HeaderText="CONTACT NAME" Width="200" runat="server" />
				<obout:Column ID="Column4" DataField="CountryIds" HeaderText="COUNTRIES" Width="150" runat="server">
				    <TemplateSettings EditTemplateID="TemplateEditCountry" />
				</obout:Column>
				<obout:Column ID="Column5" AllowEdit="true" AllowDelete="true" HeaderText="" Width="125" runat="server" />
			</Columns>
			
			<Templates>
				<obout:GridTemplate runat="server" ID="TemplateEditCountry" ControlID="hidCountries" ControlPropertyName="value">
				    <Template>
				        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="sds1" CssClass="ob_gEC" DataTextField="CountryName" DataValueField="CountryID" SelectionMode="Multiple">
				        </asp:ListBox>  
		        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Countries"
		            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		        </asp:SqlDataSource>
                        <input type="hidden" id="hidCountries" />
				    </Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>
        
        <br /><br /><br />
		
		<span class="tdText">
		   You can use the multiselect Listbox to select multiple countries for each record.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
